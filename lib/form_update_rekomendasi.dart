import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sirefis_mobile/theme/colors.dart';

void main() {
  runApp(const UpdateRekomendasi());
}

class UpdateRekomendasi extends StatelessWidget {
  const UpdateRekomendasi({super.key});

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  String valueChoose = "RTX 3090";
  List listitem=[
    "RTX 3090","RTX 2070","RTX 3050","RTX 2050","GTX 1080","GTX 950"
  ];

  String valueChoose1 = "RTX 3090";
  List listitem1=[
    "RTX 3090","RTX 2070","RTX 3050","RTX 2050","GTX 1080","GTX 950"
  ];


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
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10)
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(30)
              ),
              Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: primaryColor,
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                width: 380,   //lebar 
                height: 480,  //tinggi
                padding: EdgeInsets.all(50),
                child: Column(
                  children: [
                    Text('Form Update',
                      style: GoogleFonts.jura(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),

                    Padding(padding: EdgeInsets.all(20)
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                        ),
                        Text('Update GPU Terbaik',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            
                          ),
                        ),
                      ],
                    ), 
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 19),
                      alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: DropdownButton<String>(
                        value: valueChoose,
                        onChanged: (String? newValue){
                          setState(() {
                            valueChoose = newValue!;
                          });
                        },
                        items: listitem.map((valueItem) {
                          return DropdownMenuItem<String>(
                            value : valueItem,
                            child :Text(valueItem),
                          );
                        }).toList(),
                    
                    
                      ),
                    ),

                    Padding(padding: EdgeInsets.all(20)
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                        ),
                        Text('Rekomendasi serupa',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            
                          ),
                        ),
                      ],
                    ), 
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 19),
                      alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: DropdownButton<String>(
                        value: valueChoose1,
                        onChanged: (String? newValue){
                          setState(() {
                            valueChoose1 = newValue!;
                          });
                        },
                        items: listitem1.map((valueItem) {
                          return DropdownMenuItem<String>(
                            value : valueItem,
                            child :Text(valueItem),
                          );
                        }).toList(),
                    
                    
                      ),
                    ),
                  ],
                  
                ),
                
              ),
            ],
          )
        ],
      )
       
    );
  }
}

