import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/newslist/data/datasource/news_remote_datasource.dart';
import 'package:news_app/features/newslist/data/repositories/news_repository.dart';
import 'package:news_app/features/newslist/domain/repositories/news_repository.dart';
import 'package:news_app/shared/data/remote/network_service.dart';
import 'package:news_app/shared/domain/providers/dio_network_service_provider.dart';

final newsDatasourceProvider = Provider.family<NewsDatasource, NetworkService>(
  (_, networkService) => NewsRemoteDatasource(networkService),
);

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final networkService = ref.watch(netwokServiceProvider);
  final datasource = ref.watch(newsDatasourceProvider(networkService));
  final respository = NewsRepositoryImpl(datasource);

  return respository;
});
