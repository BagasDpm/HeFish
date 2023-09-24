import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:art_sweetalert/art_sweetalert.dart';

import '../animation/page_route_animation.dart';
import '../constant/styles/imagePallet.dart';
import '../constant/styles/style.dart';
import '../homeScreen.dart';
import '../model/authenticate.dart';
import '../model/google_auth.dart';
import '../utility/config.dart';
import 'package:google_sign_in/google_sign_in.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({
    super.key,
  });

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  bool _obscureText = true;
  String message = "";

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
            width: _size.width,
            height: _size.height,
            color: Colors.transparent,
            child: Stack(children: [
              Image.asset(logo),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 250, 30, 30),
                    child: TextField(
                      controller: _usernameController,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        focusedBorder: StyleField.styleBorder,
                        enabledBorder: StyleField.styleBorder,
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(
                          color: Colors.black,
                          Icons.person_outlined,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                    child: TextField(
                      controller: _passController,
                      obscureText: _obscureText,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        focusedBorder: StyleField.styleBorder,
                        enabledBorder: StyleField.styleBorder,
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(
                          color: Colors.black,
                          Icons.lock_outlined,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText
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
                    padding: EdgeInsets.only(top: 40.0),
                    child: SizedBox(
                      width: _size.width * 0.85,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.of(context).push(
                            AnimatedPageRouteLeft(
                              child: HomeScreen(),
                            ),
                          );
                          // String errorMsg = "Login Success";
                          // Color snackBG;
                          // if (_usernameController.text.isEmpty ||
                          //     _passController.text.isEmpty) {
                          //   errorMsg = "Please fill in your credentials!";
                          //   snackBG = Colors.red;
                          // } else {
                          //   User? validation = await login(
                          //     _usernameController.text,
                          //     _passController.text,
                          //   );
                          //   if (validation!.idUser >= 0) {
                          //     Get.to(
                          //       AnimatedPageRouteLeft(
                          //         child: HomeScreen(user: validation),
                          //       ),
                          //     );
                          //     snackBG = Colors.green;
                          //   } else if (validation.idUser == -404) {
                          //     errorMsg = "Wrong username or password!";
                          //     snackBG = Colors.red;
                          //   } else {
                          //     errorMsg = "Something went wrong!";
                          //     snackBG = Colors.red;
                          //   }
                          // }
                          // ArtSweetAlert.show(
                          //   context: context,
                          //   artDialogArgs: ArtDialogArgs(
                          //     type: ArtSweetAlertType.danger,
                          //     title: "Ooppss...",
                          //     text: errorMsg,
                          //   ),
                          // );

                          // String msg = "";
                          // if (_usernameController.text.isEmpty ||
                          //     _passController.text.isEmpty) {
                          //   msg = "Field can't be empty!";
                          // } else if (_usernameController.text.length < 4) {
                          //   msg = "Username less then 5 characters!";
                          // } else if (!_passController.text
                          //         .contains(RegExp(r'[A-Z]')) ||
                          //     !_passController.text
                          //         .contains(RegExp(r'[a-z]')) ||
                          //     !_passController.text
                          //         .contains(RegExp(r'[0-9]'))) {
                          //   msg =
                          //       "Password must contains at least 1 upper, lower, and number character";
                          // }
                          // _login(
                          //   _usernameController.text,
                          //   _passController.text,
                          // );
                          // ArtSweetAlert.show(
                          //   context: context,
                          //   artDialogArgs: ArtDialogArgs(
                          //     type: ArtSweetAlertType.danger,
                          //     title: "Ooppss...",
                          //     text: msg,
                          //   ),
                          // );
                        },
                        child: Text(
                          'Login',
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
                    padding: const EdgeInsets.only(top: 25),
                    child: SizedBox(
                      width: 45,
                      height: 45,
                      child: FloatingActionButton(
                        elevation: 2,
                        backgroundColor: Colors.white,
                        onPressed: () {},
                        child: InkWell(
                          onTap: () async {
                            final googleUser = await GoogleAuth.googleLogin();
                            String errorMsg = "Login Success";
                            Color snackBG = Colors.green;
                            if (googleUser != null) {
                              //Check registered google user
                              bool registered = false;
                              if (await GoogleAuth.googleRegisterCheck(
                                  googleUser.email)) {
                                registered = true;
                              } else if (await GoogleAuth.googleRegister(
                                  googleUser.email,
                                  googleUser.email.split('@')[0])) {
                                registered = true;
                              }

                              if (registered) {
                                User authenticated =
                                    await GoogleAuth.googleGetUser(
                                        googleUser.email);
                                if (authenticated.idUser >= 0) {
                                  Navigator.of(context).push(
                                    AnimatedPageRouteLeft(
                                      child: HomeScreen(),
                                    ),
                                  );
                                } else {
                                  await GoogleAuth.googleLogout();
                                  errorMsg = "Something went wrong!";
                                  snackBG = Colors.red;
                                }
                              }
                            } else {
                              errorMsg = "Couldn't connect to Google!";
                              snackBG = Colors.red;
                            }
                            final message = SnackBar(
                              content: Text(errorMsg),
                              backgroundColor: snackBG,
                              duration: const Duration(seconds: 3),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(message);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Image.asset(
                              google,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 50.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't already exist account? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed('/register');
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  Future<User?> login(String username, String password) async {
    String url = "${AppConfig.API_ENDPOINT_LOGIN}/users/login";
    final resp = await http.post(Uri.parse(url),
        body: jsonEncode({
          "username": _usernameController.text,
          "password": _passController.text
        }),
        headers: {"Content-type": "application/json"});

    var res = jsonDecode(resp.body);

    if (res.length > 0) {
      return User.fromJson(res[0]);
    } else if (res.length == 0) {
      return User(
        idUser: -404,
        email: "???",
        username: "???",
        token: "???",
        password: "???",
      );
      // Get.toNamed('/login');
    } else if (res.length == 0) {
      return User(
          idUser: -500,
          email: "???",
          username: "???",
          password: "???",
          token: "???");
    } else {
      return User(
          idUser: -500,
          email: "???",
          username: "???",
          password: "???",
          token: "???");
    }
  }
}

  // void saveLogin(int id) async {
  //   final pref = await SharedPreferences.getInstance();
  //   pref.setInt("id", id);
  //   pref.setString("username", _usernameController.text.toString());
  //   pref.setString("password", _passController.text.toString());
  // }

  // void _login(BuildContext context) async {
  //   String route_api = 'http://localhost:3000/users/auth/login';

  //   try {
  //     final response = await http.post(
  //       Uri.parse(route_api),
  //       // headers: {"Content-type": "application/json"},
  //       body: {
  //         'username': _usernameController.text,
  //         'password': _passController.text,
  //       },
  //     );
  //     var getResponse = json.decode(response.body);

  //     // Check Data, If have data direct to Home Screen
  //     if (getResponse.isNotEmpty) {
  //       Get.to(
  //         AnimatedPageRouteLeft(
  //           child: HomeScreen(),
  //         ),
  //       );
  //     } else {
  //       Get.toNamed('/login');
  //       ArtSweetAlert.show(
  //         context: context,
  //         artDialogArgs: ArtDialogArgs(
  //             type: ArtSweetAlertType.danger,
  //             title: "Ooppss...",
  //             text: 'Login Failed!! ☹️'),
  //       );
  //     }
  //   } catch (e) {
  //     print("Error : ${e.toString()}");
  //     return null;
  //   }
  // }

  // void _login(BuildContext context) async {
  //   if (_usernameController.text.isEmpty || _passController.text.isEmpty) {
  //     message = "Field can't be empty!";
  //   } else if (_usernameController.text.length < 5) {
  //     message = "Username less then 5 characters!";
  //   } else if (!_passController.text.contains(RegExp(r'[A-Z]')) ||
  //       !_passController.text.contains(RegExp(r'[a-z]')) ||
  //       !_passController.text.contains(RegExp(r'[0-9]'))) {
  //     message =
  //         "Password must contains at least 1 upper, lower, and number character";
  //   } else {
  //     String route_api = 'http://localhost:3030/users//auth/login';

  //     final response = await http.post(
  //       Uri.parse(route_api),
  //       headers: {"Content-type": "application/json"},
  //       body: {
  //         'username': _usernameController.text,
  //         'password': _passController.text,
  //       },
  //     );

  //     // Check Data, If have data direct to Home Screen
  //     if (response.body.isNotEmpty) {
  //       Get.toNamed('/login');
  //       ArtSweetAlert.show(
  //         context: context,
  //         artDialogArgs: ArtDialogArgs(
  //             type: ArtSweetAlertType.danger,
  //             title: "Ooppss...",
  //             text: 'Login Failed!! ☹️'),
  //       );
  //     } else {
  //       Get.to(
  //         AnimatedPageRouteLeft(
  //           child: HomeScreen(),
  //         ),
  //       );
  //     }
  //   }
  // }

