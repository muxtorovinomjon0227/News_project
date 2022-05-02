import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/src/ui/drawer/draver_page.dart';

import '../../data/models/currency_news_model.dart';
import '../../presentation/blocs/currencyNewsBloc/currency_news_bloc.dart';
import '../more_news/teslaNewsMore/tesla_more_news.dart';


class CurrencyNewsPage extends StatefulWidget {
  const CurrencyNewsPage({Key? key}) : super(key: key);

  @override
  State<CurrencyNewsPage> createState() => _CurrencyNewsPageState();
}

class _CurrencyNewsPageState extends State<CurrencyNewsPage> {
  @override
  Widget build(BuildContext context) {
    context.read<CurrencyNewsBloc>().add(FetchCurrencyNewsEvent());

    return Scaffold(
        drawer: const Drawer(
          child: DrawerPage(),
        ),
        appBar: AppBar(
          actions:  [IconButton(onPressed: (){}, icon: Icon(Icons.search),iconSize: 35,)],
          iconTheme: Theme.of(context).iconTheme.copyWith(
            color: Colors.white,
          ),
          title: Text("News App"),
        ),
        body: BlocConsumer<CurrencyNewsBloc, CurrencyNewsState>(
          listener: (context, state) {
            // Navigator.
          },
          builder: (context, state) {
            if (state is CurrencyNewsInitialState) {
              return buildLoading();
            }
            if (state is CurrencyNewsLodingState) {
              return buildLoading();
            }
            if (state is CurrencyNewsLodedState) {
              return buildUI(state.result);
            }
            if (state is CurrencyNewsErrorState) {
              return buildError(state.message);
            }
            return Container(
              child: Text("Hatolik topilmadi"),
            );
          },
        ));
  }

  Widget buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget buildUI(List<CurrencyNews> result) {
    return ListView.builder(
        itemCount: result.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              SizedBox(height: 3),
              Container(
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Color(0xffF8F8FF),
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  result[index].date.toString(),
                                  style: const TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    // Text(
                                    //     results.articles![index].publishedAt
                                    //         .toString()
                                    //         .substring(0, 10),
                                    //     style: TextStyle(
                                    //         color: Colors.blue, fontSize: 18)),
                                    // SizedBox(width: 10),
                                    // Text(
                                    //     results.articles![index].publishedAt
                                    //         .toString()
                                    //         .substring(11, 16),
                                    //     style: TextStyle(
                                    //         color: Colors.blue, fontSize: 18)),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () { Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const TeslaMoreNews()),
                                  );
                                  },
                                  child: Text(
                                    "more...",
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(Colors.blue),
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.all(1)),
                                      textStyle: MaterialStateProperty.all(
                                          const TextStyle(fontSize: 18))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 3),
              Container(
                color: Colors.black,
                width: double.infinity,
                height: 2,
              ),
            ],
          );
        });
  }

  Widget buildError(String error) {
    return Center(
        child: Text(
          error,
          style: const TextStyle(fontSize: 24),
        ));
  }
}

