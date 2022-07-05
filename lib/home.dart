import 'package:flutter/material.dart';
import 'package:nyoba/bottom_modal.dart';
import 'package:nyoba/login.dart';
import 'package:nyoba/qr.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20)),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => QRPage(),
                ),
              ),
              child: Text(
                "QR Code",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20)),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BottomModalPage(),
                ),
              ),
              child: Text(
                "Bottom Modal",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
