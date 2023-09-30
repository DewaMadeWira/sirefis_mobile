import 'package:flutter/material.dart';
import 'package:sirefis_mobile/components/dropDownFilter.dart';
import 'package:sirefis_mobile/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/btnFilter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownPerusahaan = "NVIDIA";
  List<String> perusahaanList = ["NVIDIA", "AMD", "Apple"];

  void setPerusahaan(String newValue) {
    setState(() {
      dropdownPerusahaan = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.black,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      width: 1, // thickness
                      color: Colors.black // color
                      ),
                  borderRadius: BorderRadius.circular(8))),
          onPressed: () {
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10.0),
                  ),
                ),
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Wrap(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pilih Kriteria Rekomendasi",
                            style: GoogleFonts.jura(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Tertinggi",
                            style: GoogleFonts.jura(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              BtnFilter(text: "Terendah"),
                              BtnFilter(text: "Tertinggi"),
                              BtnFilter(text: "Termahal"),
                              BtnFilter(text: 'Termurah')
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Perusahaan",
                            style: GoogleFonts.jura(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          DropDownFilter(
                              item: dropdownPerusahaan,
                              itemList: perusahaanList,
                              onChange: setPerusahaan),
                          SizedBox(
                            height: 10,
                          ),

                          // BtnFilter(),
                          Text(
                            "Tipe",
                            style: GoogleFonts.jura(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Rentang Harga",
                            style: GoogleFonts.jura(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Tahun",
                            style: GoogleFonts.jura(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ]),
                  );
                });
          },
          child: Text("Click me")),
    );
  }
}
