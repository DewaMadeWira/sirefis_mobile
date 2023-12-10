import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sirefis_mobile/home.dart';
import 'package:sirefis_mobile/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'admin_main.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
// import 'package:flutter/rendering.dart';

final dio = Dio();

void main() {
  runApp(const LoginAdmin());
}

Future login() async {
  // Create a CookieJar
  // final cookieJar = CookieJar();

  var response = await http.post(Uri.http('127.0.0.1:8000', 'api/login-admin'),
      body: {"admin_email": "dewa@gmail.com", "password": "1234"});

  final token =
      jsonDecode(response.headers['host'].toString()) as Map<String, dynamic>;
  print(token);

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

class LoginAdmin extends StatelessWidget {
  const LoginAdmin({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                        // onPressed: login,
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Screen2()));
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => AdminMain()),
                          );
                        },
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
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home()),
                        );
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
