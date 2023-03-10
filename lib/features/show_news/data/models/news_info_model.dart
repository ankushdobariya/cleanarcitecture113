import 'package:cleanarcitecture113/features/show_news/domain/entities/news_info.dart';

class NewsInfoModel extends NewsInfo {

  NewsInfoModel({
    String? url,
    String? title,
    String? author,
    String? imageURL,
    String? content,
    String? dateTime,

}): super(
    url: url,
    title: title,
    author: author,
    imageURL: imageURL,
    content: content,
    dateTime: _getDateTimeInDateTime(dateTime),
  );
  static DateTime _getDateTimeInDateTime(String? dateTime){
    if(dateTime == null)
      {
        return DateTime.now();
      }else{
      final DateTime? dateTimeInDateTimeFormat = DateTime.tryParse(dateTime);
      if (dateTimeInDateTimeFormat == null)
        {
         return DateTime.now();
        }else{
        return dateTimeInDateTimeFormat;
      }
    }
  }
  factory NewsInfoModel.fromMap(Map<String,dynamic> map){
    return NewsInfoModel(
        url: map['url'],
        title: map['title'],
        author: map['author'],
        imageURL: map['urlToImage'],
        content: map['content'],
        dateTime: map['publishedAt'],
    );
  }
}