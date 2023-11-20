import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sirefis_mobile/tambah_admin.dart';
import 'package:sirefis_mobile/theme/colors.dart';

import 'form_tambah_gpu.dart';
import 'form_update_gpu.dart';
import 'form_update_rekomendasi.dart';

import 'package:http/http.dart' as http;
import 'package:sirefis_mobile/model/item.dart';

void main() {
  runApp(AdminMain());
}

class AdminMain extends StatefulWidget {
  AdminMain({super.key});

  @override
  State<AdminMain> createState() => _AdminMainState();
}

class _AdminMainState extends State<AdminMain> {
  int _currentIndex = 0;

  List<Widget> body = const [
    Icon(Icons.sort),
    Icon(Icons.person),
    Icon(Icons.upload),
    Icon(Icons.add)
  ];

  var listJudul = [
    "GeForce RTX 3090 Ti",
    "GeForce RTX 3080 Ti",
    "Radeon RX 6900 XT",
    "Radeon RX 6800 XT",
    "GeForce GTX 1080 Ti",
    "Radeon RX 5700 XT",
    "Radeon RX 6600 XT",
    "GeForce GTX 1070 Ti",
    "Radeon Pro WX 8200",
    "GeForce RTX 2060"
  ];

  var listDeskripsi = [
    "Rp22.000.000",
    "Rp12.000.000",
    "Rp10.900.000",
    "Rp7.600.000",
    "Rp6.500.000",
    "Rp2.700.000",
    "Rp2.900.000",
    "Rp2.500.000",
    "Rp2.000.000",
    "Rp2.400.000"
  ];

  var listGambar = [
    "https://asset.msi.com/resize/image/global/product/product_1648779789e2ad4204facc0ea0469f45c5fa07c051.png62405b38c58fe0f07fcef2367d8a9ba1/1024.png",
    "https://images.tokopedia.net/img/cache/700/VqbcmM/2021/6/9/ce58332a-9b75-4c5e-9776-21db1004624e.jpg",
    // "https://negroup.co.id/cni-content/uploads/modules/product/20230614104236.png",
    "https://images.tokopedia.net/img/cache/700/VqbcmM/2021/6/9/ce58332a-9b75-4c5e-9776-21db1004624e.jpg",
    "https://m.media-amazon.com/images/I/81c3PiQLBUL.jpg",
    "https://static.gigabyte.com/StaticFile/Image/Global/cfd28eb85d95190bb6657af85db6e03f/Product/18113/png/500",
    "https://static.gigabyte.com/StaticFile/Image/Global/1c6a447f0fbb1f4c3973ac27adbe3934/Product/22235/Png",
    "https://static.gigabyte.com/StaticFile/Image/Global/7b143496a1f2a11b0e82e72b73bf448b/Product/29612/Png",
    "https://static.gigabyte.com/StaticFile/Image/Global/6c7339b0fc58e935e4ecf245b6d0f9e2/Product/18791/png/500",
    "https://c1.neweggimages.com/ProductImage/14-105-110-V05.jpg",
    "https://static.gigabyte.com/StaticFile/Image/Global/1d408c5715aef2ba51f799ea16d196c2/Product/23131/png/500"
  ];

  List<Item> items = [];

  //get data gpu
  Future getGpu() async {
    // var response = await http.get(Uri.http('127.0.0.1:8000', 'api/gpu'));
    // var response = await http.get(Uri.http('192.168.0.104:8000', 'api/gpu'));
    var response = await http.get(Uri.http('192.168.78.69:8000', 'api/gpu'));
    var jsonData = jsonDecode(response.body);

    for (var perData in jsonData) {
      final item = Item(name: perData['gpu_name'], price: perData['price']);
      items.add(item);
    }
    print(items.length);

    // print(response.body);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // getGpu();
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

            //testi
            Expanded(
              child: FutureBuilder(
                  future: getGpu(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ListTile(
                                title: Text(items[index].name),
                                subtitle: Text(items[index].price),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),

            //
            //List Item
            // Expanded(
            //   child: ListView.builder(
            //       itemCount: listGambar.length,
            //       itemBuilder: (context, index) {
            //         //bisa pakai InkWell
            //         return GestureDetector(
            //           onTap: () {
            //             showDialogFunc(context, listGambar[index],
            //                 listJudul[index], listDeskripsi[index]);
            //           },
            //           child: Padding(
            //             padding: const EdgeInsets.only(
            //                 left: 20, right: 20, bottom: 10.0),
            //             child: Card(
            //                 // color: Colors.black,
            //                 child: Row(
            //               children: <Widget>[
            //                 Container(
            //                   width: 100,
            //                   height: 100,
            //                   child: Image.network(listGambar[index]),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.all(8),
            //                   child: Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Text(
            //                         listJudul[index],
            //                         style: TextStyle(
            //                             fontSize: 25,
            //                             fontWeight: FontWeight.bold),
            //                       ),
            //                       SizedBox(
            //                         height: 10,
            //                       ),
            //                       Container(
            //                         width: width,
            //                         child: Text(
            //                           listDeskripsi[index],
            //                           style: TextStyle(fontSize: 15),
            //                         ),
            //                       )
            //                     ],
            //                   ),
            //                 )
            //               ],
            //             )),
            //           ),
            //         );
            //       }),
            // ),

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
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => TambahAdminApp()),
                // );
                if (newIndex == 0) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TambahAdminApp()),
                  );
                } else if (newIndex == 1) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TambahGpu()),
                  );
                } else if (newIndex == 2) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const UpdateRekomendasi()),
                  );
                }
                setState(() {
                  _currentIndex = newIndex;
                });
                ;
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
              height: 390,
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
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => UpdateGpu()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor, // Background color
                          ),
                          child: Text(
                            "Update",
                            style: TextStyle(fontSize: 20),
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red, // Background color
                          ),
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
