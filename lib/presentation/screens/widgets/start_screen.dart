import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magical_change/data/models/user_info.dart';
import 'package:magical_change/presentation/screens/homePage/bloc/user_bloc.dart';
import 'package:magical_change/presentation/screens/homePage/bloc/user_event.dart';
import 'package:magical_change/presentation/screens/homePage/bloc/user_state.dart';
import 'package:magical_change/presentation/screens/updatePage/edit_data.dart';
import 'package:flutter/material.dart';
import 'package:magical_change/presentation/screens/widgets/user_item.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        final userBloc = BlocProvider.of<UserBloc>(context);
        if (state is UserListLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserListSuccessState) {
          final successState = state as UserListSuccessState;
          final List<User> users = state.userList;
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 214, 207, 207),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 73, 161, 234),
              title: const Text("Magical Change"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: users.isEmpty
                  ? const Center(
                      child: Text(
                        "Please Add Some Data.....!",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : ListView.builder(
                      itemCount: successState.userList.length,
                      itemBuilder: (context, index) => UserItem(
                        userBloc: userBloc,
                        users: users[index],
                        index: index,
                      ),
                    ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditUsersScreen(
                      user: User(
                        avatar: 'assets/images/person.jpeg',
                        address: '',
                        name: '',
                        phoneNumber: '',
                        email: '',
                      ),
                      index: users.length + 1,
                      title: 'New User',
                    ),
                  ),
                )
                .then((newUser) {
                  if (newUser != null) {
                    print('in if statement');
                    BlocProvider.of<UserBloc>(context)
                        .add(AddNewUserClickedEvent(newUser: newUser));
                  }
                  if (newUser != null) {
                      userBloc.add(AddNewUserClickedEvent(newUser: newUser));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('User added successfully!'),
                        ),
                      );
                    }
                }
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Add'),
              backgroundColor: const Color.fromARGB(255, 97, 201, 101),
            ),
          );
        }
        
  //       else if(state is UpdatedUserEvent){

  //         final updatedUser = state.updatedUser;
  // final index = state.index;
  //  final List<User> updatedUsers = List.from(successState.userList);
  // updatedUsers[index] = updatedUser;

  //       }
        // else if(state is AddNewUserClickedEvent)
        else if (state is UserListErrorState) {
          return const Scaffold(
            body: Center(
              child: Text("Error"),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
