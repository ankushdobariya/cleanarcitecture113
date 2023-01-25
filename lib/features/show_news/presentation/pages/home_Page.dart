import 'package:cleanarcitecture113/core/constants/palette.dart';
import 'package:cleanarcitecture113/features/show_news/presentation/news_cubit.dart';
import 'package:cleanarcitecture113/features/show_news/presentation/pages/components/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<NewsCubit>().fetchNews(null);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: palette.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: palette.background,
        title: Text(
          "News",
          style: TextStyle(
              color: palette.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextField(
              onChanged: (searchText) {
                if (searchText.trim() == '') {
                  context.read<NewsCubit>().fetchNews(null);
                } else {
                  context.read<NewsCubit>().fetchNews(searchText);
                }
              },
              cursorColor: palette.black,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search, color: palette.lightGrey, size: 20,),
                hintText: "search",
                hintStyle: TextStyle(
                    color: palette.lightGrey
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: palette.lightGrey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: palette.black)),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
              if (state is NewsInitial) {
                return Text(
                  "Top News",
                  style: TextStyle(
                      color: palette.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                );
              } else if(state is NewsInitialSearch) {
               return  Text(
                  "Search News",
                  style: TextStyle(
                      color: palette.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                );
            }else{
                return const SizedBox();
              }
            },),
            SizedBox(
              height: size.height * 0.01,
            ),
            Expanded(
                child: BlocBuilder<NewsCubit, NewsState>(
                  builder: (context, state) {
                    if (state is NewsInitial) {
                      return ListView.builder(
                        itemCount: state.news.length,
                        itemBuilder: (context, index) {
                          return NewsCard(newsInfo: state.news[index],);
                        },);
                    } else if (state is NewsInitialSearch) {
                      return ListView.builder(
                        itemCount: state.news.length,
                        itemBuilder: (context, index) {
                          return NewsCard(newsInfo: state.news[index],);
                        },);
                    }
                    else if (state is NewsLoading) {
                      return const Center(child: CircularProgressIndicator(),);
                    } else {
                      return  Center(child: IconButton(onPressed: () {
                        context.read<NewsCubit>().fetchNews(null);
                      }, icon: const Icon(Icons.replay),color: palette.deepBlue,iconSize: 24,));
                    }
                  },)
            )
          ],
        ),
      ),
    );
  }
}
