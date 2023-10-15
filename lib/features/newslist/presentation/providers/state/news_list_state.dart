import 'package:equatable/equatable.dart';
import 'package:news_app/shared/domain/models/news.dart';

enum NewsConcreteState {
  initial,
  loading,
  loaded,
  failure,
  fetchingMore,
  fetchedAll,
}

class NewsState extends Equatable {
  final List<News> newsList;
  final int total;
  final int page;
  final bool hasData;
  final NewsConcreteState state;
  final String message;

  const NewsState({
    this.newsList = const [],
    this.hasData = false,
    this.state = NewsConcreteState.initial,
    this.message = '',
    this.page = 1,
    this.total = 0,
  });

  const NewsState.initial({
    this.newsList = const [],
    this.total = 0,
    this.page = 1,
    this.hasData = false,
    this.state = NewsConcreteState.initial,
    this.message = '',
  });

  NewsState copyWith({
    List<News>? newsList,
    int? total,
    int? page,
    bool? hasData,
    NewsConcreteState? state,
    String? message,
  }) {
    return NewsState(
      newsList: newsList ?? this.newsList,
      total: total ?? this.total,
      page: page ?? this.page,
      hasData: hasData ?? this.hasData,
      state: state ?? this.state,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [newsList, page, hasData, state, message];
}
