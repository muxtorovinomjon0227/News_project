import 'package:flutter/material.dart';
import 'package:news_project/src/data/models/tesla_news_model.dart';
import 'package:url_launcher/url_launcher.dart';



class TeslaNewsMorePage extends StatelessWidget {
  final Articles _articles;
  int count = 0;
  final Uri _url = Uri.parse("https://www.reuters.com/technology/russian-users-sue-apple-after-payment-service-pulled-lawyers-2022-04-29/");

  TeslaNewsMorePage(this._articles, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildText(_articles),
      ),
      body:  Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/backgroundImage.png'),
          ),
        ),
        child: Center(child: details(_articles)),
      ),
    );
  }


  Widget details(Articles  results) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(results.urlToImage.toString()),
          Padding(
            padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(

                      results.publishedAt
                          .toString()
                          .substring(0, 10),
                      style: const TextStyle(
                          color: Colors.blue, fontSize: 18)),
                  const SizedBox(width: 10),
                  Text(
                      results.publishedAt
                          .toString()
                          .substring(11, 16),
                      style: const TextStyle(
                          color: Colors.blue, fontSize: 18)),
                ],
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10),

                Text(
                  results.title.toString(),style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),

                Text(
                  results.description.toString(),style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),

                Text(results.content.toString(),style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),

                Text(results.url.toString(),style: TextStyle(fontSize: 18),)
              ],
            )
          ),
          IconButton(onPressed: (){
            _launchUrl(_articles);
          }, icon: Icon(Icons.code),),

        ],
      ),
    );
  }


/// Build text AppBar ga qoyish uchun

  Text buildText(Articles  results){
    return Text(results.author.toString());
  }
/// Launcher icon web saytga o'tish uchun

  void _launchUrl(Articles articles) async {
    if (!await launchUrl(_url)) {
      throw Text("Not found");
    }
  }
}