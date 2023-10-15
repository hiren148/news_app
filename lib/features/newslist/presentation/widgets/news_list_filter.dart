import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/newslist/presentation/providers/news_list_state_provider.dart';
import 'package:news_app/features/newslist/presentation/providers/news_source_state_provider.dart';
import 'package:news_app/features/newslist/presentation/providers/state/news_source_state.dart';

class NewsListFilter extends ConsumerWidget {
  const NewsListFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newsSourceNotifierProvider);
    switch (state.state) {
      case NewsSourceConcreteState.failure:
        return Text(
          state.message,
        );
      case NewsSourceConcreteState.loaded:
        return SizedBox(
          height: 56.0,
          child: Row(
            children: [
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 8.0,
                  ),
                  itemCount: state.sourceList.length,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  itemBuilder: (context, index) {
                    final item = state.sourceList[index];
                    return FilterChip(
                      label: Text(item.name),
                      onSelected: (selected) {
                        ref
                            .read(newsSourceNotifierProvider.notifier)
                            .updateSourceSelection(item, selected);
                        ref.read(newsNotifierProvider.notifier).resetState();
                        ref.read(newsNotifierProvider.notifier).fetchNews(
                            sourceList: ref
                                .read(newsSourceNotifierProvider)
                                .sourceList);
                      },
                      selected: item.isSelected,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Container(
                width: 1.0,
                color: Colors.grey,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.0,
                ),
              ),
              const Icon(
                Icons.filter_alt,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.0,
                ),
              ),
            ],
          ),
        );
      case NewsSourceConcreteState.initial:
      case NewsSourceConcreteState.loading:
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}
