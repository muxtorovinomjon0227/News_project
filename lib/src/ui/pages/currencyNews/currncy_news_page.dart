import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/src/ui/widgets/get_flag.dart';

import '../../../data/models/currency_news_model.dart';
import '../../../presentation/blocs/currencyNewsBloc/currency_news_bloc.dart';
import '../../drawer/draver_page.dart';

class CurrencyNewsPage extends StatefulWidget {
  const CurrencyNewsPage({Key? key}) : super(key: key);

  @override
  State<CurrencyNewsPage> createState() => _CurrencyNewsPageState();
}

class _CurrencyNewsPageState extends State<CurrencyNewsPage> {
  @override
  Widget build(BuildContext context) {
    context.read<CurrencyNewsBloc>().add(FetchCurrencyNewsEvent());

    return RefreshIndicator(
      displacement: 250,
      backgroundColor: Colors.white,
      color: Colors.black,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        await Future.delayed(Duration(microseconds: 1500));
      },
      child: Scaffold(
        drawer: const Drawer(
          child: DrawerPage(),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              iconSize: 35,
            )
          ],
          iconTheme: Theme.of(context).iconTheme.copyWith(
                color: Colors.white,
              ),
          title: Text("Currency News"),
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
        ),
      ),
    );
  }

  Widget buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget buildUI(List<CurrencyNews> result) {
    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 48,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              width: double.infinity,
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(getFlags(result, index),
                              height: 45, width: 50),
                          SizedBox(width: 20),
                          Text(result[index].code.toString()),
                        ],
                      ),
                      Icon(Icons.add_alert, color: Colors.black26),
                    ],
                  ),
                  Text(result[index].title.toString()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("MB kursi"),
                          Text(result[index].cbPrice.toString())
                        ],
                      ),
                      Column(
                        children: [
                          Text("Sotib olish"),
                          Text(result[index].cbPrice.toString())
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Sotish",
                          ),
                          Text(((result[index].cbPrice)).toString())
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildError(String error) {
    return Center(
        child: Text(
      error,
      style: const TextStyle(fontSize: 24),
    ));
  }
}
