import 'package:facebook/models/user_model.dart';
import 'package:facebook/viewmodel/data_sources/local_data.dart';
import 'package:facebook/viewmodel/user/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState(currentUser:  User(imageUrl: "",name: ""),
      onlineUsers: []));
  getCurrentUser(){state.currentUser=currentUser;}
  getOnlineUser(){state.onlineUsers=onlineUsers;}
}
