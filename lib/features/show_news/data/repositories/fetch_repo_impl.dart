import 'package:cleanarcitecture113/core/failures_successes/exceptions.dart';
import 'package:cleanarcitecture113/core/failures_successes/failure.dart';
import 'package:cleanarcitecture113/core/service_locator.dart';
import 'package:cleanarcitecture113/features/show_news/data/data_sources/fetch_from_remote_ds.dart';
import 'package:cleanarcitecture113/features/show_news/domain/entities/news_info.dart';
import 'package:cleanarcitecture113/features/show_news/domain/repositories/fetch_repo_contract.dart';
import 'package:dartz/dartz.dart';

class FetchRepoImpl implements FetchRepo{
  final FetchFromRemoteDs fetchFromRemoteDs = sl<FetchFromRemoteDs>();
  @override
  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText) async {
    try{
      return Right(await fetchFromRemoteDs.fetchNews(searchText));
    } on FetchException catch (e){
      return left(FetchFailure(message: e.message));
    }
  }
}