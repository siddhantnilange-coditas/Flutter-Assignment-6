import 'package:magical_change/riverpod/user_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magical_change/screens/edit_data.dart';


class UserItem extends StatelessWidget {
  const UserItem({
    required this.index,
    super.key,
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final userDetail = ref.watch(userRiverpod);
      return Padding(
        padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
        child: GestureDetector(
          onTap: () {
            //   print('Tapped user item at index $index');
            // print('User data: ${userDetail[index]}'); 
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditUsersScreen(
                  user: userDetail[index],
                  index: index,
                  title: 'Edit data',
                ),
              ),
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
                            'Name : ${userDetail[index].name}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 26, 82, 200),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                              // widget.userInfo.email,
                              'Email : ${userDetail[index].email}',
                              overflow: TextOverflow.ellipsis, 
        
                              style: const TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(213, 0, 0, 0))),
                        ),
                        Flexible(
                          child: Text(
                              // widget.userInfo.phoneNumber,
                              'Ph : ${userDetail[index].phoneNumber}',
                              overflow: TextOverflow.ellipsis, 
        
                              style: const TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(211, 0, 0, 0))),
                        ),
                        Flexible(
                          child: Text(
                              // widget.userInfo.address,
                              'Address : ${userDetail[index].address}',
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
      }
      
    );
  }

}





















