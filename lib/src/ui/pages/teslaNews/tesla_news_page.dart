import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/src/data/models/tesla_news_model.dart';
import 'package:news_project/src/presentation/blocs/news_bloc.dart';

import '../../drawer/draver_page.dart';
import '../more_news/tesla_news_more_page.dart';
import '../search/search_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String newCity = "google";


  Articles _selectedArticlas = Articles();

  void initState() {
    super.initState();
    context.read<NewsBloc>().add(FetchTeslaNewsEvent(newCity));
  }
  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
        displacement: 250,
        backgroundColor: Colors.white,
        color: Colors.black,
        strokeWidth: 3,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
      fetchData();
      await Future.delayed(Duration(microseconds: 1500));
    },
    child:Scaffold(
        drawer: const Drawer(
          child: DrawerPage(),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                showSearch();
              },
              icon: Icon(Icons.search),
              iconSize: 35,
            )
          ],
          iconTheme: Theme
              .of(context)
              .iconTheme
              .copyWith(
            color: Colors.white,
          ),
          title: Text("News App"),
        ),
        body: BlocConsumer<NewsBloc, NewsState>(
          listener: (context, state) {
            // Navigator.
          },
          builder: (context, state) {
            if (state is NewsInitialState) {
              return buildLoading();
            }
            if (state is NewsLodingState) {
              return buildLoading();
            }
            if (state is NewsLodedState) {
              return buildUI(state.results);
            }
            if (state is NewsErrorState) {
              return buildError(state.message);
            }
            return Container(
              child: Text("Hatolik topilmadi"),
            );
          },
        )
    ),
    );
  }

  Widget buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget buildUI(TeslaNews results) {
    return ListView.builder(
        itemCount: results.articles!.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
               const SizedBox(height: 3),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      color: const Color(0xffF8F8FF),
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 170,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.redAccent,
                            ),
                            child: Image.network(
                              results.articles![index].urlToImage.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  results.articles![index].title.toString().substring(0, 10),
                                  style: const TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                        results.articles![index].publishedAt
                                            .toString()
                                            .substring(0, 10),
                                        style: const TextStyle(
                                            color: Colors.blue, fontSize: 18)),
                                     const SizedBox(width: 10),
                                    Text(
                                        results.articles![index].publishedAt
                                            .toString()
                                            .substring(11, 16),
                                        style: const TextStyle(
                                            color: Colors.blue, fontSize: 18)),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => TeslaNewsMorePage(_selectedArticlas)));
                                      _selectedArticlas=results.articles![index];
                                    });
                                    },
                                  child:   const  Text(
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
             const SizedBox(height: 3),
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
  void showSearch() async {
    newCity = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchPage()),
    );
    fetchData();
  }

  void fetchData() {
    context.read<NewsBloc>().add(FetchTeslaNewsEvent(newCity));
  }
}
