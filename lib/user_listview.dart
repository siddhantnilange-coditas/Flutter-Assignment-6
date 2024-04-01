import 'package:flutter/material.dart';
import 'package:magical_change/models/user_info.dart';
import 'package:magical_change/user_item.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key, required this.userInfo});

  final List<User> userInfo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userInfo.length,
      itemBuilder: (context, index) => UserItem(
        index: index,

      ),
    );
  }//

}
//

