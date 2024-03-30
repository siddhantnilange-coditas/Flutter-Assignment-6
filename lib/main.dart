import "package:flutter/material.dart";
import "package:magical_change/screens/start_screen.dart";
import "package:provider/provider.dart";

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        home: StartScreen(),
      ),
    ),
  );
}


