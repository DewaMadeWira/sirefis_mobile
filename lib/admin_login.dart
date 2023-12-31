import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sirefis_mobile/home.dart';
import 'package:sirefis_mobile/secure_storage.dart';
import 'package:sirefis_mobile/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'admin_main.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

import 'model/env.dart';
// import 'package:flutter/rendering.dart';

final dio = Dio();

final _username = TextEditingController();
final _password = TextEditingController();

void main() {
  runApp(const LoginAdmin());
}

class LoginAdmin extends StatelessWidget {
  Future<bool> login() async {
    // Create a CookieJar
    // final cookieJar = CookieJar();

    var response = await http.post(
        // Uri.http('127.0.0.1:8000', 'api/login-admin'),
        Uri.http(link, 'api/login-admin'),
        body: {"email": _username.text, "password": _password.text});

    print(response.statusCode);
    if (response.statusCode == 401) {
      print("wrong credentials");
      return false;
    }
    // print(response.body.toString());
    Get.to(AdminMain());
    // return '';
    return true;
    // if (!context.mounted) return;
    // // Navigator.pop(context);
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => AdminMain()));
    // print("logged in");
    // final token = response.body.toString();
    // // print(token);
    // final storage = new SecureStorage();
    // await storage.writeSecureData('token', token);
    // await storage.readSecureData('token');

    // // Attach the CookieJar to Dio
    // dio.interceptors.add(CookieManager(cookieJar));
    // Response response = await dio.post(
    //   'http://192.168.1.16:8000/api/login-admin',
    //   data: {"email": "dedemade2002@gmail.com", "password": "12345"},
    // );

    // Future<List<Cookie>> cookies = cookieJar
    //     .loadForRequest(Uri.parse('http://192.168.1.16:8000/api/login-admin'));
    // print(cookies);
    // print('Cookies from response: $cookies');
    // final response = await http.post(
    //   Uri.parse('http://127.0.0.1:8000/api/login-admin'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(<String, String>{
    //     "email": "dedemade2002@gmail.com",
    //     "password": "12345"
    //   }),
    // );

    // print(response.data);

    // final cookies = response.headers.map['set-cookie'];
    // if (cookies.isNotEmpty && cookies.length == 2) {
    //   final authToken =
    //       cookies[1].split(';')[0]; //it depends on how your server sending cookie
    //   //save this authToken in local storage, and pass in further api calls.

    //   aToken =
    //       authToken; //saving this to global variable to refresh current api calls to add cookie.
    //   print(authToken);
    // }

    // print(cookies);
    //print(response.headers.toString());
  }

  const LoginAdmin({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.deepPurple[300],
        //   centerTitle: true,
        //   title: const Text(
        //     "Login Admin",
        //     textAlign: TextAlign.center,
        //   ),
        // ),
        body: ListView(
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: 215,
                ),
                Text(
                  "Welcome back Admin",
                  // Theme.of(context).textTheme.headlineLarge,
                  style: GoogleFonts.jura(
                      fontSize: 38,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Login ke akun anda",
                  style: GoogleFonts.jura(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  // style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    controller: _username,
                    cursorColor: primaryColor,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(color: primaryColor),
                        prefixIcon: const Icon(
                          Icons.person_2_outlined,
                          size: 26,
                        ),
                        prefixIconColor: primaryColor,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: primaryColor, width: 2))),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(fontSize: 20),
                    controller: _password,
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: primaryColor),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          size: 26,
                        ),
                        prefixIconColor: primaryColor,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: primaryColor, width: 2))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SizedBox(
                    height: 52,
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () {
                          login();
                          // print(login());
                          // if (login() == true) {
                          //   Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //         builder: (context) => AdminMain()),
                          //   );
                          // }
                        },
                        // onPressed: () {
                        //   // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Screen2()));
                        //   Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //         builder: (context) => AdminMain()),
                        //   );
                        // },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // primary: Colors.blue[800],
                          primary: primaryColor,
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Anda bukan admin?",
                      style: GoogleFonts.jura(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                       
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(builder: (context) => Home()),
                        // );
                      },
                      child: Text(
                        "Kembali",
                        style: GoogleFonts.jura(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
