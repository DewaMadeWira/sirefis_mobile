import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sirefis_mobile/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 123, 167, 126)),
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
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Request GPU',
                  style: GoogleFonts.jura(
                    fontWeight: FontWeight.bold,
                    fontSize: 40
                  ),
                ),
                Text('Baru',
                  style: GoogleFonts.jura(
                    fontWeight: FontWeight.bold,
                    fontSize: 40
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 19),
              ),
              Text("Tambah Gambar"),
            ],
          ),
          Padding(padding: EdgeInsets.all(15)
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                width: 180,   //lebar 
                height: 137,  //tinggi
                child: Image(image: NetworkImage("https://static.thenounproject.com/png/2703351-200.png",scale: 4)),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(15)
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19),
                  ),
                  Text("Nama GPU",
                    style: GoogleFonts.inter(
                      fontSize: 16
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(4)
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
                    width: 355,   //lebar
                    height: 40,   //tinggi
                  ),
                ],
              ),

              Padding(padding: EdgeInsets.all(4)
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19),
                  ),
                  Text("Harga",
                    style: GoogleFonts.inter(
                      fontSize: 16
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(4)
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
                    width: 355,   //lebar
                    height: 40,   //tinggi
                  ),
                ],
              ),

              Padding(padding: EdgeInsets.all(4)
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19),
                  ),
                  Text("Tahun Produksi",
                    style: GoogleFonts.inter(
                      fontSize: 16
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(4)
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
                    width: 355,   //lebar
                    height: 40,   //tinggi
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(30)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                      width: 154,   //lebar
                      height: 36,   //tinggi
                      alignment: Alignment.center,
                      child: 
                        Text("Tambahkan",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
     
    );
  }
}
