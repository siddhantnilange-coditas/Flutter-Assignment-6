import 'package:flutter/material.dart';
import 'package:magical_change/data/models/user_info.dart';
import 'package:magical_change/presentation/screens/homePage/bloc/user_bloc.dart';
// import 'package:magical_change/presentation/widgets/user_item.dart';
import 'package:magical_change/presentation/screens/widgets/user_item.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key, required this.userBloc ,required this.userInfo});
  final UserBloc userBloc;
  final List<User> userInfo;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      trackVisibility: true,
      thickness: 10,
      child: ListView.builder(
        
        itemCount: userInfo.length,
        itemBuilder: (context, index) => UserItem(
          users: userInfo[index],
          index: index,
          userBloc: userBloc,
      
        ),
      ),
    );
  }//

}
//com

