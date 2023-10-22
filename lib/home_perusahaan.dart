import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:sirefis_mobile/admin_reccomendation.dart';
import 'package:sirefis_mobile/all_gpu.dart';
import 'package:sirefis_mobile/components/dropDownFilter.dart';
import 'package:sirefis_mobile/components/inputFilter.dart';
import 'package:sirefis_mobile/request_gpu.dart';
import 'package:sirefis_mobile/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

import 'components/btnFilter.dart';
import 'filter.dart';

class HomePerusahaan extends StatefulWidget {
  const HomePerusahaan({super.key});

  @override
  State<HomePerusahaan> createState() => _HomeStatePerusahaan();
}

class _HomeStatePerusahaan extends State<HomePerusahaan> {
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(14.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, // Warna bayangan
                        blurRadius: 4.0, // Radius blur bayangan
                        spreadRadius: 0.0, // Radius penyebaran bayangan
                        offset: Offset(0,
                            4) // Offset bayangan (0, 4) untuk bayangan ke bawah
                        ),
                  ],
                ),
                width: 300, //lebar
                height: 320, //tinggi
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/nvidiaquadro.png'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "100",
                      style: GoogleFonts.inter(
                          color: primaryColor,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Tipe GPU yang ada",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  'Fitur :',
                  style: GoogleFonts.jura(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                child: GestureDetector(
                  onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RequestGpu()),
                    )
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(14.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey, // Warna bayangan
                            blurRadius: 4.0, // Radius blur bayangan
                            spreadRadius: 0.0, // Radius penyebaran bayangan
                            offset: Offset(0,
                                4) // Offset bayangan (0, 4) untuk bayangan ke bawah
                            ),
                      ],
                    ),
                    width: 45, // Lebar kontainer
                    // height: 180, // Tinggi kontainer
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: [
                        Image.asset('assets/images/pluslogo.png', height: 40),
                        Padding(padding: EdgeInsets.all(8.0)),
                        Text('Request GPU Baru')
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AdminRec()),
                  )
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(14.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, // Warna bayangan
                          blurRadius: 4.0, // Radius blur bayangan
                          spreadRadius: 0.0, // Radius penyebaran bayangan
                          offset: Offset(0,
                              4) // Offset bayangan (0, 4) untuk bayangan ke bawah
                          ),
                    ],
                  ),
                  width: 145, // Lebar kontainer
                  height: 180, // Tinggi kontainer
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/edit.png'),
                      Padding(padding: EdgeInsets.all(8.0)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Update Profil Perusashaan',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(14.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, // Warna bayangan
                          blurRadius: 4.0, // Radius blur bayangan
                          spreadRadius: 0.0, // Radius penyebaran bayangan
                          offset: Offset(0,
                              4) // Offset bayangan (0, 4) untuk bayangan ke bawah
                          ),
                    ],
                  ),
                  width: 145, // Lebar kontainer
                  height: 180, // Tinggi kontainer
                  alignment: Alignment.topCenter,
                  child: GestureDetector(
                    onTap: () => {
                      // semua GPU
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AllGpu()),
                      )
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/list.png',
                          width: 105, // Lebar image
                          height: 59, // Tinggi image
                        ),
                        Padding(padding: EdgeInsets.all(11.0)),
                        Text(
                          'Tampilkan Semua GPU',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
          ),
        ],
      ),
      // Center(
      //   child: ElevatedButton(
      //       style: ElevatedButton.styleFrom(
      //           backgroundColor: primaryColor,
      //           foregroundColor: Colors.black,
      //           elevation: 0,
      //           shape: RoundedRectangleBorder(
      //               side: const BorderSide(
      //                   width: 1, // thickness
      //                   color: Colors.black // color
      //                   ),
      //               borderRadius: BorderRadius.circular(8))),
      //       onPressed: () {,
      //       child: Text("Click me")),
      // ),
    );
  }
}
