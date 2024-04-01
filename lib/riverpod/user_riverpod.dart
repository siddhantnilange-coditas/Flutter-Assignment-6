
import 'package:magical_change/models/user_info.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRiverpod =
    StateNotifierProvider<UserProvider, List<User>>((ref) => UserProvider());

class UserProvider extends StateNotifier<List<User>> {
  UserProvider()
      : super([
          User(
      address: 'Pune',
      name: 'Sumit Ambhore',
      email: 'sumit@sumit.com',
      phoneNumber: '4565465656',
      avatar: 'assets/images/person.jpeg',
    ),
    User(
      address: 'Parbhani',
      name: 'Siddhant',
      email: 'Sidd@sidd.com',
      phoneNumber: '983459998',
      avatar: 'assets/images/person.jpeg',
    ),
    User(
      address: 'Jalgaon',
      name: 'Gaurav',
      email: 'Gaurav@gaurav.com',
      phoneNumber: '1234567890',
      avatar: 'assets/images/person.jpeg',
    ),
    User(
      address: 'Pune',
      name: 'Mayur',
      email: 'Mayur@mayur.com',
      phoneNumber: '43454546544',
      avatar: 'assets/images/person.jpeg',
    ),
    User(
      address: 'Nagpur',
      name: 'Yash',
      email: 'Yash@yash.com',
      phoneNumber: '4544354543543',
      avatar: 'assets/images/person.jpeg',
    ),
    User(
      address: 'Pune',
      name: 'Aniket',
      email: 'aniket@aniket.com',
      phoneNumber: '3323434343',
      avatar: 'assets/images/person.jpeg',
    ),
        ]);


  void updateUser(User newUser, int index) {
    if(index>=0 && index<state.length){
          state[index] = newUser;
    }
    else{
      addUser(newUser);
    }

  }

  void addUser(newUser) {
    state.add(newUser);
  }












































  
  // void updateUser(User newUser, int index) {
  //   print("In update user");
  //   state[index] = newUser;
  //       print("out update user");

  // }
// void printUserList() {
//     for(int i=0; i<6; i++){
//       print(state[i]); 
//   }
//     }
  // void removeUser(int index) {
  //   state.removeAt(index);
  // // }
  // }
}


// class UserProvider with ChangeNotifier {
//   final List<User> _users = [
//     User(
//       address: 'Pune',
//       name: 'Sumit Ambhore',
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
//   List<User> get users => _users;


//   void updateUser(User newUser, int index) {
//     if(index>=0 && index<_users.length){
//           _users[index] = newUser;
//     }
//     else{
//       addUser(newUser);
//     }

//     notifyListeners();
//   }

//   void addUser(newUser) {
//     _users.add(newUser);
//     notifyListeners();
//   }
// }