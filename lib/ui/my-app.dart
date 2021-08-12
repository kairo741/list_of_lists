import 'package:flutter/material.dart';
import 'package:list_of_lists/ui/screens/home/view/home-page.dart';
import 'package:list_of_lists/ui/styles/custom-text-theme.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "List of Lists",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Gotham-SSm', primarySwatch: Colors.red, textTheme: customTextTheme),
      home: HomePage(),
    );
  }
}