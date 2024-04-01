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
            ref.read(userRiverpod.notifier).addUser(newUser);
          });
        },
        icon: const Icon(Icons.add),
        label: const Text('Add'),
        backgroundColor: const Color.fromARGB(255, 97, 201, 101),
      ),

//       floatingActionButton: FloatingActionButton.extended(
//   onPressed: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Consumer<UserProvider>(
//           builder: (BuildContext context, userProvider, _) {
//             return EditUsersScreen(
//               user: User(
//                 avatar: 'assets/images/person.jpeg',
//                 address: '',
//                 name: '',
//                 phoneNumber: '',
//                 email: ''
//               ),
//               index: userProvider.users.length+1,
//               title: 'New User',
//             );
//           },
//         ),
//       ),
//     ).then((newUser) {
//       // Provider.of<UserProvider>(context, listen: false).addUser(newUser);
//             context.read(userRiverpod.notifier).addUser(newUser);

//     });
//   },
//   icon: const Icon(Icons.add),
//   label: const Text('Add'),
//   backgroundColor: const Color.fromARGB(255, 97, 201, 101),
// ),
    );
  }
}

// class StartScreen extends StatelessWidget {
//   const StartScreen({super.key});

//   // const StartScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 214, 207, 207),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 73, 161, 234),
//         title: const Text("Magical Change"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Consumer<UserProvider>(
//           builder: (BuildContext context, userProvider, _) {
//             return UserListView(
//               userInfo: userProvider.users,
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//   onPressed: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Consumer<UserProvider>(
//           builder: (BuildContext context, userProvider, _) {
//             return EditUsersScreen(
//               user: User(
//                 avatar: 'assets/images/person.jpeg',
//                 address: '',
//                 name: '',
//                 phoneNumber: '',
//                 email: ''
//               ),
//               index: userProvider.users.length+1,
//               title: 'New User',
//             );
//           },
//         ),
//       ),
//     ).then((newUser) {
//       Provider.of<UserProvider>(context, listen: false).addUser(newUser);
//     });
//   },
//   icon: const Icon(Icons.add),
//   label: const Text('Add'),
//   backgroundColor: const Color.fromARGB(255, 97, 201, 101),
// ),

//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:magical_change/models/user_info.dart';
// import 'package:magical_change/screens/edit_data.dart';
// import 'package:magical_change/user_listview.dart';

// class StartScreen extends StatefulWidget {
//   const StartScreen({super.key});

//   @override
//   State<StartScreen> createState() => _StartScreenState();
// }

// class _StartScreenState extends State<StartScreen> {
//   final List<User> userData = [
//      User(
//       address: 'Pune',
//       name: 'Sumit',
//       email: 'sumit@sumit.com',
//       phoneNumber: '4565465656',
//       avatar: 'assets/images/person.jpeg',
//     ),
//     User(
//       address: 'Parbhani',
//       name: 'Siddhant',
//       email: 'Sidd@sidd.com',
//       phoneNumber: '983459998',
//       avatar: 'assets/images/person.jpeg',
//     ),
//     User(
//       address: 'Jalgaon',
//       name: 'Gaurav',
//       email: 'Gaurav@gaurav.com',
//       phoneNumber: '1234567890',
//       avatar: 'assets/images/person.jpeg',
//     ),
//     User(
//       address: 'Pune',
//       name: 'Mayur',
//       email: 'Mayur@mayur.com',
//       phoneNumber: '43454546544',
//       avatar: 'assets/images/person.jpeg',
//     ),
//     User(
//       address: 'Nagpur',
//       name: 'Yash',
//       email: 'Yash@yash.com',
//       phoneNumber: '4544354543543',
//       avatar: 'assets/images/person.jpeg',
//     ),
//     User(
//       address: 'Pune',
//       name: 'Aniket',
//       email: 'aniket@aniket.com',
//       phoneNumber: '3323434343',
//       avatar: 'assets/images/person.jpeg',
//     ),

//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 214, 207, 207),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 73, 161, 234),
//         title: const Text("Magical Change"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: UserListView(
//           userInfo: userData,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => EditUsersScreen(
//                 user: User(
//                     avatar: 'assets/images/person.jpeg',
//                     address: '',
//                     name: '',
//                     phoneNumber: '',
//                     email: ''),
//               ),
//             ),
//           ).then((newUser) {
//             setState(() {
//               // userData[userData.length] = newUser;
//               userData.add(newUser);
//             });
//           });
//         },
//         icon: const Icon(Icons.add),
//         label: const Text('Add'),
//         backgroundColor: const Color.fromARGB(255, 97, 201, 101),
//       ),
//     );
//   }
// }
