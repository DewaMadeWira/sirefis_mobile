import 'package:flutter/material.dart';
import 'package:sirefis_mobile/components/dropDownFilter.dart';
import 'package:sirefis_mobile/components/inputFilter.dart';
import 'package:sirefis_mobile/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

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

  bool termurahState = false;
  bool termahalState = false;
  bool desktopState = false;
  bool workstationState = false;

  DateTime tahunTerlama = DateTime.parse("2022-10-01 00:00:00.000");

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
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                        title:
                                                            Text("Select Year"),
                                                        content:
                                                            StatefulBuilder(
                                                          builder: (context,
                                                                  setState) =>
                                                              Container(
                                                            // Need to use container to add size constraint.
                                                            width: 300,
                                                            height: 300,
                                                            child: YearPicker(
                                                              firstDate: DateTime(
                                                                  DateTime.now()
                                                                          .year -
                                                                      7,
                                                                  1),
                                                              lastDate: DateTime(
                                                                  DateTime.now()
                                                                      .year,
                                                                  1),
                                                              initialDate:
                                                                  tahunTerlama,
                                                              // save the selected date to _selectedDate DateTime variable.
                                                              // It's used to set the previous selected date when
                                                              // re-showing the dialog.
                                                              onChanged:
                                                                  (DateTime
                                                                      dateTime) {
                                                                // close the dialog when year is selected.
                                                                print(dateTime);
                                                                setState(() =>
                                                                    tahunTerlama =
                                                                        dateTime);
                                                                print(
                                                                    tahunTerlama);

                                                                Navigator.pop(
                                                                    context);

                                                                // Do something with the dateTime selected.
                                                                // Remember that you need to use dateTime.year to get the year
                                                              },
                                                              selectedDate:
                                                                  tahunTerlama,
                                                            ),
                                                          ),
                                                        )));
                                          },
                                          child: Text("Tahun Terlama")),

                                      // SizedBox(
                                      //   width: 130,
                                      //   child: TextField(
                                      //       decoration: InputDecoration(
                                      //           hintText: "Tahun Terendah")),

                                      //   // controller: _hargaAkhir,
                                      // ),
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
