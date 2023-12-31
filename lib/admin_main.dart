import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sirefis_mobile/tambah_admin.dart';
import 'package:sirefis_mobile/theme/colors.dart';

import 'form_tambah_gpu.dart';
import 'form_update_gpu.dart';
import 'form_update_rekomendasi.dart';

import 'package:http/http.dart' as http;
import 'package:sirefis_mobile/model/item.dart';

import 'gpu_request.dart';
import 'model/env.dart';

void main() {
  runApp(AdminMain());
}

List<Item> items = [];

Future getGpu() async {
  // var response = await http.get(Uri.http('192.168.1.4:8000', 'api/gpu'));
  var response = await http.get(Uri.http(link, 'api/gpu'));

  var jsonData = jsonDecode(response.body);
  if (items.isNotEmpty) {
    items.clear();
    print("it is empty");
  }

  for (var perData in jsonData) {
    final item = Item(
        name: perData['gpu_name'],
        price: perData['price'].toString(),
        id: perData['gpu_id'].toString());
    items.add(item);
  }
  // print(items.length);
  print('helo');
}

class AdminMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _AdminMainState(),
    );
  }
}

class _AdminMainState extends StatefulWidget {
  @override
  State<_AdminMainState> createState() => _AdminMainStateBody();
}

class _AdminMainStateBody extends State<_AdminMainState> {
  Future deleteItem(String id) async {
    // var res = await http.post(Uri.http("192.168.77.88:8000", "api/delete_data"),
    //     // var res = await http.post(Uri.http("192.168.1.4:8000", "api/delete_data"),
    //     body: {"gpu_id": id.toString()});
    // print(res.body);
    print("id" + id);
    // setState(() {

    // });
    // Navigator.pop(context);
  }

  int _currentIndex = 0;
  Future<Item?>? item;

  List<Widget> body = const [
    Icon(Icons.sort),
    Icon(Icons.person),
    Icon(Icons.upload),
    Icon(Icons.add)
  ];

  // void clickDeleteButton() {
  //   setState(() {
  //     // item = deleteitem();
  //   });
  // }

  // get data gpu

  //delete api request
  // Future deleteItem(String id) async {
  //   final uri = Uri.parse('127.0.0.1:8000/api/delete_data');
  //   // final uri = Uri.parse('192.168.78.36:8000/api/gpu');
  //   final response = await http.post(uri, body: {"gpu_id": id.toString()});
  //   // return "deleted"
  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     throw Exception('failed to load item');
  //   }
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getGpu();
    // deleteItem(id)
    // double width = MediaQuery.of(context).size.width * 0.6;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: false,
          title: const Text(
            "Admin",
          ),
          actions: [
            // IconButton(
            //     onPressed: () {
            //       showSearch(
            //           context: context, delegate: CustomSearchDelegate());
            //     },
            //     icon: const Icon(Icons.search))
            IconButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SearchPage())),
                icon: const Icon(Icons.search))
          ],
        ),
        body: Column(
          children: [
            //testi
            Expanded(
              child: FutureBuilder(
                  future: getGpu(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // showDialogFunc(context, listGambar[index],
                              //     items[index].name, items[index].price);
                              showDialogFunc(context, items[index].name,
                                  items[index].price, items[index].id);
                            },
                            child: Padding(
                              // padding: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, top: 8, bottom: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListTile(
                                  title: Text(
                                    items[index].name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    'Harga : Rp.' + items[index].price,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
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
                    MaterialPageRoute(builder: (context) => GpuRequest()),
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
                BottomNavigationBarItem(
                    label: "Request GPU", icon: Icon(Icons.list)),
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

  showDialogFunc(context, title, desc, id) {
    return showDialog(
        context: context,
        builder: (context) {
          // var clickDeleteButton;
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width * 0.7,
                height: 390,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        "https://images.tokopedia.net/img/cache/700/VqbcmM/2021/6/9/ce58332a-9b75-4c5e-9776-21db1004624e.jpg",
                        width: 200,
                        height: 200,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                                    builder: (context) => UpdateGpu(
                                          gpuId: id,
                                        )),
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
                            onPressed: () async {
                              var res = await http.post(
                                  Uri.http(link, "api/delete_data"),
                                  // Uri.http("192.168.57.133:8000", "api/delete_data"),
                                  body: {"gpu_id": id});
                              setState(() {});
                              Navigator.pop(context);
                            },
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
}

// showDialogFunc(context, img, title, desc) {

//search
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _AdminMainState admin = new _AdminMainState();

  List<Item> items = [];
  @override
  Widget build(BuildContext context) {
    Future<void> searchItem(params) async {
      List<Item> searchedItems = [];
      var response = await http.get(Uri.http(link, 'api/search_gpu/$params'));
      // .get(Uri.http('192.168.57.133:8000', 'api/search_gpu/$params'));
      var jsonData = jsonDecode(response.body);

      for (var perData in jsonData) {
        final item = Item(
            name: perData['gpu_name'],
            price: perData['price'],
            id: perData['gpu_id']);
        searchedItems.add(item);
      }

      setState(() {
        items.clear(); // Clear the existing items
        items = searchedItems;
      });

      print(response.body);
    }

    var inputan = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: TextField(
              // controller: inputan, //clear masih bug, waktu input clear sendiri
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: inputan.clear,
                  icon: const Icon(Icons.clear),
                ),
                hintText: 'Cari Produk...',
                border: InputBorder.none,
              ),
              // harusnya ada event bubble
              onChanged: (value) => searchItem(value),
              onSubmitted: (value) {
                searchItem(value);
              },
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //   // showDialogFunc(context, listGambar[index],
              //   //     items[index].name, items[index].price);
              // admin.showDialogFunc(context, items[index].name, items[index].price,
              //     items[index].id);
            },
            child: Padding(
              // padding: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                top: 8,
                bottom: 8,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    items[index].name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Harga : Rp.${items[index].price}',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


//search youtube
// class SearchPage extends StatelessWidget {
//   const SearchPage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Container(
//           width: double.infinity,
//           height: 40,
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(5)),
//           child: Center(
//               child: TextField(
//             decoration: InputDecoration(
//                 prefixIcon: const Icon(Icons.search),
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.clear),
//                   onPressed: () {
//                     //
//                   },
//                 ),
//                 hintText: 'Cari Produk...',
//                 border: InputBorder.none),
//             onSubmitted: (value) {
//               print('infokan logika pencarian');
//             },
//           )),
//         ),
//       ),
//     );
//   }
// }

//search bar
// class CustomSearchDelegate extends SearchDelegate {
//   List<String> searchTerms = [];

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       )
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var halo in searchTerms) {
//       if (halo.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(halo);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var halo in searchTerms) {
//       if (halo.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(halo);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }

//   //kosongan
//   // @override
//   // Widget buildSuggestions(BuildContext context) {
//   //   // Tidak ada suggestion, hanya search bar
//   //   return Container();
//   // }
// }
