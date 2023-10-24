import 'package:flutter/material.dart';
import 'package:sirefis_mobile/theme/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  int _currentIndex = 0;
  List<Widget> body = const [
    Icon(Icons.sort),
    Icon(Icons.person),
    Icon(Icons.upload),
    Icon(Icons.add)
  ];

  var listJudul = [
    "Ini GPU",
    "Ini GPU",
    "Ini GPU",
    "Ini GPU",
    "Ini GPU",
    "Ini GPU",
    "Ini GPU",
    "Ini GPU",
    "Ini GPU",
    "Ini GPU"
  ];

  var listDeskripsi = [
    "Deskripsi merupakan suatu kumpulan penjelasan tentang sesuatu",
    "Deskripsi merupakan suatu kumpulan penjelasan tentang sesuatu",
    "Deskripsi merupakan suatu kumpulan penjelasan tentang sesuatu",
    "Deskripsi merupakan suatu kumpulan penjelasan tentang sesuatu",
    "Deskripsi merupakan suatu kumpulan penjelasan tentang sesuatu",
    "Deskripsi merupakan suatu kumpulan penjelasan tentang sesuatu",
    "Deskripsi merupakan suatu kumpulan penjelasan tentang sesuatu",
    "Deskripsi merupakan suatu kumpulan penjelasan tentang sesuatu",
    "Deskripsi merupakan suatu kumpulan penjelasan tentang sesuatu",
    "Deskripsi merupakan suatu kumpulan penjelasan tentang sesuatu"
  ];

  var listGambar = [
    "https://pclab.pk/wp-content/uploads/2022/12/Gigabyte-Radeon-RX-6600-EAGLE-8G.jpg",
    "https://pclab.pk/wp-content/uploads/2022/12/Gigabyte-Radeon-RX-6600-EAGLE-8G.jpg",
    "https://pclab.pk/wp-content/uploads/2022/12/Gigabyte-Radeon-RX-6600-EAGLE-8G.jpg",
    "https://pclab.pk/wp-content/uploads/2022/12/Gigabyte-Radeon-RX-6600-EAGLE-8G.jpg",
    "https://pclab.pk/wp-content/uploads/2022/12/Gigabyte-Radeon-RX-6600-EAGLE-8G.jpg",
    "https://pclab.pk/wp-content/uploads/2022/12/Gigabyte-Radeon-RX-6600-EAGLE-8G.jpg",
    "https://pclab.pk/wp-content/uploads/2022/12/Gigabyte-Radeon-RX-6600-EAGLE-8G.jpg",
    "https://pclab.pk/wp-content/uploads/2022/12/Gigabyte-Radeon-RX-6600-EAGLE-8G.jpg",
    "https://pclab.pk/wp-content/uploads/2022/12/Gigabyte-Radeon-RX-6600-EAGLE-8G.jpg",
    "https://pclab.pk/wp-content/uploads/2022/12/Gigabyte-Radeon-RX-6600-EAGLE-8G.jpg"
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
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
            //

            //Search
            Padding(
              padding: const EdgeInsets.only(
                  top: 45, left: 25, right: 25, bottom: 10),
              child: SearchAnchor(
                  builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  controller: controller,
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0)),
                  onTap: () {
                    // controller.openView();
                  },
                  onChanged: (_) {
                    // controller.openView();
                  },
                  leading: const Icon(Icons.search),
                );
              }, suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                return List<ListTile>.generate(3, (int index) {
                  final String item = 'item $index';
                  return ListTile(
                    title: Text(item),
                    onTap: () {},
                  );
                });
              }),
            ),

            //Button urutkan & list admin
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     ElevatedButton(
            //         onPressed: () {},
            //         style: ElevatedButton.styleFrom(primary: primaryColor),
            //         child: Text(
            //           "Urutkan",
            //           style: TextStyle(fontSize: 20),
            //         )),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     ElevatedButton(
            //         onPressed: () {},
            //         style: ElevatedButton.styleFrom(primary: primaryColor),
            //         child: Text(
            //           "List Admin",
            //           style: TextStyle(fontSize: 20),
            //         ))
            //   ],
            // ),

            //
            //List Item
            Expanded(
              child: ListView.builder(
                  itemCount: listGambar.length,
                  itemBuilder: (context, index) {
                    //bisa pakai InkWell
                    return GestureDetector(
                      onTap: () {
                        showDialogFunc(context, listGambar[index],
                            listJudul[index], listDeskripsi[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10.0),
                        child: Card(
                            // color: Colors.black,
                            child: Row(
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 100,
                              child: Image.network(listGambar[index]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listJudul[index],
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: width,
                                    child: Text(
                                      listDeskripsi[index],
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                      ),
                    );
                  }),
            ),

            //Footer
            // Center(
            //   child: body[_currentIndex],
            // ),
            BottomNavigationBar(
              backgroundColor: primaryColor,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
              currentIndex: _currentIndex,
              onTap: (int newIndex) {
                (() {
                  _currentIndex = newIndex;
                });
              },
              items: const [
                // BottomNavigationBarItem(
                //     label: "Urutkan", icon: Icon(Icons.sort)),
                BottomNavigationBarItem(
                    label: "List Admin", icon: Icon(Icons.person)),
                BottomNavigationBarItem(
                    label: "Tambah GPU", icon: Icon(Icons.add)),
                BottomNavigationBarItem(
                    label: "Update Rekomendasi", icon: Icon(Icons.upload)),
              ],
            ),

            //List VGA (----)
            // Expanded(
            //   child: ListView(
            //     children: [
            //       Padding(
            //         padding:
            //             const EdgeInsets.only(left: 25, right: 25, bottom: 20),
            //         child: InkWell(
            //           child: Container(
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(30),
            //               color: Colors.blue[200],
            //               boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.grey,
            //                   offset: Offset(6, 9),
            //                   spreadRadius: 0,
            //                   blurRadius: 9.0,
            //                 ),
            //               ],
            //             ),
            //             height: 200,
            //             child: Container(),
            //           ),
            //           onTap: () {
            //             // print("Kontainer ditekan");
            //             showDialog(
            //               context: context,
            //               builder: (context) => AlertDialog(
            //                 title: Text("Ini judul"),
            //                 content: Text("Ini isi konten"),
            //                 actions: [
            //                   TextButton(
            //                       onPressed: () => Navigator.pop(context),
            //                       child: Text("Ok")),
            //                   TextButton(
            //                       onPressed: () => Navigator.pop(context),
            //                       child: Text("Cancel"))
            //                 ],
            //               ),
            //             );
            //           },
            //         ),
            //       ),
            //       Padding(
            //         padding:
            //             const EdgeInsets.only(left: 25, right: 25, bottom: 20),
            //         child: Container(
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(30),
            //             color: Colors.blue[200],
            //             boxShadow: [
            //               BoxShadow(
            //                 color: Colors.grey,
            //                 offset: Offset(6, 9),
            //                 spreadRadius: 0,
            //                 blurRadius: 9.0,
            //               ),
            //             ],
            //           ),
            //           height: 200,
            //           child: Center(
            //               child: Text(
            //             "Ini VGA",
            //             style: TextStyle(
            //                 fontSize: 35, fontWeight: FontWeight.bold),
            //           )),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            // FloatingActionButton.extended(
            //   // backgroundColor: Colors.orangeAccent[200],
            //   onPressed: () {
            //     // Respond to button press
            //   },
            //   icon: Icon(Icons.upload),
            //   label: Text(
            //     'Update Rekomendasi',
            //     style: TextStyle(fontSize: 18),
            //   ),
            // ),

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

showDialogFunc(context, img, title, desc) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 370,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      img,
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    desc,
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          style:
                              ElevatedButton.styleFrom(primary: primaryColor),
                          child: Text(
                            "Update",
                            style: TextStyle(fontSize: 20),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          child: Text(
                            "Delete",
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
