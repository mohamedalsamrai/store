import 'package:flutter/material.dart';
import 'package:store/pages/home_page.dart';
import 'package:store/pages/menu_tab_bar.dart';

void main() {
  runApp(const Store());
}

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xffffffff),
          appBarTheme: AppBarTheme(color: Color(0xffffffff))),
      debugShowCheckedModeBanner: false,
      home: MenuTabBar(),
    );
  }
}
