import 'package:flutter/material.dart';

import '../teslaNews/tesla_news_page.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xff3EB489),
          // image: DecorationImage(
          //   image: AssetImage("assets/images/background_image.png"),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 60),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              height: 350,
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      iconSize: 35,
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                    ),
                    TextField(
                      controller: myController,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        filled: false,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(24),
                            bottomLeft: Radius.circular(24),
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: "SEARCH LOCATION",
                        labelStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      "   Type the name of the city or country",
                      style: TextStyle(
                          color: Color(0xff686A6C),
                          fontSize: 20,
                          fontWeight: FontWeight.w100),
                    ),
                    const SizedBox(height: 100),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, myController.text);
                        },
                        child: Text("Search"),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
