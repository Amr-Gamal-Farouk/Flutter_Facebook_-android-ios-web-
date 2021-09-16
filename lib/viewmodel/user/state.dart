import 'package:facebook/models/user_model.dart';

class UserState {
  User currentUser;
  List<User> onlineUsers;
  UserState({required this.currentUser,required this.onlineUsers});
}
