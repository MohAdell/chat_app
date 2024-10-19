import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Profile/model/users_info.dart';
import '../../UI/chat_ui.dart';
import '../../firebase/firebase_data.dart';
import '../model/chat_model.dart';

class ChatScreen extends StatelessWidget {
  final UserProfile userProfile;

  ChatScreen({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          children: [
            ChatMassageTest(
              isMeChatting: true,
              massageBody: 'Hello, Iam ${userProfile.name}',
            ),
            ChatMassageTest(
              isMeChatting: false,
              massageBody: 'Welcome bro',
            ),
            ChatMassageTest(
              isMeChatting: true,
              massageBody: 'How are you?',
            ),
            ChatMassageTest(
              isMeChatting: false,
              massageBody: 'I am fine, what about you?',
            ),
            ChatMassageTest(
              isMeChatting: true,
              massageBody: 'I am fine',
            ),
            Expanded(child: Container()),
            Row(
              children: [
                //chats test here
                Expanded(
                  child: Card(
                    child: TextField(
                      maxLines: 5,
                      minLines: 1,
                      decoration: InputDecoration(
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add_circle),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.emoji_emotions_outlined),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.mic_rounded),
                            ),
                          ],
                        ),
                        border: InputBorder.none,
                        hintText: "Message",
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.5)),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 27,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final DateTime lastActivated = DateTime.parse(userProfile.lastActivated);
    final formattedTime = DateFormat.jm().format(lastActivated);

    return AppBar(
      toolbarHeight: 80,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/user-avatar.png'),
                minRadius: 30,
                backgroundColor: Colors.blue,

                // child: Image.asset('assets/user-avatar.png'),
              ),
              if (userProfile.online)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2.5)),
                    child: Icon(
                      Icons.brightness_1,
                      size: 8,
                      color: Colors.green,
                    ),
                  ),
                )
              else
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2.5)),
                    child: Icon(
                      Icons.brightness_1_outlined,
                      size: 8,
                      color: Colors.black38,
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userProfile.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                if (userProfile.online)
                  Text(
                    'Active Now',
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 13,
                      // fontWeight: FontWeight.w300,
                    ),
                  )
                else
                  Text(
                    'Last Active ${formattedTime}',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                      // fontWeight: FontWeight.w300,
                    ),
                  )
              ],
            ),
          ),

          // Text(
          //   "Last Seen ${Styles.getLastActiveTime(userProfile.lastActivated)}",
          //   style: Theme.of(context).textTheme.labelLarge,
          // ),
        ],
      ),
      actions: [
        // IconButton(
        //   onPressed: () {},
        //   icon:
        //       const Icon(Icons.accessibility_new_outlined, color: Colors.cyan),
        // ),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(
            Icons.call,
            size: 35,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(
            Icons.videocam,
            size: 35,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 6),
          child: Icon(
            Icons.more_vert,
            size: 35,
          ),
        ),
      ],
    );
  }
}

class ChatMessageCard extends StatelessWidget {
  final Message messageItem;

  ChatMessageCard({required this.messageItem});

  @override
  Widget build(BuildContext context) {
    final bool isMe = messageItem.fromId == FireBaseDataAll().myUid;

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: isMe ? const Radius.circular(16) : Radius.zero,
              bottomRight: isMe ? Radius.zero : const Radius.circular(16),
              topLeft: const Radius.circular(16),
              topRight: const Radius.circular(16),
            ),
          ),
          color: isMe ? Colors.green.shade200 : Colors.green.shade700,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(messageItem.msg),
                const SizedBox(height: 5),
                Text(
                  DateFormat.jm().format(
                    DateTime.parse(messageItem.createdAt),
                  ),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChatMassageTest extends StatelessWidget {
  final bool isMeChatting;
  final String massageBody;
  const ChatMassageTest(
      {super.key, required this.isMeChatting, required this.massageBody});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMeChatting ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: isMeChatting
                ? BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
            color:
                isMeChatting ? Colors.green.shade200 : Colors.green.shade700),
        margin: EdgeInsets.all(8),
        child: Text(
          massageBody,
          style: TextStyle(
              fontSize: 15, color: isMeChatting ? Colors.black : Colors.white),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
