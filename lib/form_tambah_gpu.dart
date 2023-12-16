import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sirefis_mobile/admin_main.dart';
import 'package:sirefis_mobile/theme/colors.dart';
import 'package:http/http.dart' as http;

import 'model/env.dart';

void main() {
  runApp(const TambahGpu());
}

class TambahGpu extends StatelessWidget {
  const TambahGpu({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 123, 167, 126)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ' '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _gpu_name = TextEditingController();
  final _g3dmark = TextEditingController();
  final _g2dmark = TextEditingController();
  final _price = TextEditingController();
  final _gpu_value = TextEditingController();
  final _tdp = TextEditingController();
  final _power_performance = TextEditingController();
  final _test_date = TextEditingController();
  final _category = TextEditingController();
  final _company = TextEditingController();

  postData() async {
    // try {
    var response = await http.post(Uri.http(link, 'api/create_data'), body: {
      // "gpu_id": 1.toString(), //387
      "gpu_name": _gpu_name.text.toString(),
      "G3Dmark": _g3dmark.text.toString(),
      "G2Dmark": _g2dmark.text.toString(),
      "price": _price.text,
      "gpu_value": _gpu_value.text.toString(),
      "TDP": _tdp.text.toString(),
      "power_performance": _power_performance.text.toString(),
      "test_date": _test_date.text.toString(),
      "category": _category.text.toString(),
      "company": _company.text
    });
    print(response.body);
    // } catch (e) {
    //   print(e);
    // }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.green,
      //   title: Text(widget.title),
      // ),
      body: ListView(
        children: [
          // FloatingActionButton(
          //   onPressed: () {
          //     // print('hello');
          //     postData();
          //   },
          //   tooltip: 'Increment',
          // ),
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                width: 370, //lebar
                height: 970, //tinggi
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 25)),
                    Text(
                      'Tambah GPU\n',
                      style: GoogleFonts.jura(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    // Padding(padding: EdgeInsets.all(33)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          width: 180, //lebar
                          height: 137, //tinggi
                          child: Column(
                            children: [
                              Image.asset('assets/images/pluslogo.png',
                                  height: 75),
                              Text("Tambah Gambar")
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                            ),
                            Text(
                              'Nama GPU',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 160, //lebar
                              height: 36, //tinggi
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: TextField(controller: _gpu_name),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                            ),
                            Text(
                              'Harga',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 160, //lebar
                              height: 36, //tinggi
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: TextField(
                                  controller: _price,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                            ),
                            Text(
                              'Tahun Produksi',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 160, //lebar
                              height: 36, //tinggi
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: TextField(
                                  controller: _test_date,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                            ),
                            Text(
                              'G3Dmark',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 160, //lebar
                              height: 36, //tinggi
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: TextField(
                                  controller: _g3dmark,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                            ),
                            Text(
                              'G2Dmark',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 160, //lebar
                              height: 36, //tinggi
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: TextField(
                                  controller: _g2dmark,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                            ),
                            Text(
                              'GPU value',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 160, //lebar
                              height: 36, //tinggi
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: TextField(
                                  controller: _gpu_value,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                            ),
                            Text(
                              'TDP',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 160, //lebar
                              height: 36, //tinggi
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: TextField(
                                  controller: _tdp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                            ),
                            Text(
                              'Power Performance',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 160, //lebar
                              height: 36, //tinggi
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: TextField(
                                  controller: _power_performance,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                            ),
                            Text(
                              'Category',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 160, //lebar
                              height: 36, //tinggi
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: TextField(
                                  controller: _category,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                            ),
                            Text(
                              'Company',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 160, //lebar
                              height: 36, //tinggi
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: TextField(
                                  controller: _company,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                postData();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => AdminMain()),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  border: Border.all(width: 2),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                width: 154, //lebar
                                height: 36, //tinggi
                                alignment: Alignment.center,
                                child: Text("Tambah",
                                    style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: const Color.fromARGB(
                                            255, 0, 0, 0))),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
