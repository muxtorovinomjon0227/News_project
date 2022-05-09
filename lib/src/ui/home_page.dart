import 'package:flutter/material.dart';
import 'package:news_project/src/ui/teslaNews/tesla_news_page.dart';

import 'currencyNews/currncy_news_page.dart';
import 'drawer/draver_page.dart';

class MainlyPage extends StatefulWidget {
  const MainlyPage({Key? key}) : super(key: key);

  @override
  State<MainlyPage> createState() => _MainlyPageState();
}

class _MainlyPageState extends State<MainlyPage> {
  int currentIndex = 0;
  final screens = const [
    HomePage(),
    CurrencyNewsPage(),
    Center(
      child: Text(
        "Day",
        style: TextStyle(fontSize: 40),
      ),
    ),
    Center(
      child: Text(
        "This",
        style: TextStyle(fontSize: 40),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text("News App"),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        iconSize: 25,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(
          () => currentIndex = index,
        ),
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.yellow,
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(
              Icons.attach_money,
            ),
            label: 'Money',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.yellow,
            icon: Icon(
              Icons.apps_outlined,
            ),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.yellow,
            icon: Icon(
              Icons.favorite_border_outlined,
            ),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
