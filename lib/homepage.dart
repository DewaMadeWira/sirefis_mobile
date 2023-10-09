import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 248, 31, 31)),
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
      backgroundColor: Color.fromARGB(255, 237, 237, 237),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Keluaran',
                  style: GoogleFonts.jura(
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
                ),
                Text('Terbaru',
                  style: GoogleFonts.jura(
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(14.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey, // Warna bayangan
                      blurRadius: 4.0,      // Radius blur bayangan
                      spreadRadius: 0.0,    // Radius penyebaran bayangan
                      offset: Offset(0,4)   // Offset bayangan (0, 4) untuk bayangan ke bawah
                    ),
                  ],
                ),
                width: 300,   //lebar 
                height: 320,  //tinggi
                child: Image(image: NetworkImage("https://ddtech.mx/assets/uploads/90589e76995d464f5728dee02b68fbd2.jpg")
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text('Lainnya :',
                  style: GoogleFonts.jura(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(14.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey, // Warna bayangan
                      blurRadius: 4.0,      // Radius blur bayangan
                      spreadRadius: 0.0,    // Radius penyebaran bayangan
                      offset: Offset(0,4)   // Offset bayangan (0, 4) untuk bayangan ke bawah
                    ),
                  ],
                ),
                width: 145,       // Lebar kontainer
                height: 180,     // Tinggi kontainer
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Image(image: NetworkImage("https://pclab.pk/wp-content/uploads/2022/12/Gigabyte-Radeon-RX-6600-EAGLE-8G.jpg"),
                    width: 105,       // Lebar image
                    height: 95,     // Tinggi image
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0)
                    ),
                    Text('rekomendasi kami')
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(14.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey, // Warna bayangan
                      blurRadius: 4.0,      // Radius blur bayangan
                      spreadRadius: 0.0,    // Radius penyebaran bayangan
                      offset: Offset(0,4)   // Offset bayangan (0, 4) untuk bayangan ke bawah
                    ),
                  ],
                ),
                width: 145,       // Lebar kontainer
                height: 180,     // Tinggi kontainer
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Image(image: NetworkImage("https://static.vecteezy.com/system/resources/previews/000/582/976/original/button-plus-icon-vector.jpg"),
                    width: 105,       // Lebar image
                    height: 89,     // Tinggi image
                    ),
                    Padding(
                      padding: EdgeInsets.all(11.0)
                    ),
                    Text('pilih rekomendasi sendiri'),
                  ],
                ),
              ),
            ],
          ),
          
          Padding(
            padding: const EdgeInsets.all(20.0),
          ),
          
        ],
      ),
    );
  }
}
