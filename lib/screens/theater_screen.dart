import 'package:flutter/material.dart';
import '../services/location_service.dart';

class TheaterScreen extends StatefulWidget {
  const TheaterScreen({super.key});

  @override
  State<TheaterScreen> createState() => _TheaterScreenState();
}

class _TheaterScreenState extends State<TheaterScreen> {
  String? location;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    try {
      final pos = await LocationService.getCurrentLocation();
      setState(() {
        location = 'Lat: ${pos.latitude}, Lon: ${pos.longitude}';
      });
    } catch (e) {
      setState(() {
        location = 'Gagal mendapatkan lokasi';
      });
    }
  }

  void _logout() {
    // kembali ke halaman login
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    final theaters = [
      'XI CINEMA',
      'PONDOK KELAPA 21',
      'CGV',
      'CINEPOLIS',
      'CP MALL',
      'HERMES',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('THEATER'),
        backgroundColor: Colors.indigo[900],
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: _logout,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lokasi Anda: ${location ?? "Mendeteksi..."}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Kota: MEDAN',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: theaters.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                    child: ListTile(
                      title: Text(theaters[index]),
                      trailing: const Icon(Icons.keyboard_arrow_down),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
