import 'package:apotik/config/theme/app_theme.dart';
import 'package:apotik/features/dashboard/presentation/pages/history_page.dart';
import 'package:apotik/features/dashboard/presentation/pages/home_page.dart';
import 'package:apotik/features/dashboard/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: "F7EADF".toColor(),
      body: DashBoard.pageView.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: 'FFFBF5'.toColor(),
          unselectedItemColor: const Color.fromARGB(255, 139, 139, 139),
          selectedItemColor: ColorStyle.primaryColor,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
    );
  }
}

class DashBoard {
  static const List<Widget> pageView = <Widget>[
    HomePage(),
    HistoryPage(),
    ProfilePage()
  ];
}
