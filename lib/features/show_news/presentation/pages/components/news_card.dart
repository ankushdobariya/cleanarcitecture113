import 'package:cleanarcitecture113/core/constants/palette.dart';
import 'package:cleanarcitecture113/features/show_news/domain/entities/news_info.dart';
import 'package:cleanarcitecture113/features/show_news/presentation/pages/news_view_Page.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {

  final NewsInfo newsInfo;
  const NewsCard({Key? key,required this.newsInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          newsInfo.url!= null ? newsInfo.url! :
          '-- No Title -- ',
          maxLines: 2,
          style: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: palette.deepBlue,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NewsViewPage(newsInfo: newsInfo,);
            },));
          },
          child: Container(
            height: size.height * 0.32,
            width: size.width,
            margin: const EdgeInsets.only(bottom: 16),
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                      color: palette.grey,
                      ),
                  child: newsInfo.imageURL != null ?
                  Image.network(
                      newsInfo.imageURL!,
                    fit: BoxFit.cover,
                  ):const SizedBox()
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 0,
                  child: Container(
                    height: size.height * 0.08,
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        color: Colors.black12,
                      )
                    ]),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        newsInfo.title != null ? newsInfo.title! :
                        '-- No Title -- ',
                        maxLines: 2,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: palette.deepBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
