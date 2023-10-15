import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/newslist/domain/repositories/news_repository.dart';
import 'package:news_app/features/newslist/presentation/providers/state/news_source_state.dart';
import 'package:news_app/shared/domain/models/news_source.dart';

class NewsSourceNotifier extends StateNotifier<NewsSourceState> {
  final NewsRepository repository;

  NewsSourceNotifier(
    this.repository,
  ) : super(const NewsSourceState.initial());

  Future<void> fetchNewsSources() async {
    if (state.state != NewsSourceConcreteState.loading &&
        state.state != NewsSourceConcreteState.loaded) {
      state = state.copyWith(
        state: NewsSourceConcreteState.loading,
      );

      final response = await repository.getNewsSources();
      response.fold((failure) {
        state = state.copyWith(
          state: NewsSourceConcreteState.failure,
          message: failure.message,
        );
      }, (data) {
        state = state.copyWith(
          sourceList: data,
          state: NewsSourceConcreteState.loaded,
        );
      });
    }
  }

  void updateSourceSelection(NewsSource source, bool isSelected) {
    state = state.copyWith(
      sourceList: state.sourceList
          .map((e) =>
              e.id == source.id ? source.copy(isSelected: isSelected) : e)
          .toList(),
    );
  }
}
