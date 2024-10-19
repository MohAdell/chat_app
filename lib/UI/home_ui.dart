import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui';
import '../Contacts/UI/contacts_bar.dart';
import '../Contacts/UI/contacts_ui.dart';
import '../HomeMasseges/UI/HomeScreenChat.dart';
import '../Profile/logic/users_cubit.dart';
import '../Status/UI/Status_ui.dart';
import '../utils/routes.dart';
import 'calls_ui.dart';
import 'chat_ui.dart';

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
        // extendBody: true,
        // extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   elevation: 0.0,
        //   backgroundColor: Colors.black.withOpacity(0.1),
        //   leading: Padding(
        //     padding: const EdgeInsets.only(left: 20.0),
        //     child: Row(
        //       children: [
        //         Flexible(
        //           child: IconButton(
        //             onPressed: () {},
        //             icon: Icon(
        //               Icons.search,
        //               color: Colors.white,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        //   actions: [
        //     IconButton(
        //       onPressed: () {
        //         context.read<UsersCubit>().fetchAlluserWithoutme();
        //         Navigator.pushNamed(context, Routes.selectUserScreen);
        //       },
        //       icon: Image.asset(
        //         'assets/icons/add-user.png',
        //         height: 22,
        //         width: 22,
        //       ),
        //     ),
        //     IconButton(
        //       onPressed: () {},
        //       icon: Icon(Icons.more_vert),
        //     ),
        //   ],
        //   title: Center(
        //     child: Text(
        //       'Home',
        //       textAlign: TextAlign.center,
        //     ),
        //   ),
        // ),
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
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.settings),
            //   label: 'Settings',
            // ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    HomeScreenChat();
    MyHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        children: [
          // Status section
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ChatPage()));
            },
            child: Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildStatusItem('My Status'),
                  buildStatusItem('Adil'),
                  buildStatusItem('Marina'),
                  buildStatusItem('Dean'),
                  buildStatusItem('Max'),
                ],
              ),
            ),
          ),
          HomeScreenChat(),
          // Message list
          buildMessageItem(
              'Alex Linderson', 'How are you today?', '2 min ago', true),
          buildMessageItem(
              'John Ariah', 'How are you today?', '2 min ago', false),
          buildMessageItem(
              'Sabila Sayma', 'Have a good day 😊', '2 min ago', false),
        ],
      ),
    );
  }

  Widget buildStatusItem(String name) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.yellowAccent,
            child: Icon(Icons.person),
          ),
          SizedBox(height: 4),
          Text(name),
        ],
      ),
    );
  }

  Widget buildMessageItem(
      String sender, String message, String timestamp, bool unread) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.blue,
        child: Icon(Icons.person),
      ),
      title: Text(sender),
      subtitle: Text(message),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(timestamp),
          if (unread) Icon(Icons.mark_email_unread),
        ],
      ),
    );
  }
}
