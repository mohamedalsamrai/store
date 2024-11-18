import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/pages/home_page.dart';
import 'package:store/pages/notifications_page.dart';
import 'package:store/pages/orders_page.dart';
import 'package:store/pages/profile_page.dart';

class MenuTabBar extends StatefulWidget {
  const MenuTabBar({super.key});

  @override
  State<MenuTabBar> createState() => _MenuTabBarState();
}

class _MenuTabBarState extends State<MenuTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const NotificationsPage(),
    const OrdersPage(),
    const ProfilePage(),
  ];

  final List<String> icons = [
    "assets/icons/home-simple.svg",
    "assets/icons/bell-simple.svg",
    "assets/icons/OrderIcon.svg",
    "assets/icons/profile.svg",
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: pages.length, vsync: this);
  }

  Widget biuldIcon(String iconPath, bool isSelct) {
    return SvgPicture.asset(
      iconPath,
      width: 35,
      height: 35,
      color: isSelct ? const Color(0xff0D99FF) : const Color(0xff757575),
    );
  }

  List<NavigationDestination> pagesMenu() {
    return List.generate(
      pages.length,
      (index) => NavigationDestination(
          icon: biuldIcon(icons[index], selectedIndex == index), label: ""),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
            tabController.index = value;
          });
        },
        selectedIndex: selectedIndex,
        height: 65,
        indicatorColor: const Color(0xffffffff),
        backgroundColor: const Color(0xffffffff),
        destinations: pagesMenu(),
      ),
    );
  }
}
