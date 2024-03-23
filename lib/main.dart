
import "package:flutter/material.dart";
import "package:magical_change/screens/start_screen.dart";

void main(){

  runApp(
      const MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
      // theme: ThemeData(
      //   textTheme: GoogleFonts.openSansTextTheme(
      //     Theme.of(context).textTheme,
      //   ),
      // ),
     )
  );
}
