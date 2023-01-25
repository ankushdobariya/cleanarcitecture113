import 'package:cleanarcitecture113/core/constants/palette.dart';
import 'package:cleanarcitecture113/features/show_news/domain/entities/news_info.dart';
import 'package:flutter/material.dart';

class NewsViewPage extends StatelessWidget {

  final NewsInfo newsInfo;

  const NewsViewPage({Key? key, required this.newsInfo}) : super(key: key);

  String _getDateInDDMMYYFormat(DateTime dateTime){
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: palette.background,
      appBar: AppBar(
        iconTheme: IconThemeData(color: palette.deepBlue),
        backgroundColor: palette.background,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                newsInfo.title != null ? newsInfo.title! : '-- No Title -- ',
                maxLines: 2,
                style: TextStyle(
                    color: palette.deepBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                height: size.height * 0.4,
                decoration: BoxDecoration(
                  color: palette.grey,
                ),
                child: newsInfo.imageURL != null
                    ? Image.network(
                        newsInfo.imageURL!,
                        fit: BoxFit.cover,
                      )
                    : SizedBox(),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                _getDateInDDMMYYFormat(newsInfo.dateTime),
                style: TextStyle(color: palette.lightGrey),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                newsInfo.author != null ? newsInfo.author!:
                '-- No author -- ',
                style: TextStyle(color: palette.lightGrey),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
               newsInfo.content != null ? newsInfo.content!:
                '-- No Content',
                style: TextStyle(color: palette.deepBlue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
