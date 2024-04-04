import 'package:apotik/config/theme/app_theme.dart';
import 'package:apotik/features/dashboard/presentation/bloc/transaksi_history_bloc/transaksi_history_bloc.dart';
import 'package:apotik/features/dashboard/presentation/pages/history_page.dart';
import 'package:apotik/features/dashboard/presentation/pages/home_page.dart';
import 'package:apotik/features/dashboard/presentation/pages/profile_page.dart';
import 'package:apotik/features/login/data/models/local/local_login.dart';
import 'package:apotik/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supercharged/supercharged.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    GetIt.instance<LocalLogin>().getUserId().then((value) {
      context
          .read<TransaksiHistoryBloc>()
          .add(GetTransaksi(idCustomer: int.parse(value)));
    });
  }

  int selectedIndex = 0;
  bool notLogin = false;
  void onItemTapped(int index) {
    GetIt.instance<LocalLogin>().getNama().then((value) {
      if (value == "null") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text("Anda Harus Melakukan Login Terlebih Dahulu"),
          ),
        );
        setState(() {
          notLogin = true;
        });
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      } else {
        setState(() {
          selectedIndex = index;
        });
      }
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
