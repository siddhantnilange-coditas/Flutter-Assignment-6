import 'package:magical_change/models/user_info.dart';
import 'package:magical_change/riverpod/user_riverpod.dart';
import 'package:magical_change/screens/edit_data.dart';
import 'package:magical_change/user_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});

  // const StartScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails = ref.watch(userRiverpod);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 207, 207),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 73, 161, 234),
        title: const Text("Magical Change"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        // child: Consumer<UserProvider>(
        //   builder: (BuildContext context, userProvider, _) {
        //     return UserListView(
        //       userInfo: userProvider.users,
        //     );
        //   },
        // ),
        child: userDetails.isEmpty
            ? const Center(
                child: Text("Please Add Some Data.....!", style: TextStyle(fontSize: 20),),
              )
            : UserListView(
                userInfo: userDetails,
              ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            //
            MaterialPageRoute(
              builder: (context) => EditUsersScreen(
                user: User(
                    avatar: 'assets/images/person.jpeg',
                    address: '',
                    name: '',
                    phoneNumber: '',
                    email: ''),
                index: userDetails.length + 1,
                title: 'New User',
              ),
            ),
          ).then((newUser) {
            // context.read(userProvider).addUser(newUser);
            // context.read(userRiverpod.notifier).addUser(newUser);
            ref.read(userRiverpod.notifier).addUser(newUser, ref);
          });
        },
        icon: const Icon(Icons.add),
        label: const Text('Add '),
        backgroundColor: const Color.fromARGB(255, 97, 201, 101),
      ),

    );
  }
}
