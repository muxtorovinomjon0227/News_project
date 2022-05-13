import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/currency_news_model.dart';

abstract class CurrencyNewsRepository {
  Future<List<CurrencyNews>> getCurrencyNews();
}

class CurrencyNewsRepositoryImp implements CurrencyNewsRepository{
  @override
  Future<List<CurrencyNews>> getCurrencyNews() async{
    var response = await http.get(Uri.parse("https://nbu.uz/uz/exchange-rates/json/"),);
    List<CurrencyNews> list = [];
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      (data as List).forEach((element) {
        list.add(CurrencyNews.fromJson(element));
      });

      return list;
    }

    throw UnimplementedError();
  }

}