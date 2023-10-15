import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/newslist/domain/providers/news_providers.dart';
import 'package:news_app/features/newslist/presentation/providers/state/news_list_notifier.dart';
import 'package:news_app/features/newslist/presentation/providers/state/news_list_state.dart';

final newsNotifierProvider =
    StateNotifierProvider<NewsNotifier, NewsState>((ref) {
  final repository = ref.watch(newsRepositoryProvider);
  return NewsNotifier(repository)..fetchNews();
});
