import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Fruit {
  final String name;
  final int price;
  final String quality;
  final String image;
  final String fruitNo;
  final String supplier;
  final String phone;

  Fruit({
    required this.name,
    required this.price,
    required this.quality,
    required this.image,
    required this.fruitNo,
    required this.supplier,
    required this.phone,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UTS Pemrograman Bergerak',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ujian Tengah Semester 2025/2026"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            const SizedBox(height: 15),
            const Text("A18.2024.00139", style: TextStyle(fontSize: 16)),
            const Text("PUTRI NUR AULIA", 
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Divider(indent: 40, endIndent: 40),
            const ListTile(
              leading: Icon(Icons.email, color: Colors.blue),
              title: Text("118202400139@mhs.dinus.ac.id"),
            ),
            const ListTile(
              leading: Icon(Icons.phone, color: Colors.green),
              title: Text("+62 812 3456 7890"),
            ),
            const ListTile(
              leading: Icon(Icons.location_on, color: Colors.red),
              title: Text("Banjarbaru, Kalimantan Selatan"),
            ),
            const Divider(indent: 40, endIndent: 40),
            const Spacer(),
            const Text("Daftar Buah", style: TextStyle(fontWeight: FontWeight.bold)),
            IconButton(
              icon: const Icon(Icons.arrow_forward, size: 40, color: Colors.blue),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FruitListPage()));
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class FruitListPage extends StatelessWidget {
  const FruitListPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Fruit> fruitData = [
      Fruit(name: "Mangga", price: 16500, quality: "kwalitas inport", image: "assets/mangga.png", fruitNo: "0620088801", supplier: "Buah Sejati.Com", phone: "+0882003352282"),
      Fruit(name: "Pisang", price: 50000, quality: "dalam negri", image: "assets/pisang.png", fruitNo: "0620088802", supplier: "Buah Sejati.Com", phone: "+0882003352282"),
      Fruit(name: "Pepaya", price: 20000, quality: "dalam negeri", image: "assets/pepaya.png", fruitNo: "0620088803", supplier: "Buah Sejati.Com", phone: "+0882003352282"),
      Fruit(name: "Jambu Air", price: 6000, quality: "Lokal", image: "assets/jambu air.png", fruitNo: "0620088804", supplier: "Buah Sejati.Com", phone: "+0882003352282"),
      Fruit(name: "Durian", price: 120000, quality: "Export / Inport", image: "assets/durian.png", fruitNo: "0620088805", supplier: "Buah Sejati.Com", phone: "+0882003352282"),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Data Buah")),
      body: ListView.builder(
        itemCount: fruitData.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: Image.asset(fruitData[index].image, width: 50, errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image)),
              title: Text(fruitData[index].name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Nama Buah : ${fruitData[index].price}\nKwalitas : ${fruitData[index].quality}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.edit, color: Colors.grey),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) => FruitDetailPage(fruit: fruitData[index]))),
                    child: const Icon(Icons.warning_amber_rounded, color: Colors.orange),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class FruitDetailPage extends StatelessWidget {
  final Fruit fruit;
  const FruitDetailPage({super.key, required this.fruit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Center(
        child: Container(
          width: 350,
          margin: const EdgeInsets.symmetric(vertical: 40),
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Colors.green, 
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.eco, color: Colors.green)),
                    SizedBox(width: 10),
                    Text("PT. FRUITS GLOBAL COMPANY\nBANJARBARU", 
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20), 
                child: Image.asset(fruit.image, height: 120, errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 100))
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _buildInfoRow("Nama Buah", fruit.name),
                    _buildInfoRow("Harga", fruit.price.toString()),
                    _buildInfoRow("No.Buah", fruit.fruitNo),
                    _buildInfoRow("Supplier", fruit.supplier),
                    _buildInfoRow("Kwalitas", fruit.quality),
                    _buildInfoRow("Telepon Pesan", fruit.phone),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.green, 
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                      onPressed: null, 
                      icon: const Icon(Icons.person, color: Colors.white, size: 18),
                      label: const Text("Profil Penjual", style: TextStyle(color: Colors.white, fontSize: 12))
                    ),
                    TextButton.icon(
                      onPressed: null, 
                      icon: const Icon(Icons.settings, color: Colors.white, size: 18),
                      label: const Text("Setting Apps", style: TextStyle(color: Colors.white, fontSize: 12))
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(label, style: const TextStyle(fontSize: 13))),
          const Text(" : "),
          Expanded(flex: 3, child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
        ],
      ),
    );
  }
}