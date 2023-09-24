import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/styles/imagePallet.dart';
import '../constant/styles/style.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController cpassword = new TextEditingController();
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Expanded(
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Image.asset(logo),
                    width: 260,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      controller: username,
                      decoration: InputDecoration(
                        focusedBorder: StyleField.styleBorder,
                        enabledBorder: StyleField.styleBorder,
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(
                          Icons.person_outline_sharp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      controller: email,
                      decoration: InputDecoration(
                        focusedBorder: StyleField.styleBorder,
                        enabledBorder: StyleField.styleBorder,
                        labelText: 'Email Address',
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      controller: password,
                      obscureText: _obscureText1,
                      decoration: InputDecoration(
                        focusedBorder: StyleField.styleBorder,
                        enabledBorder: StyleField.styleBorder,
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.black,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _obscureText1 = !_obscureText1;
                            });
                          },
                          child: Icon(
                            _obscureText1
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.black,
                          ),
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      controller: cpassword,
                      obscureText: _obscureText2,
                      decoration: InputDecoration(
                        focusedBorder: StyleField.styleBorder,
                        enabledBorder: StyleField.styleBorder,
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.black,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _obscureText2 = !_obscureText2;
                            });
                          },
                          child: Icon(
                            _obscureText2
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.black,
                          ),
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: SizedBox(
                      width: _size.width * 0.85,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 40,
                      left: 30,
                      right: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: _size.width * 0.35,
                          height: 1,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'or'.toUpperCase(),
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: _size.width * 0.35,
                          height: 1,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already exist account? ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed('/login');
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
