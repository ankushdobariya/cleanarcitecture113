import 'package:bloc/bloc.dart';
import 'package:cleanarcitecture113/core/failures_successes/failure.dart';
import 'package:cleanarcitecture113/core/service_locator.dart';
import 'package:cleanarcitecture113/features/show_news/domain/entities/news_info.dart';
import 'package:cleanarcitecture113/features/show_news/domain/usecases/fetch_news.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {

  NewsCubit() : super(NewsInitial(news: []));

  final FetchNewsUseCase _fetchNewsUseCase = sl<FetchNewsUseCase>();

  void fetchNews(String? searchText) async {

    emit(NewsLoading());
    final Either<Failure,List<NewsInfo>> fetchNewsResult = await _fetchNewsUseCase.fetchNews(searchText);
    fetchNewsResult.fold((l) {
      emit(NewsError());
    }, (news) {
      if(searchText != null)
        {
          emit(NewsInitialSearch(news: news));
        }else{
        emit(NewsInitial(news: news));
      }
    });
  }
}
