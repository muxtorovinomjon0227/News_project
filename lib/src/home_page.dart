import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/src/data/models/tesla_news_model.dart';
import 'package:news_project/src/presentation/blocs/news_bloc.dart';
import 'package:news_project/src/ui/drawer/draver_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    context.read<NewsBloc>().add(FetchTeslaNewsEvent());

    return Scaffold(
        drawer: Drawer(
          child: DrawerPage(),
        ),
        appBar: AppBar(
          actions: [
            Icon(Icons.search)
          ],
          iconTheme: Theme.of(context).iconTheme.copyWith(
            color: Colors.white,
          ),
          title: Text("Movie App"),
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
        ));
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
              Container(
                color: Colors.white,
                width: double.infinity,
                height: 2,
              ),
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
                          Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.redAccent,
                            ),
                            child: Image.network(
                                  results.articles![index].urlToImage
                                      .toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              results.articles![index].title.toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Text(results.articles![index].title!),

                        ],
                      ),

                    ],
                  ),
                ),
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
