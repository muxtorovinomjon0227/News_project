import 'package:flutter/material.dart';

class TeslaMoreNews extends StatefulWidget {
  const TeslaMoreNews({Key? key}) : super(key: key);

  @override
  State<TeslaMoreNews> createState() => _TeslaMoreNewsState();
}

class _TeslaMoreNewsState extends State<TeslaMoreNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Salom",style: TextStyle(fontSize: 45),),
      ),
    );
  }
}
