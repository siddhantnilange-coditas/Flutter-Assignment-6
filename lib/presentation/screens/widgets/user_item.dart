import 'package:flutter/material.dart';
import 'package:magical_change/data/models/user_info.dart';
import 'package:magical_change/presentation/screens/homePage/bloc/user_bloc.dart';
import 'package:magical_change/presentation/screens/homePage/bloc/user_event.dart';
import 'package:magical_change/presentation/screens/updatePage/edit_data.dart';

class UserItem extends StatelessWidget {
  UserItem({
    required this.users,
    required this.index,
    required this.userBloc,
    super.key,
  });
  final User users;
  final UserBloc userBloc;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditUsersScreen(
                user: users,
                index: index,
                title: 'Edit data',
              ),
            ),
          ).then((updatedUser) {
           if (updatedUser != null) {
    // Dispatch the UpdatedUserEvent with the updated user and its index
    userBloc.add(UpdatedUserEvent(index: index, updatedUser: updatedUser));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('User updated successfully!'),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Failed to update user. Please try again.'),
      ),
    );
  }
          }
          );
        },
        child: SizedBox(
          height: 130,
          width: double.infinity,
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
                  color: const Color.fromARGB(255, 75, 69, 69),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          'Name : ${users.name}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 26, 82, 200),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                            // widget.userInfo.email,
                            'Email : ${users.email}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(213, 0, 0, 0))),
                      ),
                      Flexible(
                        child: Text(
                            // widget.userInfo.phoneNumber,
                            'Ph : ${users.phoneNumber}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(211, 0, 0, 0))),
                      ),
                      Flexible(
                        child: Text(
                            // widget.userInfo.address,
                            'Address : ${users.address}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(213, 0, 0, 0))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
    // },
    // ),
    // );
  }
}
