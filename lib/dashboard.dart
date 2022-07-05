import 'package:flutter/material.dart';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:nyoba/login.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Dashboard'),
      ),
      body: Container(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: RaisedButton(
              onPressed: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.QUESTION,
                  headerAnimationLoop: false,
                  animType: AnimType.BOTTOMSLIDE,
                  title: 'Apakah anda yakin ingin Logout?',
                  buttonsTextStyle: const TextStyle(color: Colors.black),
                  showCloseIcon: true,
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => loginPage()),
                        (route) => false);
                  },
                ).show();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              textColor: Colors.white,
              padding: const EdgeInsets.all(0),
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                width: size.width * 0.5,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    gradient: new LinearGradient(colors: [
                      Color.fromARGB(255, 81, 180, 238),
                      Color.fromARGB(255, 41, 109, 255)
                    ])),
                padding: const EdgeInsets.all(0),
                child: Text(
                  "Logout",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
