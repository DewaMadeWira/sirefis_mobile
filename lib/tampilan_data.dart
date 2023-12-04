import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sirefis_mobile/admin_main.dart';
import 'package:sirefis_mobile/model/item.dart';

void main() {
  runApp(MaterialApp(home: TampilData()));
}

class TampilData extends StatelessWidget {
  TampilData({super.key});

  @override

  List<Item> items = [];

  Future getGpu()async{
    var response = await http.get(Uri.http('10.211.113.8:8000','api/gpu'));
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
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder(
                      future: getGpu(), 
                      builder: (context, snapshot){
                        if(snapshot.connectionState == ConnectionState.done){
                          return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index){
                              return ListTile(
                                title: Text(items[index].name),
                                subtitle: Text(items[index].price),
                              );
                            },
                          );
                        }else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
      
    );
  }
}

