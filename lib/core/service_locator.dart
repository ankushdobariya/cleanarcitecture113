import 'package:cleanarcitecture113/core/services/api_services.dart';
import 'package:cleanarcitecture113/features/show_news/data/data_sources/fetch_from_remote_ds.dart';
import 'package:cleanarcitecture113/features/show_news/data/repositories/fetch_repo_impl.dart';
import 'package:cleanarcitecture113/features/show_news/domain/repositories/fetch_repo_contract.dart';
import 'package:cleanarcitecture113/features/show_news/domain/usecases/fetch_news.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void setUpServices(){
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<ApiService>(ApiServiceImpl());
  sl.registerSingleton<FetchFromRemoteDs>(FetchFromRemoteDsImpl());
  sl.registerSingleton<FetchRepo>(FetchRepoImpl());
  sl.registerSingleton<FetchNewsUseCase>(FetchNewsUseCase());
}