import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الدردشة'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return MessageBubble(
                  text: message.text,
                  isSentByUser: message.isSentByUser,
                  timestamp: message.timestamp,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'اكتب رسالتك هنا...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // اكتب هنا منطق إرسال الرسالة
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Messageee {
  final String text;
  final bool isSentByUser;
  final String timestamp;

  Messageee({
    required this.text,
    required this.isSentByUser,
    required this.timestamp,
  });
}

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isSentByUser;
  final String timestamp;

  MessageBubble({
    required this.text,
    required this.isSentByUser,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSentByUser ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          SizedBox(height: 4),
          Text(timestamp),
        ],
      ),
    );
  }
}

// قائمة الرسائل (يمكنك تخصيصها بناءً على احتياجاتك)
final List<Messageee> messages = [
  Messageee(
    text: 'مرحبًا! كيف حالك؟',
    isSentByUser: false,
    timestamp: '09:25 AM',
  ),
  Messageee(
    text: 'أنا بخير، شكرًا!',
    isSentByUser: true,
    timestamp: '09:28 AM',
  ),
  // ... إضافة المزيد من الرسائل هنا
];
