import 'package:cleanarcitecture113/core/failures_successes/failure.dart';

import 'package:dartz/dartz.dart';

import '../entities/news_info.dart';

abstract class FetchRepo{

  Future<Either<Failure,List<NewsInfo>>> fetchNews(String? searchText);
}