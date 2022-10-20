import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quantapp/controllers/auth.dart';
import 'package:quantapp/pages/home.dart';

import '../widgets/customdailog.dart';
import '../widgets/input.dart';

class LogIn extends StatefulWidget {
  TabController c;
  LogIn({super.key, required this.c});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  late final _user;
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height * 0.8,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.red[50],
            borderRadius: const BorderRadius.all(
              Radius.circular(65),
            )),
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.1,
              right: size.width * 0.1,
              top: size.width * 0.1),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Sign into Your\nAccount",
              style: TextStyle(
                  color: Colors.red, fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.02),
            const Text(
              "Email",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: size.width * 0.83,
              child: InputWidget(
                icon: Icons.email,
                label: "Email",
                controller: _emailcontroller,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            const Text(
              "Password",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: size.width * 0.83,
              child: InputWidget(
                icon: Icons.password,
                label: "Password",
                controller: _passwordcontroller,
              ),
            ),
            SizedBox(height: size.height * 0.015),
            const Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Forget Password ?",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(height: size.height * 0.015),
            const Align(
                alignment: Alignment.center,
                child: Text("Login with",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 17,
                        fontWeight: FontWeight.bold))),
            SizedBox(height: size.height * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    AuthController().signInWithGoogle();
                    // CustomFullScreenDialog.cancelDialog();

                    // Navigator.push(context, MaterialPageRoute(builder: ((context) => const HomePage())));
                  },
                  child: Icon(
                    FontAwesomeIcons.squareGooglePlus,
                    size: 50, //Icon Size
                    color: Colors.red, //Color Of Icon
                  ),
                ),
                Icon(
                  FontAwesomeIcons.squareFacebook,
                  size: 50, //Icon Size
                  color: Colors.blue, //Color Of Icon
                ),
              ],
            ),
            SizedBox(height: size.height * 0.018),
            RichText(
                text: TextSpan(
                    text: "Don't have an Account? ",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                    children: [
                  TextSpan(
                      text: "Register Now",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          widget.c.animateTo((widget.c.index + 1) % 2);
                        })
                ]))
          ]),
        ),
      ),
    );
  }
}
