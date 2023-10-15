import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/newslist/domain/providers/news_providers.dart';
import 'package:news_app/features/newslist/presentation/providers/state/news_source_notifier.dart';
import 'package:news_app/features/newslist/presentation/providers/state/news_source_state.dart';

final newsSourceNotifierProvider =
    StateNotifierProvider<NewsSourceNotifier, NewsSourceState>((ref) {
  final repository = ref.watch(newsRepositoryProvider);
  return NewsSourceNotifier(repository)..fetchNewsSources();
});
