import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../firebase/fireBase_data.dart';
import 'chat_state.dart';

class MessageCubit extends Cubit<MessageState> {
  final FireBaseDataAll _firebaseData;

  MessageCubit(this._firebaseData) : super(MessageInitial());
}
