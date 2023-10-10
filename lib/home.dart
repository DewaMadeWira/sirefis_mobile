import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:sirefis_mobile/components/dropDownFilter.dart';
import 'package:sirefis_mobile/components/inputFilter.dart';
import 'package:sirefis_mobile/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

import 'components/btnFilter.dart';
import 'filter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownPerusahaan = "NVIDIA";
  List<String> perusahaanList = ["NVIDIA", "AMD", "Apple"];

  List<String> years = [
    "2017",
    "2018",
    "2019",
    "2020",
    "2021",
    "2022",
    "2023",
  ];

  bool termurahState = false;
  bool termahalState = false;
  bool desktopState = false;
  bool workstationState = false;

  String tahunTerlama = "2020";
  String tahunTerbaru = "2023";

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
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Center(
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
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // padding: EdgeInsets.only(bottom: 20),
                              height: 400,
                              child: ListView(
                                // physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  Text(
                                    "Pilih Kriteria Rekomendasi",
                                    style: GoogleFonts.jura(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Urutkan",
                                    style: GoogleFonts.jura(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      FilterChip(
                                        label: Text('Termurah'),
                                        onSelected: (bool value) {
                                          setState(() {
                                            termurahState = termahalState;
                                            termahalState = !termahalState;
                                          });
                                        },
                                        selected: termurahState,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      FilterChip(
                                        label: Text('Termahal'),
                                        onSelected: (bool value) {
                                          setState(() {
                                            termahalState = termurahState;
                                            termurahState = !termurahState;
                                          });
                                        },
                                        selected: termahalState,
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: 20,
                                  // ),
                                  // Text(
                                  //   "Perusahaan",
                                  //   style: GoogleFonts.jura(
                                  //       fontSize: 16,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                  // DropDownFilter(
                                  //     item: dropdownPerusahaan,
                                  //     itemList: perusahaanList,
                                  //     onChange: setPerusahaan),
                                  SizedBox(
                                    height: 20,
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

                                  Row(
                                    children: [
                                      FilterChip(
                                        label: Text('Desktop'),
                                        onSelected: (bool value) {
                                          setState(() {
                                            desktopState = !desktopState;
                                          });
                                        },
                                        selected: desktopState,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      FilterChip(
                                        label: Text('Workstation'),
                                        onSelected: (bool value) {
                                          setState(() {
                                            workstationState =
                                                !workstationState;
                                          });
                                        },
                                        selected: workstationState,
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.start,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
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
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              CurrencyTextInputFormatter(
                                                  // locale: 'idr',
                                                  decimalDigits: 0,
                                                  symbol: 'Rp')
                                            ],
                                            decoration: InputDecoration(
                                                hintText: "Harga Terendah")),

                                        // controller: _hargaAkhir,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: 130,
                                        child: TextField(
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              CurrencyTextInputFormatter(
                                                  // locale: 'idr',
                                                  decimalDigits: 0,
                                                  symbol: 'Rp')
                                            ],
                                            decoration: InputDecoration(
                                                hintText: "Harga Tertinggi")),

                                        // controller: _hargaAkhir,
                                      ),
                                    ],
                                    // children: [InputFilter(controller: _hargaAwal)],
                                  ),
                                  SizedBox(
                                    height: 10,
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
                                      ElevatedButton(
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    side: BorderSide(
                                                        color:
                                                            Colors.white70))),
                                            // side: BorderSide(),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.white10),
                                          ),
                                          onPressed: () {
                                            showCupertinoModalPopup(
                                                context: context,
                                                builder: (_) => SizedBox(
                                                      width: double.infinity,
                                                      height: 250,
                                                      child: CupertinoPicker(
                                                        backgroundColor:
                                                            Colors.white,
                                                        itemExtent: 30,
                                                        onSelectedItemChanged:
                                                            (int value) {
                                                          setState(() {
                                                            tahunTerlama =
                                                                years[value];
                                                          });
                                                        },
                                                        children: const [
                                                          Text("2017"),
                                                          Text("2018"),
                                                          Text("2019"),
                                                          Text("2020"),
                                                          Text("2021"),
                                                          Text("2022"),
                                                          Text("2023"),
                                                        ],
                                                        scrollController:
                                                            FixedExtentScrollController(
                                                                initialItem: 5),
                                                      ),
                                                    ));
                                          },
                                          child: Text(
                                            tahunTerlama,
                                            style: GoogleFonts.inter(
                                                color: Colors.black),
                                          )),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    side: BorderSide(
                                                        color:
                                                            Colors.white70))),
                                            // side: BorderSide(),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.white10),
                                          ),
                                          onPressed: () {
                                            showCupertinoModalPopup(
                                                context: context,
                                                builder: (_) => SizedBox(
                                                      width: double.infinity,
                                                      height: 250,
                                                      child: CupertinoPicker(
                                                        backgroundColor:
                                                            Colors.white,
                                                        itemExtent: 30,
                                                        onSelectedItemChanged:
                                                            (int value) {
                                                          setState(() {
                                                            tahunTerbaru =
                                                                years[value];
                                                          });
                                                        },
                                                        children: const [
                                                          Text("2017"),
                                                          Text("2018"),
                                                          Text("2019"),
                                                          Text("2020"),
                                                          Text("2021"),
                                                          Text("2022"),
                                                          Text("2023"),
                                                        ],
                                                        scrollController:
                                                            FixedExtentScrollController(
                                                                initialItem: 6),
                                                      ),
                                                    ));
                                          },
                                          child: Text(
                                            tahunTerbaru,
                                            style: GoogleFonts.inter(
                                                color: Colors.black),
                                          )),

                                      // SizedBox(
                                      //   width: 130,
                                      //   child: TextField(
                                      //       decoration: InputDecoration(
                                      //           hintText: "Tahun Terendah")),

                                      //   // controller: _hargaAkhir,
                                      // ),
                                      // SizedBox(
                                      //   width: 20,
                                      // ),
                                      // SizedBox(
                                      //   width: 130,
                                      //   child: TextField(
                                      //       decoration: InputDecoration(s
                                      //           hintText: "Tahun Tertinggi")),

                                      //   // controller: _hargaAkhir,
                                      // ),
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
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FilterPage()),
                                          );
                                        },
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
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Text("Click me")),
      ),
    );
  }
}
