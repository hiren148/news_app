import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/newslist/domain/repositories/news_repository.dart';
import 'package:news_app/features/newslist/presentation/providers/state/news_list_state.dart';
import 'package:news_app/shared/data/remote/mapper/network_to_entity_mapper.dart';
import 'package:news_app/shared/data/remote/model/news.dart';
import 'package:news_app/shared/domain/models/news_source.dart';
import 'package:news_app/shared/domain/models/paginated_response.dart';
import 'package:news_app/shared/exceptions/http_exception.dart';

class NewsNotifier extends StateNotifier<NewsState> {
  final NewsRepository repository;

  NewsNotifier(
    this.repository,
  ) : super(const NewsState.initial());

  bool get isFetching =>
      state.state != NewsConcreteState.loading &&
      state.state != NewsConcreteState.fetchingMore;

  Future<void> fetchNews({List<NewsSource>? sourceList}) async {
    if (isFetching && state.state != NewsConcreteState.fetchedAll) {
      state = state.copyWith(
        state: state.page > 1
            ? NewsConcreteState.fetchingMore
            : NewsConcreteState.loading,
      );

      final response = await repository.getNewsList(
          page: state.page,
          selectedSources: getSelectedSources(sourceList));

      updateStateFromResponse(response);
    }
  }

  void updateStateFromResponse(
      Either<AppException, PaginatedResponse<dynamic>> response) {
    response.fold((failure) {
      state = state.copyWith(
        state: NewsConcreteState.failure,
        message: failure.message,
      );
    }, (data) {
      final newsList =
          data.data.map((e) => NewsNetModel.fromJson(e).toEntity()).toList();

      final allNewsList = [...state.newsList, ...newsList];

      state = state.copyWith(
        newsList: allNewsList,
        state: allNewsList.length == data.total
            ? NewsConcreteState.fetchedAll
            : NewsConcreteState.loaded,
        hasData: true,
        message: allNewsList.isEmpty ? 'No news found' : '',
        page: 1 + allNewsList.length ~/ perPageLimit,
        total: data.total,
      );
    });
  }

  void resetState() {
    state = const NewsState.initial();
  }

  List<NewsSource>? getSelectedSources(List<NewsSource>? sourceList) {
    if(sourceList == null){
      return null;
    }
    return sourceList.where((element) => element.isSelected).toList();
  }
}
