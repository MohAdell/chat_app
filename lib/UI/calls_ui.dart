import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Contacts/UI/contacts_ui.dart';
import '../Profile/logic/users_cubit.dart';

class CallsUi extends StatefulWidget {
  const CallsUi({super.key});

  @override
  State<CallsUi> createState() => _CallsUiState();
}

class _CallsUiState extends State<CallsUi> {
  reloaded() {
    context.read<UsersCubit>().fetchAlluserWithoutme();
  }

  @override
  void initState() {
    reloaded();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Status section
        Container(
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

        // Message list
        buildMessageItem(
            'Alex Linderson', 'How are you today?', '2 min ago', true),
        buildMessageItem(
            'John Ariah', 'How are you today?', '2 min ago', false),
        buildMessageItem(
            'Sabila Sayma', 'Have a good day 😊', '2 min ago', false),
      ],
    );
  }

  Widget buildStatusItem(String name) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue,
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
