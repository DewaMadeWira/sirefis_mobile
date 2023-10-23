import 'package:flutter/material.dart';

void main() {
  runApp(TambahAdminApp());
}

class TambahAdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TambahAdminScreen(),
    );
  }
}

class AdminData {
  final String nama;
  final String email;
  final String username;
  final String password;

  AdminData({
    required this.nama,
    required this.email,
    required this.username,
    required this.password,
  });
}

class TambahAdminScreen extends StatefulWidget {
  @override
  _TambahAdminScreenState createState() => _TambahAdminScreenState();
}

class _TambahAdminScreenState extends State<TambahAdminScreen> {
  List<AdminData> daftarAdmin = [];
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Admin dan Daftar Admin'),
        backgroundColor:
            Colors.green, // Ubah warna latar belakang AppBar menjadi hijau
      ),
      backgroundColor: Colors.white, // Ganti warna latar belakang
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Admin',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                tambahAdmin(
                  namaController.text,
                  emailController.text,
                  usernameController.text,
                  passwordController.text,
                );
              },
              child: Text('Tambah Admin'),
              style: ElevatedButton.styleFrom(
                primary: Colors
                    .green, // Ubah warna tombol "Tambah Admin" menjadi hijau
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DaftarAdminScreen(
                        daftarAdmin: daftarAdmin, hapusAdmin: hapusAdmin),
                  ),
                );
              },
              child: Text('Daftar Admin'),
              style: ElevatedButton.styleFrom(
                primary: Colors
                    .green, // Ubah warna tombol "Daftar Admin" menjadi hijau
              ),
            ),
          ],
        ),
      ),
    );
  }

  void tambahAdmin(
      String nama, String email, String username, String password) {
    setState(() {
      daftarAdmin.add(AdminData(
        nama: nama,
        email: email,
        username: username,
        password: password,
      ));
      namaController.clear();
      emailController.clear();
      usernameController.clear();
      passwordController.clear();
    });
  }

  void hapusAdmin(int index) {
    setState(() {
      daftarAdmin.removeAt(index);
    });
  }
}

class DaftarAdminScreen extends StatelessWidget {
  final List<AdminData> daftarAdmin;
  final Function(int) hapusAdmin;

  DaftarAdminScreen({required this.daftarAdmin, required this.hapusAdmin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Admin'),
        backgroundColor:
            Colors.green, // Ubah warna latar belakang AppBar menjadi hijau
      ),
      backgroundColor: Colors.white, // Ganti warna latar belakang
      body: ListView.builder(
        itemCount: daftarAdmin.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Nama: ${daftarAdmin[index].nama}'),
            subtitle: Text('Email: ${daftarAdmin[index].email}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                hapusAdmin(index);
              },
            ),
          );
        },
      ),
    );
  }
}
