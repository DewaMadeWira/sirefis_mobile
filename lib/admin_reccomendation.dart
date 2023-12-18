import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sirefis_mobile/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import 'tampilan_data.dart';

import 'package:http/http.dart' as http;
import 'package:sirefis_mobile/model/item.dart';
import 'model/env.dart';
void main() {
  runApp(MaterialApp(home: AdminRec()));
}

class AdminRec extends StatelessWidget {
  AdminRec({super.key});

  List<Item> items = [];

  Future getGpu()async{
    var response = await http.get(Uri.http(link,'api/gpu'));
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
    getGpu();
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Column(
        children: [
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
                "Rekomendasi Serupa :",
                style: GoogleFonts.jura(fontSize: 22,fontWeight: FontWeight.bold),
                
              ),
            ],
            
          ),
          
          
        ),
        Expanded(child: FutureBuilder(
                      future: getGpu(), 
                      builder: (context, snapshot){
                        if(snapshot.connectionState == ConnectionState.done){
                          return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: ListTile(
                                  title: Text(
                                    items[index].name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    'Harga : Rp.' + items[index].price,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                ),
                              );
                            },
                          );
                        }else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),)
      ]),
      
    );
    
  }
}
