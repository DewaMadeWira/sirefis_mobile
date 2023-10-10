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

  // final List _perusahaan = [
  //   'NVIDIA',
  //   'AMD',
  //   'Perusahaan 3',
  //   'Perusahaan 4',
  // ];

  // List a = [
  //   "https://wallpapers.com/images/featured/minecraft-s2kxfahyg30sob8q.jpg",
  //   "https://wallpapers.com/images/featured/minecraft-s2kxfahyg30sob8q.jpg",
  //   "https://wallpapers.com/images/featured/minecraft-s2kxfahyg30sob8q.jpg",
  //   "https://wallpapers.com/images/featured/minecraft-s2kxfahyg30sob8q.jpg",
  // ];

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
            Container(
              height: 150,
              child: ListView(
                padding: EdgeInsets.only(top: 40),
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.indigo[300],
                      ),
                      // child: Image.network("https://www.nvidia.com/content/dam/en-zz/Solutions/about-nvidia/logo-and-brand/02-nvidia-logo-color-grn-500x200-4c25-p@2x.png"),
                      child: Center(
                          child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://www.nvidia.com/content/dam/en-zz/Solutions/about-nvidia/logo-and-brand/02-nvidia-logo-color-grn-500x200-4c25-p@2x.png'),
                        radius: 46,
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.indigo[300],
                      ),
                      child: Center(
                          child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/AMD_Radeon_logo.svg/2425px-AMD_Radeon_logo.svg.png'),
                        radius: 45,
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.indigo[300],
                      ),
                      child: Icon(Icons.add_business),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.indigo[300],
                      ),
                      child: Icon(Icons.add_business),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.indigo[300],
                      ),
                      child: Icon(Icons.add_business),
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 20),
            //   child: SizedBox(
            //     height: 150,
            //     child: ListView.builder(
            // # Beda File / source yotube
            // itemCount: _perusahaan.length,
            // scrollDirection: Axis.horizontal,
            // itemBuilder: (context, index) {
            //   return Bulat(
            //     child: _perusahaan[index],
            //   );
            // },

            // # Satu File / source web
            // scrollDirection: Axis.horizontal,
            // itemBuilder: (BuildContext ctx, int index) {
            //   return Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Row(
            //       children: [
            //         Image.network(a[index]),
            //       ],
            //     ),
            //   );
            // },
            // itemCount: a.length,
            //     ),
            //   ),
            // ),
            //
            //

            //Isi produk dari perusahaan
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(6, 9),
                            spreadRadius: 0,
                            blurRadius: 9.0,
                          ),
                        ],
                      ),
                      height: 200,
                      child: Container(),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(6, 9),
                            spreadRadius: 0,
                            blurRadius: 9.0,
                          ),
                        ],
                      ),
                      height: 200,
                      child: Center(
                          child: Text(
                        "Ini VGA",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(6, 9),
                            spreadRadius: 0,
                            blurRadius: 9.0,
                          ),
                        ],
                      ),
                      height: 200,
                      child: Center(
                          child: Text(
                        "Ini VGA",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(6, 9),
                            spreadRadius: 0,
                            blurRadius: 9.0,
                          ),
                        ],
                      ),
                      height: 200,
                      child: Center(
                          child: Text(
                        "Ini VGA",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: _vga.length,
            //     itemBuilder: (context, index) {
            //       return Kotak(
            //         child: _vga[index],
            //       );
            //     },
            //     //
            //     // physics: NeverScrollableScrollPhysics(), ga iso scroll
            //     // children: <Widget>[
            //     //   Column(
            //     //     children: [
            //     //       Kotak(),
            //     //       Kotak(),
            //     //       Kotak(),
            //     //       Kotak(),
            //     //       Kotak(),
            //     //       Kotak(),
            //     //     ],
            //     //   )
            //     // ],
            //     //
            //   ),
            // ),

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
