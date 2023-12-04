import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sirefis_mobile/components/dropDownFilter.dart';
import 'package:sirefis_mobile/theme/colors.dart';
import 'package:http/http.dart' as http;

import 'model/item.dart';

class AllGpu extends StatefulWidget {
  const AllGpu({super.key});

  @override
  State<AllGpu> createState() => _AllGpuState();
}

class _AllGpuState extends State<AllGpu> {
  String dropdownTipe = "Terbaru";
  List<String> tipeList = [
    "Terbaru",
    "Terlama",
  ];

  List<Item> itemList = [
    // Item(name: "NVIDIA GTX 950", price: "25.000.000"),
    // Item(name: "NVIDIA GTX 1050", price: "10.000.000"),
  ];

  void setTipe(String newValue) {
    setState(() {
      dropdownTipe = newValue;
    });
  }

  List<Item> items = [];

  void textme() {
    print("this is text");
  }

  // Future getGpu() async {
  //   // var res = await http.get(Uri.http("192.168.1.11:8080", "gpu"));
  //   var res = await http.get(Uri.http("10.211.113.8:8000", "api/gpu"));
  //   var jsonData = jsonDecode(res.body);
  //   if (items.isNotEmpty) {
  //     items.clear();
  //     print("it is empty");
  //   }
  //   for (var itemData in jsonData) {
  //     final item = Item(
  //         name: itemData["gpu_name"], price: itemData["price"],id:itemData["gpu_id"].toString());
  //     items.add(item);
  //   }

  //   print(items.length);
  // }
  Future getGpu()async{
    var response = await http.get(Uri.http('10.211.113.8:8000','api/gpu'));
    var jsonData = jsonDecode(response.body);

    for (var gpu_data in jsonData){
      final item = Item(
        name: gpu_data['gpu_name'], 
        price: gpu_data['price'].toString(),
        id: gpu_data['gpu_id'].toString(),
      );
      items.add(item);
    }
    print(items.length);
  }

  @override
  Widget build(BuildContext context) {
    // textme();
    //getGpu();
    // return FutureBuilder(builder: builder)
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: primaryColor,
            elevation: 0,
          ),
          body:
          ListView(children: [
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text(
                    "Semua \nGPU",
                    style: GoogleFonts.jura(
                        fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Urutkan :",
                    style: GoogleFonts.jura(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropDownFilter(
                      item: dropdownTipe,
                      itemList: tipeList,
                      onChange: setTipe),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(height: 600.0,
                                child:
                        FutureBuilder(
                      future: getGpu(), 
                      builder: (context, snapshot){
                        if(snapshot.connectionState == ConnectionState.done){
                          return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index){
                              return ListTile(
                                title: Text(items[index].name),
                                subtitle: Text(items[index].price),
                              );
                            },
                          );
                        }else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })),
                  // Column(
                  //   children: [
                  //     Expanded(child: SizedBox(height: 200.0,
                  //               child:
                  //       FutureBuilder(
                  //     future: getGpu(), 
                  //     builder: (context, snapshot){
                  //       if(snapshot.connectionState == ConnectionState.done){
                  //         return ListView.builder(
                  //           itemCount: items.length,
                  //           itemBuilder: (context, index){
                  //             return ListTile(
                  //               title: Text(items[index].name),
                  //               subtitle: Text(items[index].price),
                  //             );
                  //           },
                  //         );
                  //       }else {
                  //         return Center(
                  //           child: CircularProgressIndicator(),
                  //         );
                  //       }
                  //     })),
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
          ]),
        );
        
        }
      }
      
    
  

