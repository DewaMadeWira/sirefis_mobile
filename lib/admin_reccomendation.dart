import 'package:flutter/material.dart';
import 'package:sirefis_mobile/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(home: AdminRec()));
}

class AdminRec extends StatelessWidget {
  const AdminRec({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rekomendasi kami",
                style:
                    GoogleFonts.jura(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "GPU Terbaik",
                style: GoogleFonts.jura(fontSize: 22),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 260,
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
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/images/nvidiaquadro.png'),
                          Column(
                            children: [
                              Text(
                                "NVIDIA Quadro",
                                style: GoogleFonts.jura(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Rp. 2000000",
                                style: GoogleFonts.jura(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ]),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Rekomendasi Serupa",
                style: GoogleFonts.jura(fontSize: 22),
              ),
              SizedBox(
                height: 40,
              ),
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
                            "NVIDIA Geforce",
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
                          "Rp. 2000000",
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
              ),
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
                            "NVIDIA Geforce",
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
                          "Rp. 2000000",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}