import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sirefis_mobile/home.dart';
import 'package:sirefis_mobile/home_perusahaan.dart';
import 'package:sirefis_mobile/theme/colors.dart';
// import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                Text("Login",
                    // Theme.of(context).textTheme.headlineLarge,
                    // style: TextStyle(fontSize: 38, color: Colors.black),
                    style: GoogleFonts.jura(fontSize: 38)),
                SizedBox(height: 10),
                Text(
                  "Sebagai Perusahaan",
                  // style: TextStyle(fontSize: 20, color: Colors.black),
                  style: GoogleFonts.jura(fontSize: 20),
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
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePerusahaan(),
                          ));
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Anda bukan Perusahaan ?",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child: Text(
                        "Kembali",
                        style: TextStyle(fontSize: 18),
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