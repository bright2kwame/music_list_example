import 'package:flutter/material.dart';
import 'package:music_list/music_list_page.dart';
import 'package:music_list/notifications_page.dart';
import 'package:music_list/payment_page.dart';
import 'package:music_list/settings_page.dart';

class MusicHomePage extends StatefulWidget {
  const MusicHomePage({super.key});

  @override
  State<MusicHomePage> createState() => _MusicHomePageState();
}

class _MusicHomePageState extends State<MusicHomePage> {
  int activeIndex = 0;
  List<Widget> pages = [
    MuscListPage(),
    PaymentPage(),
    NotificationsPage(),
    SettingsPage()
  ];

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  final AppBar _topAppBar = AppBar(
    elevation: 4,
    backgroundColor: Colors.black,
    leadingWidth: 150,
    leading: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        "Tracks",
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      backgroundColor: Colors.black,
      drawer: _myAppDrawer(),
      bottomNavigationBar: _myAppBar(),
      appBar: _topAppBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          ElevatedButton(onPressed: _openAppDrawer, child: Text("Open Menu")),
      body: pages[activeIndex],
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _myAppBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.credit_card), label: "Payments"),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: "Notifications"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
      ],
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: (index) {
        setState(() {
          activeIndex = index;
        });
      },
      currentIndex: activeIndex,
    );
  }

  void _openAppDrawer() {
    _scaffoldState.currentState!.openDrawer();
  }

  Widget _myAppDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      width: 240,
      child: Column(
        children: [
          DrawerHeader(
              child: ListTile(
            onTap: () {
              print("Action on");
              Navigator.of(context).pop();
            },
            leading: Icon(Icons.person),
          ))
        ],
      ),
    );
  }
}
