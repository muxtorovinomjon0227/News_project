import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_project/src/data/models/new_images_models.dart';

abstract class ImagesRepository {
  Future<List<NewImages>> getImages();
}

class ImagesRepositoryImp implements ImagesRepository{
  @override
  Future<List<NewImages>> getImages() async{
    var response = await http.get(Uri.parse("https://api.unsplash.com/photos/?client_id=FJOVg1tv8bpihtsP_NJ-y77wqrT7edfYmoz8LyVBRhA"),);
    List<NewImages> list = [];
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      (data as List).forEach((element) {
        list.add(NewImages.fromJson(element));
      });

      return list;
    }
    throw UnimplementedError();
  }

}