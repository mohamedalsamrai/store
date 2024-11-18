import 'package:flutter/material.dart';
import 'package:store/pages/home_page.dart';

void main() {
  runApp(const Store());
}

class Store extends StatelessWidget {
  const Store({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xffffffff),
          appBarTheme: AppBarTheme(color: Color(0xffffffff))),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
