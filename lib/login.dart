import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:nyoba/dashboard.dart';
import 'package:nyoba/register.dart';
import 'package:swipebuttonflutter/swipebuttonflutter.dart';
import 'package:ndialog/ndialog.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import 'package:http/http.dart' as http;

import 'service/http.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  bool _loading = false;

  TextEditingController txUsername = new TextEditingController();
  TextEditingController txPass = new TextEditingController();

  String _user = '';
  String _pass = '';
  bool isFinished = false;

  Future<void> _showMyDialog() async {
    ProgressDialog progressDialog = ProgressDialog(
      context,
      blur: 0,
      dialogTransitionType: DialogTransitionType.Bubble,
      title: Text("Title"),
      message: Text("Message"),
      dismissable: false,
    );
    progressDialog.setLoadingWidget(CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.blue),
    ));
    progressDialog.setMessage(Text("Mohon Tunggu"));
    progressDialog.setTitle(Text("Sedang Login"));
    progressDialog.show();

    await Future.delayed(Duration(seconds: 5));

    // progressDialog.dismiss();
  }

  ceklogin() async {
    setState(() {
      _loading = true;
    });
    if (_loading = true) {
      _showMyDialog();
      try {
        http.Response response = await Http.login(_user, _pass);
        // Map responseMap = jsonDecode(response.body);

        if (response.statusCode == 200) {
          setState(() {
            _loading = false;
          });
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => DashboardPage()),
              (route) => false);
        } else {
          setState(() {
            _loading = false;
          });
          Navigator.of(context).pop();
          // Menampilkan Dialog
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.SCALE,
            headerAnimationLoop: true,
            title: 'Username atau Password Salah !',
            // desc: 'Username atau Password Salah !',
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          ).show();
          txUsername.text = "";
          txPass.text = "";
        }
      } catch (e) {}
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 80),
            child: const Text(
              "Welcome\nBack",
              style: TextStyle(color: Colors.white, fontSize: 33),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                  top: MediaQuery.of(context).size.height * 0.5),
              child: Column(children: [
                TextField(
                  controller: txUsername,
                  onChanged: (value) {
                    _user = value;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: txPass,
                  obscureText: true,
                  onChanged: (value) {
                    _pass = value;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // const Text(
                    //   'Sign In',
                    //   style: TextStyle(
                    //     color: Color(0xff4c505b),
                    //     fontSize: 27,
                    //     fontWeight: FontWeight.w700,
                    //   ),
                    // ),
                    // CircleAvatar(
                    //   radius: 30,
                    //   backgroundColor: const Color(0xff4c505b),
                    //   child: IconButton(
                    //     color: Colors.white,
                    //     onPressed: () {},
                    //     icon: const Icon(Icons.arrow_forward),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: SwipeableButtonView(
                        buttonText: 'SLIDE TO PAYMENT',
                        buttonWidget: Container(
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                          ),
                        ),
                        activeColor: Color(0xFF009C41),
                        isFinished: isFinished,
                        onWaitingProcess: () {
                          Future.delayed(Duration(seconds: 2), () {
                            setState(() {
                              isFinished = true;
                            });
                          });
                        },
                        onFinish: () async {
                          setState(() {
                            isFinished = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => registerPage()),
                              (route) => false);
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Color(0xff4c505b),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.QUESTION,
                            headerAnimationLoop: false,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'Apakah anda lupa password ?',
                            buttonsTextStyle:
                                const TextStyle(color: Colors.black),
                            showCloseIcon: true,
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {},
                          ).show();
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Color(0xff4c505b),
                          ),
                        ),
                      ),
                    ]),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
