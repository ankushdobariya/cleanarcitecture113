import 'package:cleanarcitecture113/core/failures_successes/failure.dart';
import 'package:cleanarcitecture113/core/service_locator.dart';
import 'package:cleanarcitecture113/features/show_news/domain/entities/news_info.dart';
import 'package:cleanarcitecture113/features/show_news/domain/repositories/fetch_repo_contract.dart';
import 'package:dartz/dartz.dart';

class FetchNewsUseCase{

  final FetchRepo fetchRepo = sl<FetchRepo>();


    Future<Either<Failure,List<NewsInfo>>> fetchNews(String? searchText){
      return fetchRepo.fetchNews(searchText);
    }
 }


