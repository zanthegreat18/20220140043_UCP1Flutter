import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Buat format tanggal

class PendataanBarangPage extends StatefulWidget {
  const PendataanBarangPage({super.key});

  @override
  State<PendataanBarangPage> createState() => _PendataanBarangPageState();
}

class _PendataanBarangPageState extends State<PendataanBarangPage> {
  DateTime? selectedDate;
  String? selectedJenisTransaksi;
  String? selectedJenisBarang;
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();

  final List<String> jenisTransaksiList = ['Masuk', 'Keluar'];
  final List<String> jenisBarangList = ['Iphone 11 pro', 'Iphone 11', 'Iphone 12', 'Iphone 12 pro'];

  void _submitData() {
    if (selectedDate == null ||
        selectedJenisTransaksi == null ||
        selectedJenisBarang == null ||
        jumlahController.text.isEmpty ||
        hargaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mohon lengkapi semua data')),
      );
      return;
    }

    // Kalau mau simpan ke database, api, dll bisa lanjut disini
    debugPrint('Tanggal: ${DateFormat('dd-MM-yyyy').format(selectedDate!)}');
    debugPrint('Jenis Transaksi: $selectedJenisTransaksi');
    debugPrint('Jenis Barang: $selectedJenisBarang');
    debugPrint('Jumlah Barang: ${jumlahController.text}');
    debugPrint('Harga Satuan: ${hargaController.text}');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data berhasil disubmit!')),
    );
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFFDF7F5),
    appBar: AppBar(
      backgroundColor: Colors.redAccent,
      centerTitle: true, 
      title: const Text(
        'Pendataan Barang',
        style: TextStyle(
          color: Colors.white, 
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white), 
    ),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tanggal Transaksi'),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _pickDate,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.grey),
                    const SizedBox(width: 12),
                    Text(
                      selectedDate != null
                          ? DateFormat('dd-MM-yyyy').format(selectedDate!)
                          : 'Tanggal Transaksi',
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Jenis Transaksi',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              items: jenisTransaksiList
                  .map((jenis) => DropdownMenuItem(value: jenis, child: Text(jenis)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedJenisTransaksi = value;
                });
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Jenis Barang',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              items: jenisBarangList
                  .map((barang) => DropdownMenuItem(value: barang, child: Text(barang)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedJenisBarang = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: jumlahController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Jumlah Barang',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: hargaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixText: 'Rp. ',
                      labelText: 'Harga Satuan',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: _submitData,
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}
