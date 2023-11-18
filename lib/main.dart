import 'package:flutter/material.dart';

import 'page/favorite_page.dart';
import 'page/people_page.dart';
import 'widget/custom_button.dart';
import 'widget/custom_navigation_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Navigation Drawer';
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: const MainPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        // '/user':(context)=>UserPage(
        //       name: 'Sarah Bright',
        //       urlImage: urlImage,
        // ),
        '/people': (context) => const PeoplePage(),
        '/favorite': (context) => const FavoritePage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainPage> {
  @override
  Widget build(context) => Scaffold(
        drawer: const CustomNavigationDrawer(),
        //endDrawer: CustomNavigationDrawer(),
        appBar: AppBar(title: const Text(MyApp.title)),
        body: Builder(builder: (context) {
          return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: CustomButton(
                  icon: Icons.open_in_new,
                  text: 'Open Drawer',
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                    // Scaffold.of(context).openEndDrawer();
                  }));
        }),
      );
}
