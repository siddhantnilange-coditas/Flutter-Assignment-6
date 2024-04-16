
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magical_change/data/models/data_source.dart';
import 'package:magical_change/data/models/user_info.dart';

import 'package:magical_change/presentation/screens/homePage/bloc/user_event.dart';
import 'package:magical_change/presentation/screens/homePage/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  // final UserRepository userRepository;
  late List<User> userList;
  final UserDataList userDataList;
  UserBloc({required this.userDataList}) : super(UserListLoadingState()){

        on<UserInitialEvent>(userInitialEvent);
        on<OnUserClickedEvent>(onUserClickedEvent);
        // on<AddNewUserClickedEvent>(addNewUserClickedEvent);
                on<UpdatedUserEvent>(updatingUser);

  }
  Future<void> userInitialEvent(
    UserInitialEvent event,
    Emitter<UserState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 3)); 
    userList = userDataList.fetchUsersData();
    emit(UserListSuccessState(userList: List.from(userList)));
  }

  FutureOr<void> onUserClickedEvent(
    OnUserClickedEvent event, 
    Emitter<UserState> emit) {
  }

  FutureOr<void> addNewUserClickedEvent(User newUser,
    AddNewUserClickedEvent event, 
    Emitter<UserState> emit) async{  

    userList.add(event.newUser);
      emit(UserListLoadingState()); 
          await Future.delayed(const Duration(seconds: 1)); 

  emit(UserListSuccessState(userList: List.from(userList))); 

  }

    FutureOr<void> updatingUser(
    UpdatedUserEvent event, 
    Emitter<UserState> emit)async {  
        await Future.delayed(const Duration(seconds: 1));
  
        userList[event.index] = event.updatedUser;
        emit(UserListSuccessState(userList: List.from(userList)));
    

  }

  
}