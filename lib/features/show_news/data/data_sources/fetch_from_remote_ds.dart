import 'package:cleanarcitecture113/core/constants/strings.dart';
import 'package:cleanarcitecture113/core/failures_successes/exceptions.dart';
import 'package:cleanarcitecture113/core/service_locator.dart';
import 'package:cleanarcitecture113/core/services/api_services.dart';
import 'package:cleanarcitecture113/features/show_news/data/models/news_info_model.dart';

abstract class FetchFromRemoteDs{

  Future<List<NewsInfoModel>> fetchNews(String? searchText);

}

class FetchFromRemoteDsImpl implements FetchFromRemoteDs{

  final ApiService apiService = sl<ApiService>();

  @override
  Future<List<NewsInfoModel>> fetchNews(String? searchText) async {
    try{
      Map<String,dynamic> data =await apiService.getData(
        searchText != null ? Strings.apiEverything : Strings.apiTopHeadlines,
        {
          'apiKey': Strings.apiKey,
           if(searchText == null)'country':['IN','US'],
          if(searchText != null) 'q':searchText,
        }
      );
      List list = data['articles'];
      List<Map<String,dynamic>> mapList = [];
      for(int i=0; i<list.length;i++)
      {
        Map<String,dynamic> map = list[i] as Map<String,dynamic>;
        mapList.add(map);
      }

      List<NewsInfoModel> news =[];
      for(int i=0; i<mapList.length;i++)
      {
        NewsInfoModel newsInfoModel = NewsInfoModel.fromMap(mapList[i]);
        news.add(newsInfoModel);
      }
      return news;
    }catch(e){
      throw FetchException(message:'failed to get data');
    }
  }
}