import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/users_info.dart';

class PersonalProfileUi extends StatefulWidget {
  const PersonalProfileUi({
    super.key,
  });

  @override
  State<PersonalProfileUi> createState() => _PersonalProfileUiState();
}

class _PersonalProfileUiState extends State<PersonalProfileUi> {
  late final UserProfile personalProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Data'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/user-avatar.png'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 35,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/user-profile.png',
                      height: 20,
                      width: 20,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Dear Programmer',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 35,
                child: Row(
                  children: [
                    Icon(
                      Icons.mail,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'testmail@gmail.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 35,
                child: Row(
                  children: [
                    Icon(
                      Icons.male,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Male',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 35,
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '08/09/2000',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
              SizedBox(
                width: 250,
                height: 60,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blue.shade100, Colors.blue.shade400],
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
                    onPressed: () {},
                    minWidth: double.maxFinite,
                    height: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    textColor: Color(0xff1a2b79),
                    child: Text(
                      'Change Password',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 250,
                height: 60,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.green.shade100,
                            Colors.green.shade400
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.green,
                            blurRadius: 2,
                            offset: Offset(0, 2))
                      ]),
                  child: MaterialButton(
                    onPressed: () {},
                    minWidth: double.maxFinite,
                    height: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    textColor: Color(0xff1a2b79),
                    child: Text(
                      'Change Personal Data',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
