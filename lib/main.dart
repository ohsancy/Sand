import 'package:flutter/material.dart';
import 'package:sand/db/db.dart';
import 'package:sand/navigation_bar.dart';
import 'package:sand/terms/terms_model.dart';

void main() async {
  // 如果要在runApp之前有其他初始化步骤需先调用此方法。
  WidgetsFlutterBinding.ensureInitialized();
  await DB().init();
  // load data
  await TermsModel.instance.loadData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: NavigationBar(),
    );
  }
}
