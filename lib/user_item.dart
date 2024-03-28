import 'package:flutter/material.dart';
import 'package:magical_change/models/user_info.dart';
import 'package:magical_change/screens/edit_data.dart';


class UserItem extends StatefulWidget {
  const UserItem({
    required this.updateUser,
    required this.index,
    required this.userInfo,
    super.key,
  });

  final User userInfo;
  final void Function(int index, User updatedUser) updateUser;
  final int index;
  // final User index;

  @override
  State<UserItem> createState() => _UserItemState(updateUser: updateUser);
}

class _UserItemState extends State<UserItem> {
  _UserItemState({required this.updateUser});

  final void Function(int index, User updatedUser) updateUser;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditUsersScreen(user: widget.userInfo),
          ),
        ).then((updatedUser) {
          if (updatedUser != null) {
            updateUser(widget.index, updatedUser);
          }
        });
      },
      child: Container(
        height: 130,
        child: Card(
          
          elevation: 4,
          color: const Color.fromARGB(255, 249, 244, 244),
          child: Row(
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset(
                      'assets/images/men.png',
                      width: 100,
                      // height: 120,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                        width: 2,
                        height: 100,
                        color: Color.fromARGB(255, 75, 69, 69),
                      ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name : ${widget.userInfo.name}',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 26, 82, 200),
                        ),
                  ),
                  Text(
                    // widget.userInfo.email,
                      'Email : ${widget.userInfo.email}',

                      style: const TextStyle(
                          fontSize: 17, color: Color.fromARGB(213, 0, 0, 0))),
                  Text(
                    // widget.userInfo.phoneNumber,
                    'Ph : ${widget.userInfo.phoneNumber}',

                      style: const TextStyle(
                          fontSize: 17, color: Color.fromARGB(211, 0, 0, 0))),
                  Text(
                    // widget.userInfo.address,
                      'Address : ${widget.userInfo.address}',

                      style: const TextStyle(
                          fontSize: 17, color: Color.fromARGB(213, 0, 0, 0))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
