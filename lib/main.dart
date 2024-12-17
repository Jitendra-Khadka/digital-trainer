
import "package:digital_trainer/inital_pages/first_page.dart";
import "package:digital_trainer/user_status.dart";
import "package:flutter/material.dart";
import "package:firebase_core/firebase_core.dart";

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      theme: ThemeData(
        //scaffoldBackgroundColor: const Color(0xFF3E3939),
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthenticatedorNot(),
    ),
  );
}