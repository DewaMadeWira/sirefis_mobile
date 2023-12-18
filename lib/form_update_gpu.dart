import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sirefis_mobile/admin_main.dart';
import 'package:sirefis_mobile/theme/colors.dart';
import 'package:http/http.dart' as http;
import 'package:sirefis_mobile/model/item.dart';
import 'dart:convert';

import 'model/env.dart';

// void main() {
//   runApp(const UpdateGpu());
// }

Future getGpu() async {
  // var response = await http.get(Uri.http('192.168.1.4:8000', 'api/gpu'));
  var response = await http.get(Uri.http(link, 'api/gpu'));

  var jsonData = jsonDecode(response.body);
  if (items.isNotEmpty) {
    items.clear();
    print("it is empty");
  }

  for (var perData in jsonData) {
    final item = Item(
      id: perData['gpu_id'].toString(),
      name: perData['gpu_name'],
      price: perData['price'].toString(),
    );

    items.add(item);
  }
  // print(items.length);
  print('helo');
}

final _gpu_name = TextEditingController();
final _g3dmark = TextEditingController();
final _g2dmark = TextEditingController();
final _price = TextEditingController();
final _gpu_value = TextEditingController();
final _tdp = TextEditingController();
final _power_performance = TextEditingController();
final _test_date = TextEditingController();
final _category = TextEditingController();
final _company = TextEditingController();

postData(id) async {
  // try {
  var response = await http.post(Uri.http(link, 'api/update_data_gpu'), body: {
    "gpu_id": id.toString(), //387
    "gpu_name": _gpu_name.text.toString(),
    "G3Dmark": _g3dmark.text.toString(),
    "G2Dmark": _g2dmark.text.toString(),
    "price": _price.text,
    "gpu_value": _gpu_value.text.toString(),
    "TDP": _tdp.text.toString(),
    "power_performance": _power_performance.text.toString(),
    "test_date": _test_date.text.toString(),
    "category": _category.text.toString(),
    "company": _company.text.toString()
  });
  // print("updated " + id);
  print(response.body);
  // } catch (e) {
  //   print(e);
  // }
}

// class UpdateGpu extends StatelessWidget {
//   final gpuId;
//   const UpdateGpu({super.key, this.gpuId});
//   int get _gpuId => gpuId;

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a blue toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme:
//             ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 123, 167, 126)),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: ' '),
//     );
//   }
// }

class UpdateGpu extends StatefulWidget {
  const UpdateGpu({super.key, required this.gpuId});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final gpuId;

  @override
  State<UpdateGpu> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<UpdateGpu> {
  @override
  Widget build(BuildContext context) {
    print(widget.gpuId);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        // title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.all(30)),
              Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                width: 370, //lebar
                height: 1050, //tinggi
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.all(15)),
                    Text(
                      'Form Update item',
                      style: GoogleFonts.jura(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(33)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          width: 180, //lebar
                          height: 137, //tinggi
                          child: Image(
                              image: NetworkImage(
                                  "https://asset.msi.com/resize/image/global/product/product_1665552671c76199be0956de9b63d7e35b33b91acb.png62405b38c58fe0f07fcef2367d8a9ba1/1024.png")),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(32)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          //kalo di jadikan column hasil e di tengah ga bisa di rubah
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 38),
                            ),
                            Text(
                              'Nama GPU',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 37),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 160, //lebar
                              height: 36, //tinggi
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: TextField(
                                  controller: _gpu_name,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 38),
                            ),
                            Text(
                              'Harga',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 37),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 160, //lebar
                              height: 36, //tinggi
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: TextField(
                                  controller: _price,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 38),
                            ),
                            Text(
                              'Tahun Produksi',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 37),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 160, //lebar
                              height: 36, //tinggi
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: TextField(
                                  controller: _test_date,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 38),
                            ),
                            Text(
                              'G3mark',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 37),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 160, //lebar
                              height: 36, //tinggi
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: TextField(
                                  controller: _g3dmark,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 38),
                            ),
                            Text(
                              'G2mark',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 37),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 160, //lebar
                              height: 36, //tinggi
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: TextField(
                                  controller: _g2dmark,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 38),
                            ),
                            Text(
                              'GPU value',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 37),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 160, //lebar
                              height: 36, //tinggi
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: TextField(
                                  controller: _gpu_value,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 38),
                            ),
                            Text(
                              'TDP',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 37),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 160, //lebar
                              height: 36, //tinggi
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: TextField(
                                  controller: _tdp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 38),
                            ),
                            Text(
                              'Power Performance',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 37),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 160, //lebar
                              height: 36, //tinggi
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: TextField(
                                  controller: _power_performance,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 38),
                            ),
                            Text(
                              'Category',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 37),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 160, //lebar
                              height: 36, //tinggi
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: TextField(
                                  controller: _category,
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 38),
                            ),
                            Text(
                              'Company',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 37),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 160, //lebar
                              height: 36, //tinggi
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: TextField(
                                  controller: _company,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => {postData(widget.gpuId),
                              Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AdminMain()),
                  )},

                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  border: Border.all(width: 2),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                width: 154, //lebar
                                height: 36, //tinggi
                                alignment: Alignment.center,
                                child: Text(
                                  "Update",
                                  style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
