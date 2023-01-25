import 'package:cleanarcitecture113/core/constants/palette.dart';
import 'package:cleanarcitecture113/core/service_locator.dart';
import 'package:cleanarcitecture113/features/show_news/presentation/news_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// https://itnext.io/flutter-clean-architecture-b53ce9e19d5a
import 'features/show_news/presentation/pages/home_Page.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  setUpServices();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) {
        return NewsCubit();
      },)
    ], child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News app",
      theme: ThemeData(
          colorScheme: const ColorScheme.light().copyWith(
              secondary: palette.deepBlue
          )
      ),
      home: const HomePage(),
    ));
  }
}
