import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/newslist/presentation/providers/news_list_state_provider.dart';
import 'package:news_app/features/newslist/presentation/providers/news_source_state_provider.dart';
import 'package:news_app/features/newslist/presentation/providers/state/news_list_state.dart';
import 'package:news_app/features/newslist/presentation/widgets/news_item.dart';
import 'package:news_app/features/newslist/presentation/widgets/news_list_filter.dart';

class NewsListPage extends ConsumerStatefulWidget {
  const NewsListPage({super.key});

  @override
  ConsumerState<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends ConsumerState<NewsListPage> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollControllerListener);
  }

  void scrollControllerListener() {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      final notifier = ref.read(newsNotifierProvider.notifier);
      notifier.fetchNews(
          sourceList: ref.read(newsSourceNotifierProvider).sourceList);
    }
  }

  void refreshScrollControllerListener() {
    scrollController.removeListener(scrollControllerListener);
    scrollController.addListener(scrollControllerListener);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(newsNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Top-Headlines'),
      ),
      body: Column(
        children: [
          const NewsListFilter(),
          Container(
            height: 1.0,
            color: Colors.grey,
          ),
          Expanded(
            child: state.state == NewsConcreteState.loading
                ? const Center(child: CircularProgressIndicator())
                : state.hasData
                    ? Column(
                        children: [
                          Expanded(
                            child: Scrollbar(
                              controller: scrollController,
                              child: ListView.separated(
                                itemBuilder: (context, index) => NewsItem(
                                    newsItem: state.newsList[index]),
                                separatorBuilder: (_, __) => const Divider(),
                                itemCount: state.newsList.length,
                                controller: scrollController,
                              ),
                            ),
                          ),
                          if (state.state == NewsConcreteState.fetchingMore)
                            const Padding(
                              padding: EdgeInsets.only(bottom: 16.0),
                              child: CircularProgressIndicator(),
                            ),
                        ],
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22.0),
                          child: Text(
                            state.message,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
