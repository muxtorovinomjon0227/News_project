import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/src/data/domain/singUpPages/login/login_page.dart';
import 'package:news_project/src/data/repositores/currency_news_repo.dart';
import 'package:news_project/src/data/repositores/image_repo.dart';
import 'package:news_project/src/data/repositores/news_repo.dart';
import 'package:news_project/src/presentation/blocs/currencyNewsBloc/currency_news_bloc.dart';
import 'package:news_project/src/presentation/blocs/imagesBloc/images_bloc.dart';
import 'package:news_project/src/presentation/blocs/news_bloc.dart';
import 'package:news_project/src/ui/home_page.dart';
import 'package:news_project/src/ui/pages/teslaNews/tesla_news_page.dart';


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
    return MaterialApp(
      theme: ThemeData(fontFamily: "inter",),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => NewsBloc(NewsRepositoryImp()),
          ),
          BlocProvider(
            create: (_) => CurrencyNewsBloc(CurrencyNewsRepositoryImp()),
          ),
          BlocProvider(
            create: (_) => ImagesBloc(ImagesRepositoryImp()),
          ),
        ],
        child: const HomePage(),

        // Scaffold(
        //   body: Container(
        //     decoration: const BoxDecoration(
        //       gradient: LinearGradient(
        //           begin: Alignment.topLeft,
        //           end: Alignment.bottomRight,
        //           colors: [Colors.teal,Colors.deepOrangeAccent,Colors.greenAccent,Colors.amberAccent,Colors.purpleAccent,Colors.lightGreen]
        //       ),
        //     ),
        //     child: Center(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: [
        //           SizedBox(height: 100),
        //
        //
        //           const  Text("Assalomu alaykum! \n"
        //               "Bizning Yangliklar Ilovamizga \n"
        //               "xush kelipsiz!",style: TextStyle(fontSize: 20,color: Colors.white)),
        //           SizedBox(height: 10),
        //           const  Text("Siz bu yerda o'zingizni \n"
        //               "qiziqtirgan yangliklardan \n"
        //               "habardor bolishizngiz mumkin\n"
        //               "pastda o'zingizga kerakli bo'lgan\n"
        //               "bo'limni tanlang ",style: TextStyle(fontSize: 20,color: Colors.white)),
        //
        //
        //           SizedBox(height: 40),
        //           Center(
        //             child: ElevatedButton(onPressed: (){
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(builder: (context) =>  const CurrencyNewsPage()),
        //               );
        //
        //             }, child: const Text("Go to Apple news"),),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
