import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../teslaNews/tesla_news_page.dart';


class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Padding(
              padding: EdgeInsets.only(left: 1,top: 20),
              child: IconButton(
                onPressed: (){
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Image.asset("assets/language.png",height: 25,width: 25,),
                SizedBox(width: 15),
                Text("Language",style: TextStyle(fontSize: 18),),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Image.asset("assets/sitings.png",height: 25,width: 25,),
                SizedBox(width: 15),
                Text("Sittings",style: TextStyle(fontSize: 18),),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Image.asset("assets/country.png",height: 25,width: 25,),
                SizedBox(width: 15),
                Text("Country",style: TextStyle(fontSize: 18),),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Image.asset("assets/love.png",height: 25,width: 25,),
                SizedBox(width: 15),
                Text("Love",style: TextStyle(fontSize: 18),),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Image.asset("assets/save.png",height: 25,width: 25,),
                SizedBox(width: 15),
                Text("Save",style: TextStyle(fontSize: 18),),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Image.asset("assets/alarm_clock.png",height: 25,width: 25,),
                SizedBox(width: 15),
                Text("Alarm clock",style: TextStyle(fontSize: 18),),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Image.asset("assets/add.png",height: 25,width: 25,),
                SizedBox(width: 15),
                Text("Add",style: TextStyle(fontSize: 18),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
