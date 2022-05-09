import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/currency_news_model.dart';

abstract class CurrencyNewsRepository {
  Future<CurrencyNews> getCurrencyNews();
}

class CurrencyNewsRepositoryImp implements CurrencyNewsRepository{
  @override
  Future<CurrencyNews> getCurrencyNews() async{
    var response = await http.get(Uri.parse("https://nbu.uz/uz/exchange-rates/json/"),);
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      CurrencyNews results = CurrencyNews.fromJson(data);
      return results;
    }

    throw UnimplementedError();
  }

}