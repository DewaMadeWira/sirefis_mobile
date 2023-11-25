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
  int _currentIndex = 0;

  List<Widget> body = const [
    Icon(Icons.sort),
    Icon(Icons.person),
    Icon(Icons.upload),
    Icon(Icons.add)
  ];

  List<Item> items = [];

  // get data gpu
  Future getGpu() async {
    // var response = await http.get(Uri.http('127.0.0.1:8000', 'api/gpu'));
    // var response = await http.get(Uri.http('192.168.0.104:8000', 'api/gpu'));
    var response = await http.get(Uri.http('192.168.0.105:8000', 'api/gpu'));
    var jsonData = jsonDecode(response.body);

    for (var perData in jsonData) {
      final item = Item(name: perData['gpu_name'], price: perData['price']);
      items.add(item);
    }
    print(items.length);

    // print(response.body);
  }

  //get data gpt
  // Future<void> getGpu() async {
  //   var response = await http.get(Uri.http('192.168.0.105:8000', 'api/gpu'));
  //   var jsonData = jsonDecode(response.body);
  //   setState(() {
  //     items.clear(); // Clear the existing items
  //     for (var perData in jsonData) {
  //       final item = Item(name: perData['gpu_name'], price: perData['price']);
  //       items.add(item);
  //     }
  //     // Set search terms with the names of GPUs
  //     CustomSearchDelegate().searchTerms =
  //         items.map((item) => item.name).toList();
  //   });

  //   print(items.length);
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // getGpu();
    double width = MediaQuery.of(context).size.width * 0.6;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: false,
          title: const Text(
            "Admin",
            // textAlign: TextAlign.center,
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
                                  items[index].price);
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

// showDialogFunc(context, img, title, desc) {
showDialogFunc(context, title, desc) {
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

//search
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
              child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    //
                  },
                ),
                hintText: 'Cari Produk...',
                border: InputBorder.none),
          )),
        ),
      ),
    );
  }
}

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
