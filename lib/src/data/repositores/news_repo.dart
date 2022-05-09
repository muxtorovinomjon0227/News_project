import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/tesla_news_model.dart';

abstract class NewsRepository {
  Future<TeslaNews> getTeslaNews();
}

class NewsRepositoryImp implements NewsRepository{
  @override
  Future<TeslaNews> getTeslaNews() async{
    var response = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=apple&from=2022-04-29&to=2022-04-29&sortBy=popularity&apiKey=e2d02348965a4648b2b432e8831b0c85"),);
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      TeslaNews results = TeslaNews.fromJson(data);
      return results;
    }
    throw UnimplementedError();
  }
  
}