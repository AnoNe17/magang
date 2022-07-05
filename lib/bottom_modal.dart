import 'package:flutter/material.dart';

class BottomModalPage extends StatefulWidget {
  const BottomModalPage({Key? key}) : super(key: key);

  @override
  State<BottomModalPage> createState() => _BottomModalPageState();
}

class _BottomModalPageState extends State<BottomModalPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Modal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              ),
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return Container(
                      height: size.height * 0.75,
                      child: Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            padding: EdgeInsets.symmetric(
                                horizontal: 60, vertical: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Text("tutup"),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                "Sheet",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
