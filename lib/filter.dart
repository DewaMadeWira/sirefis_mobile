import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sirefis_mobile/components/dropDownFilter.dart';
import 'package:sirefis_mobile/theme/colors.dart';
import 'package:http/http.dart' as http;

import 'model/env.dart';
import 'model/item.dart';

class FilterPage extends StatefulWidget {
  final bool termurahState;
  final bool termahalState;
  final bool desktopState;
  final bool workstationState;
  final bool amd;
  final bool nvidia;
  final String hargaAwal;
  final String hargaAkhir;
  const FilterPage(
      {super.key,
      required this.termurahState,
      required this.termahalState,
      required this.desktopState,
      required this.amd,
      required this.nvidia,
      required this.workstationState,
      required this.hargaAwal,
      required this.hargaAkhir});
  @override
  State<FilterPage> createState() => _FilterPageState();
  // get _amd=>amd;
}

class _FilterPageState extends State<FilterPage> {
  String dropdownTipe = "Tertinggi";
  List<String> tipeList = [
    "Tertinggi",
    "Terendah",
  ];

  List<Item> itemList = [
    // Item(name: "NVIDIA GTX 950", price: "25.000.000"),
    // Item(name: "NVIDIA GTX 1050", price: "10.000.000"),
  ];

  // bool get getamd => amd;

  // get desktop => null;

  // get workstation => null;

  // get priceMin => null;

  // get priceMax => null;

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
  //   var res = await http.get(Uri.http("192.168.136.40:8080", "gpu"));
  //   var jsonData = jsonDecode(res.body);
  //   if (items.isNotEmpty) {
  //     items.clear();
  //     print("it is empty");
  //   }
  //   for (var itemData in jsonData) {
  //     final item = Item(
  //         name: itemData["gpu_name"], price: itemData["gpu_price"].toString());
  //     items.add(item);
  //   }

  //   print(items.length);
  // }

  // for rank gpu
  Future getGpu() async {
    // var res = await http.get(Uri.http("192.168.1.11:8080", "gpu"));
    print(widget.amd.toString());
    print(widget.nvidia.toString());
    print(widget.desktopState.toString());
    print(widget.workstationState.toString());
    print(widget.hargaAwal.toString());
    print(widget.hargaAkhir.toString());
    var res =
        // await http.post(Uri.http("192.168.71.71:8000", "api/gpu-rank"), body: {
        await http.post(Uri.http(link, "api/gpu-rank"), body: {
      "amd": widget.amd.toString(),
      "nvidia": widget.nvidia.toString(),
      "desktop": widget.desktopState.toString(),
      "workstation": widget.workstationState.toString(),
      "priceMin": widget.hargaAwal.toString(),
      "priceMax": widget.hargaAkhir.toString()
    });

    // print(res.body);
    var jsonData = jsonDecode(res.body);
    print("hello");
    // print(jsonData);
    if (items.isNotEmpty) {
      items.clear();
      print("it is empty");
    }
    // final item = Item(
    //     name: jsonData[0]["gpu_name"],
    //     price: jsonData[0]["price"].toString(),
    //     id: jsonData[0]["gpu_id"].toString());
    // items.add(item);

    print(jsonData[0]["gpu_name"]);
    for (var itemData in jsonData) {
      final item = Item(
          name: itemData["gpu_name"],
          price: itemData["price"].toString(),
          id: itemData["gpu_id"].toString());
      items.add(item);
    }

    print(items[0]);
  }

  @override
  Widget build(BuildContext context) {
    getGpu();
    // return FutureBuilder(builder: builder)
    return FutureBuilder(
        future: getGpu(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              backgroundColor: backgroundColor,
              appBar: AppBar(
                backgroundColor: primaryColor,
                elevation: 0,
              ),
              body: ListView(children: [
                Container(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hasil \nRekomendasi",
                        style: GoogleFonts.jura(fontSize: 36),
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
                              itemCount: items.length,
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
                                          borderRadius:
                                              BorderRadius.circular(13)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                  items[index].name,
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
                                                "\$${items[index].price}",
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
          } else {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: backgroundColor,
              color: primaryColor,
            ));
          }
        });
  }
}
