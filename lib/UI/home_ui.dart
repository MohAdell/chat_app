import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import '../Contacts/UI/contacts_bar.dart';
import '../HomeMasseges/UI/HomeScreenChat.dart';
import '../Status/UI/Status_ui.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  int _selectedIndex = 0; //New

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // ContactsUi();
    super.initState();
  }

  static List<Widget> _pages = <Widget>[
    HomeScreenChat(),
    StatusUi(),
    StatusUi(),
    // CallsUi(),
    ContactsNavigationBarUi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: _pages.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 15,
          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped, //New
          fixedColor: Color(0xff3D4A7A),
          selectedIconTheme: IconThemeData(color: Color(0xff3D4A7A)),
          useLegacyColorScheme: false,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/chat-bubble.png',
                height: 30,
                width: 30,
              ),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/status2.png',
                height: 30,
                width: 30,
              ),
              label: 'Status',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/telephone.png',
                height: 30,
                width: 30,
              ),
              label: 'Calls',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/contact-book.png',
                height: 30,
                width: 30,
              ),
              label: 'Contacts',
            ),
          ],
        ),
      ),
    );
  }
}
