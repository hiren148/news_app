import 'package:equatable/equatable.dart';
import 'package:news_app/shared/domain/models/news_source.dart';

enum NewsSourceConcreteState {
  initial,
  loading,
  loaded,
  failure,
}

class NewsSourceState extends Equatable{
  final List<NewsSource> sourceList;
  final NewsSourceConcreteState state;
  final String message;

  const NewsSourceState({
    this.sourceList = const [],
    this.state = NewsSourceConcreteState.initial,
    this.message = '',
  });

  const NewsSourceState.initial({
    this.sourceList = const [],
    this.state = NewsSourceConcreteState.initial,
    this.message = '',
  });

  NewsSourceState copyWith({
    List<NewsSource>? sourceList,
    NewsSourceConcreteState? state,
    String? message,
  }) {
    return NewsSourceState(
      sourceList: sourceList ?? this.sourceList,
      state: state ?? this.state,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [sourceList, state, message];
}
