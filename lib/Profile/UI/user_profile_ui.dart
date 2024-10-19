import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/users_info.dart';
import 'Personal_Profile_Ui.dart';

class UserProfileUi extends StatefulWidget {
  const UserProfileUi({super.key});

  @override
  State<UserProfileUi> createState() => _UserProfileUiState();
}

class _UserProfileUiState extends State<UserProfileUi> {
  late final UserProfile usersProfil;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: Color(0xffffffff)),
        // color: Color(0xffffffff),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/user-avatar.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dear Programmer",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "FLUTTER",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )),
                SizedBox(
                  width: 80,
                  height: 40,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade100,
                              Colors.blue.shade400
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blue,
                              blurRadius: 2,
                              offset: Offset(0, 2))
                        ]),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => PersonalProfileUi()));
                      },
                      minWidth: double.maxFinite,
                      height: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      textColor: Color(0xff1a2b79),
                      child: Text(
                        'Edit',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Material(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: ListTile(
                    title: Text('123'),
                    subtitle: Text('Frineds'),
                  )),
                  Expanded(
                      child: ListTile(
                    title: Text('5647'),
                    subtitle: Text('Followers'),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(color: Colors.blue.shade400, blurRadius: 2)
                  ]),
              child: Column(
                children: [
                  Text(
                    'Account',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
