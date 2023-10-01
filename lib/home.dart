import 'package:flutter/material.dart';
import 'package:sirefis_mobile/components/dropDownFilter.dart';
import 'package:sirefis_mobile/components/inputFilter.dart';
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

  String dropdownTipe = "Desktop";
  List<String> tipeList = ["Desktop", "Laptop", "Workstation"];

  void setTipe(String newValue) {
    setState(() {
      dropdownTipe = newValue;
    });
  }

  final _hargaAwal = TextEditingController();
  final _hargaAkhir = TextEditingController();

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
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10.0),
                  ),
                ),
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 550,
                            child: ListView(
                              children: [
                                Text(
                                  "Pilih Kriteria Rekomendasi",
                                  style: GoogleFonts.jura(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Tertinggi",
                                  style: GoogleFonts.jura(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                DropDownFilter(
                                    item: dropdownTipe,
                                    itemList: tipeList,
                                    onChange: setTipe),
                                Text(
                                  "Rentang Harga",
                                  style: GoogleFonts.jura(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 130,
                                      child: TextField(
                                          decoration: InputDecoration(
                                              hintText: "Harga Terendah")),

                                      // controller: _hargaAkhir,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 130,
                                      child: TextField(
                                          decoration: InputDecoration(
                                              hintText: "Harga Tertinggi")),

                                      // controller: _hargaAkhir,
                                    ),
                                  ],
                                  // children: [InputFilter(controller: _hargaAwal)],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Tahun",
                                  style: GoogleFonts.jura(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 130,
                                      child: TextField(
                                          decoration: InputDecoration(
                                              hintText: "Tahun Terendah")),

                                      // controller: _hargaAkhir,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 130,
                                      child: TextField(
                                          decoration: InputDecoration(
                                              hintText: "Tahun Tertinggi")),

                                      // controller: _hargaAkhir,
                                    ),
                                  ],
                                  // children: [InputFilter(controller: _hargaAwal)],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      child: Text("Filter"),
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryColor,
                                          foregroundColor: Colors.black,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  width: 1, // thickness
                                                  color: Colors.black // color
                                                  ),
                                              borderRadius:
                                                  BorderRadius.circular(4))),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Text("Click me")),
    );
  }
}
