import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/src/data/repositores/news_repo.dart';
import 'package:news_project/src/home_page.dart';
import 'package:news_project/src/presentation/blocs/news_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(fontFamily: "prozalibre"),
      home: BlocProvider(
        create: (_) => NewsBloc(NewsRepositoryImp()),
        child:  const HomePage(),
      ),
    );
  }
}
