import 'package:flutter/material.dart';
import 'package:nyoba/home.dart';
import 'package:nyoba/login.dart';
import 'package:nyoba/qr.dart';
// import 'package:provider/provider.dart';

// import './models/http_provider.dart';

// import './pages/home_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // home: ChangeNotifierProvider(
      //   create: (context) => HttpProvider(),
      //   child: HomeProvider(),
      // ),
    );
  }
}
