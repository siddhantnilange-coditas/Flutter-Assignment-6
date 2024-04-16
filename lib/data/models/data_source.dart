import 'package:magical_change/data/models/user_info.dart';

class UserDataList{

 List<User> fetchUsersData(){
     return [
    User(
      address: 'Pune',
      name: 'Sumit...',
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
  ];
 }
  // List<User> get users => _users;


  // void updateUser(User newUser, int index) {
  //   if(index>=0 && index<_users.length){
  //         _users[index] = newUser;
  //   }
  //   else{
  //     addUser(newUser);
  //   }

  // }

  // void addUser(newUser) {
  //   _users.add(newUser);
  // }
}