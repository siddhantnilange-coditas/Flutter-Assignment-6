import "package:flutter_bloc/flutter_bloc.dart";
import "package:magical_change/data/models/data_source.dart";
import "package:magical_change/presentation/screens/homePage/bloc/user_bloc.dart";
import "package:magical_change/presentation/screens/homePage/bloc/user_event.dart";
import "package:magical_change/presentation/screens/widgets/start_screen.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

void main() {
  runApp(
     ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => UserBloc(userDataList: UserDataList())..add(UserInitialEvent()),
          child: StartScreen(),
        ),
      ),
    ),
  );
}
