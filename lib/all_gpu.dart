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

  Future getGpu() async {
    // var res = await http.get(Uri.http("192.168.1.11:8080", "gpu"));
    var res = await http.get(Uri.http("192.168.136.40:8080", "gpu"));
    var jsonData = jsonDecode(res.body);
    if (items.isNotEmpty) {
      items.clear();
      print("it is empty");
    }
    for (var itemData in jsonData) {
      final item = Item(
          name: itemData["gpu_name"], price: itemData["gpu_price"],id:itemData["gpu_id"].toString());
      items.add(item);
    }

    print(items.length);
  }

  @override
  Widget build(BuildContext context) {
    // textme();
    // getGpu();
    // return FutureBuilder(builder: builder)
    return FutureBuilder(
      // future: getGpu(),
      builder: (ctx, snapshot) {
        // if (snapshot.connectionState == ConnectionState.done) {
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: primaryColor,
            elevation: 0,
          ),
          body: ListView(children: [
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: itemList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 2,
                                          blurRadius: 7,
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      color: whiteColor,
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                      borderRadius: BorderRadius.circular(13)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Gambar\nTidak\nTersedia',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 150,
                                            child: Text(
                                              itemList[index].name,
                                              style: GoogleFonts.jura(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Rp" + itemList[index].price,
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            );
                          }),
                    ],
                  )
                ],
              ),
            ),
          ]),
        );
        // } else {
        //   return Center(
        //       child: CircularProgressIndicator(
        //     backgroundColor: backgroundColor,
        //     color: primaryColor,
        //   ));
        // }
      },
      future: null,
    );
  }
}
