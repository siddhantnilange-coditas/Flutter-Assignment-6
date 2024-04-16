import 'package:flutter/material.dart';
import 'package:magical_change/data/models/user_info.dart';

@immutable

abstract class UserEvent{

}

class UserInitialEvent extends UserEvent{

}

class OnUserClickedEvent extends UserEvent{

}

class AddNewUserClickedEvent extends UserEvent{
  AddNewUserClickedEvent({required this.newUser});
  
final User newUser;  

}

class UpdatedUserEvent extends UserEvent{
  UpdatedUserEvent({required this.index, required this.updatedUser});
  final User updatedUser;
      final int index;
}

class DeleteUserClickedEvent extends UserEvent{

}