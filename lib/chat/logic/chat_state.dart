import 'package:flutter/cupertino.dart';
import '../model/chat_model.dart';

@immutable
sealed class MessageState {}

final class MessageInitial extends MessageState {}

class MessagesLoading extends MessageState {}

class MessagesLoaded extends MessageState {
  final List<Message> messages;
  MessagesLoaded(this.messages);
}

class MessagesError extends MessageState {
  final String error;

  MessagesError(this.error);
}
