import 'package:flutter/material.dart';
import 'package:magical_change/models/user_info.dart';
import 'package:magical_change/screens/edit_data.dart';
import 'package:magical_change/user_listview.dart';
import 'package:provider/provider.dart';

class UserProvider with ChangeNotifier {
  final List<User> _users = [
    User(
      address: 'Pune',
      name: 'Sumit',
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
    // Add more sample users here
  ];
  List<User> get users => _users;


  void updateUser(User newUser, int index) {
    if(index>=0 && index<_users.length){
          _users[index] = newUser;
    }
    else{
      addUser(newUser);
    }

    notifyListeners();
  }

  void addUser(newUser) {
    _users.add(newUser);
    notifyListeners();
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  // const StartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 207, 207),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 73, 161, 234),
        title: const Text("Magical Change"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Consumer<UserProvider>(
          builder: (BuildContext context, userProvider, _) {
            return UserListView(
              userInfo: userProvider.users,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Consumer<UserProvider>(
          builder: (BuildContext context, userProvider, _) {
            return EditUsersScreen(
              user: User(
                avatar: 'assets/images/person.jpeg',
                address: '',
                name: '',
                phoneNumber: '',
                email: ''
              ),
              index: userProvider.users.length+1,
              title: 'New User',
            );
          },
        ),
      ),
    ).then((newUser) {
      Provider.of<UserProvider>(context, listen: false).addUser(newUser);
    });
  },
  icon: const Icon(Icons.add),
  label: const Text('Add'),
  backgroundColor: const Color.fromARGB(255, 97, 201, 101),
),

    );
  }
}