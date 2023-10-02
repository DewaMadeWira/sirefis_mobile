import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sirefis_mobile/components/dropDownFilter.dart';
import 'package:sirefis_mobile/theme/colors.dart';

import 'model/item.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String dropdownTipe = "Tertinggi";
  List<String> tipeList = [
    "Tertinggi",
    "Terendah",
  ];

  List<Item> itemList = [
    Item(name: "NVIDIA GTX 950", price: "25.000.000"),
    Item(name: "NVIDIA GTX 1050", price: "10.000.000"),
  ];

  void setTipe(String newValue) {
    setState(() {
      dropdownTipe = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Container(
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
                item: dropdownTipe, itemList: tipeList, onChange: setTipe),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: itemList.length,
                    itemBuilder: (context, index) {
                      return Container(
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
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(13)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                      );
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
