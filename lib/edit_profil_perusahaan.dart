import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sirefis_mobile/home_perusahaan.dart';
import 'package:sirefis_mobile/theme/colors.dart';

void main() {
  runApp(const EditProfilPerusahaan());
}

class EditProfilPerusahaan extends StatelessWidget {
  const EditProfilPerusahaan({super.key});

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.all(30)),
              Container(
                  width: 190.0, // Lebar lingkaran
                  height: 190.0, // Tinggi lingkaran
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  )),
            ],
          ),
          Padding(padding: EdgeInsets.all(30)),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                  ),
                  Text(
                    "Nama Perusahaan",
                    style: GoogleFonts.jura(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: 320, //lebar
                    height: 36, //tinggi
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(15)),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                  ),
                  Text(
                    "CEO",
                    style: GoogleFonts.jura(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: 320, //lebar
                    height: 36, //tinggi
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(15)),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                  ),
                  Text(
                    "Lokasi",
                    style: GoogleFonts.jura(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: 320, //lebar
                    height: 36, //tinggi
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(60)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => HomePerusahaan()),
                      )
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      width: 110, //lebar
                      height: 36, //tinggi
                      alignment: Alignment.center,
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.inter(
                            fontSize: 12, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: 110, //lebar
                    height: 36, //tinggi
                    alignment: Alignment.center,
                    child: Text(
                      "Save",
                      style:
                          GoogleFonts.inter(fontSize: 12, color: Colors.black),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
