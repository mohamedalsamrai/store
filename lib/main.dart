import 'package:flutter/material.dart';
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
          colorSchemeSeed: Color(0xff007AFF),
          scaffoldBackgroundColor: const Color(0xffffffff),
          appBarTheme: const AppBarTheme(
              color: Color(0xffffffff), surfaceTintColor: Color(0xffffffff))),
      debugShowCheckedModeBanner: false,
      home: const MenuTabBar(),
    );
  }
}
