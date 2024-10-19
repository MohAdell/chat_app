import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Contacts/logic/rooms_cubit.dart';
import '../../Profile/UI/user_profile_ui.dart';
import '../../Profile/logic/users_cubit.dart';
import '../../firebase/firebase_data.dart';
import '../../utils/routes.dart';
import 'Masseges_Home.dart';

class HomeScreenChat extends StatefulWidget {
  @override
  State<HomeScreenChat> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenChat> {
  @override
  void initState() {
    _HomeScreenState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RoomsCubit(FireBaseDataAll())..fetchAllData(),
        child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.black.withOpacity(0.1),
            leading: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Flexible(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  context.read<UsersCubit>().fetchAlluserWithoutme();
                  Navigator.pushNamed(context, Routes.selectUserScreen);
                },
                icon: Image.asset(
                  'assets/icons/add-user.png',
                  height: 22,
                  width: 22,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserProfileUi()));
                },
                icon: Icon(Icons.settings),
              ),
            ],
            title: Center(
              child: Text(
                'Home',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          body: BlocBuilder<RoomsCubit, RoomsState>(builder: (context, state) {
            if (state is RoomsLoading) {
              return Center(child: const CircularProgressIndicator());
            }

            if (state is RoomsLoaded) {
              return ListView.builder(
                  itemCount: state.rooms.length,
                  itemBuilder: (context, index) {
                    final chatroom = state.rooms[index];
                    //get anther id from members
                    final otherUserId = chatroom.members.firstWhere(
                      (id) => id != FireBaseDataAll().myUid,
                      orElse: () => 'Unknown',
                    );
                    // the user ifno  from cubit
                    final userProfile =
                        context.read<RoomsCubit>().getUserProfile(otherUserId);
                    if (otherUserId == 'Unknown' || userProfile == null) {
                      return _buildNoUserFoundTile();
                    }
                    return UserCard(
                      userProfile: userProfile!,
                      room: state.rooms[index],
                    );
                  });
            }

            if (state is RoomsError) {
              return Text(state.err);
            }
            return Text("no rooms");
          }),
        ));
  }

  Widget _buildNoUserFoundTile() {
    return const ListTile(
      leading: Icon(Icons.person),
      title: Text('No other user found'),
      subtitle: Text('Room contains only your ID'),
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
}
