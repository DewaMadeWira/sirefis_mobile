import 'package:flutter/material.dart';
import 'package:sirefis_mobile/components/admin_main_perusahaan.dart';
import 'package:sirefis_mobile/components/admin_main_produk.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List _vga = [
    'VGA 1',
    'VGA 2',
    'VGA 3',
    'VGA 4',
    'VGA 5',
    'VGA 6',
  ];

  final List _perusahaan = [
    'NVIDIA',
    'AMD',
    'Perusahaan 3',
    'Perusahaan 4',
  ];

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.deepPurple[300],
        //   centerTitle: true,
        //   title: const Text(
        //     "List GPU",
        //     textAlign: TextAlign.center,
        //   ),
        // ),
        body: Column(
          children: [
            //Pilih perusahaan
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: _perusahaan.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Bulat(
                      child: _perusahaan[index],
                    );
                  },
                ),
              ),
            ),

            //Isi produk dari perusahaan
            Expanded(
              // flex: 4,
              child: ListView.builder(
                itemCount: _vga.length,
                itemBuilder: (context, index) {
                  return Kotak(
                    child: _vga[index],
                  );
                },
                // physics: NeverScrollableScrollPhysics(), ga iso scroll
                // children: <Widget>[
                //   Column(
                //     children: [
                //       Kotak(),
                //       Kotak(),
                //       Kotak(),
                //       Kotak(),
                //       Kotak(),
                //       Kotak(),
                //     ],
                //   )
                // ],
              ),
            ),

            FloatingActionButton.extended(
              // backgroundColor: Colors.orangeAccent[200],
              onPressed: () {
                // Respond to button press
              },
              icon: Icon(Icons.upload),
              label: Text(
                'Update Rekomendasi',
                style: TextStyle(fontSize: 18),
              ),
            ),

            // --FOOTER SHOPEE--
            // Column(
            //   children: [
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            //   // children: [
            //   //   Text(
            //   //     "Testimoni",
            //   //     style: TextStyle(fontSize: 80),
            //   //   ),
            //   // ],
            // ),

            // Positioned(
            //   // bottom: 100,
            //   // left: 100,
            //   // right: 100,
            //   child:
            //       // ElevatedButton(
            //       //     onPressed: () {},
            //       //     style: ElevatedButton.styleFrom(
            //       //       shape: RoundedRectangleBorder(
            //       //         borderRadius: BorderRadius.circular(20),
            //       //       ),
            //       //       primary: Colors.blue[800],
            //       //     ),
            //       //     child: Text(
            //       //       "Update Rekomendasi",
            //       //       style: TextStyle(fontSize: 20),
            //       //     )),
            //       Container(
            //     decoration: BoxDecoration(color: Colors.yellow, boxShadow: [
            //       BoxShadow(
            //           blurRadius: 20,
            //           color: Colors.black.withOpacity(0.4),
            //           offset: Offset.zero),
            //     ]),
            //     height: 80,
            //     child: Row(
            //       children: [
            //         Icon(Icons.edit),
            //         Icon(Icons.upload_file),
            //         Icon(Icons.graphic_eq)
            //       ],
            //     ),
            //   ),
            // )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
