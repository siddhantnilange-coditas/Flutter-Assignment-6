

import 'package:magical_change/data/models/user_info.dart';

abstract class UserState{

}

class UserListSuccessState extends UserState{
  final List<User> userList;
  UserListSuccessState({required this.userList});
}

class UserListLoadingState extends UserState{
  //   final List<User> userList;
  // UserListLoadingState({required this.userList});
}
class UserListErrorState extends UserState{
  
}