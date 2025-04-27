import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Kalau mau format tanggal

class DetailPage extends StatelessWidget {
  final DateTime tanggal;
  final String jenisTransaksi;
  final String jenisBarang;
  final int jumlahBarang;
  final int hargaSatuan;
  
  const DetailPage({
    super.key,
    required this.tanggal,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.jumlahBarang,
    required this.hargaSatuan,
  });

  @override
  Widget build(BuildContext context) {
    final int totalHarga = jumlahBarang * hargaSatuan;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF7F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 32),
              // Icon Check
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.withOpacity(0.1),
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 100,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Data Berhasil Disimpan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // Detail Transaksi
              Expanded(
                child: ListView(
                  children: [
                    _buildDetailRow('Tanggal', DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(tanggal)),
                    _buildDetailRow('Jenis Transaksi', jenisTransaksi),
                    _buildDetailRow('Jenis Barang', jenisBarang),
                    _buildDetailRow('Jumlah Barang', jumlahBarang.toString()),
                    _buildDetailRow('Jenis Harga Satuan', 'Rp. ${hargaSatuan.toString()}'),
                    _buildDetailRow('Total Harga', 'Rp. ${totalHarga.toString()}'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Button Selesai
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Balik ke halaman sebelumnya
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Selesai',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 
  Widget _buildDetailRow(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Flexible(
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        const Divider(thickness: 1, color: Colors.grey),
      ],
    );
  }
}
