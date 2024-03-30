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
        // updateUser: updateUser,
        // userInfo: widget.userInfo[index],
      ),
    );
  }

  // @override
  // State<UserListView> createState() => _UserListViewState();
}

// class _UserListViewState extends State<UserListView> {Z
  // void updateUser(int index, User updatedUser) {
  //   setState(() {
  //     widget.userInfo[index] = updatedUser;
  //   });
  // }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: widget.userInfo.length,
//       itemBuilder: (context, index) => UserItem(
//         index: index,
//         updateUser: updateUser,
//         userInfo: widget.userInfo[index],
//       ),
//     );
//   }
// }
