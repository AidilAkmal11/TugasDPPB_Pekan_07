import 'package:flutter/material.dart';
void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _ProfileHeader(),
            const SizedBox(height: 60),
            const _StatsRow(),
            const SizedBox(height: 20),
            const _InfoCard(),
            const SizedBox(height: 20),
            const _MenuList(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------
// Header: Stack + Positioned + Container + BoxDecoration
// ---------------------------------------------------------------
class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Latar belakang gradasi
          Container(
            height: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3F51B5), Color(0xFF7E57C2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
          ),
          // Judul di kiri atas
          const Positioned(
            top: 50,
            left: 20,
            child: Text(
              'Profil Saya',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Tombol pengaturan di kanan atas
          Positioned(
            top: 42,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white24,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.settings, color: Colors.white),
            ),
          ),
          // Foto profil di tengah bawah header
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/pasphoto.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------
// Nama + statistik: Column, Row, Expanded
// ---------------------------------------------------------------
class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Aidil Akmal Rizqy',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        const Text(
          'D4 Sistem Informasi Kota Cerdas',
          style: TextStyle(color: Colors.black54),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: const [
              // Expanded: tiga kotak dibagi sama lebar
              Expanded(child: _StatBox(angka: '12', label: 'Proyek')),
              SizedBox(width: 12),
              Expanded(child: _StatBox(angka: '3.75', label: 'IPK')),
              SizedBox(width: 12),
              Expanded(child: _StatBox(angka: '5', label: 'Sertifikat')),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatBox extends StatelessWidget {
  final String angka;
  final String label;

  const _StatBox({required this.angka, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          Text(
            angka,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3F51B5),
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------
// Kartu info: Row + Flexible + Spacer
// ---------------------------------------------------------------
class _InfoCard extends StatelessWidget {
  const _InfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.badge, color: Color(0xFF3F51B5)),
              const SizedBox(width: 10),
              const Text('NIM'),
              const Spacer(), // dorong nilai ke ujung kanan
              const Text(
                '707012530011',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            children: [
              const Icon(Icons.email, color: Color(0xFF3F51B5)),
              const SizedBox(width: 10),
              const Text('Email'),
              const SizedBox(width: 16),
              // Flexible: teks panjang boleh mengecil / terpotong
              Flexible(
                child: Text(
                  'Aidilakmalr@student.telkomuniversity.ac.id',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------
// Daftar menu: Container + BoxDecoration + Row + Spacer
// ---------------------------------------------------------------
class _MenuList extends StatelessWidget {
  const _MenuList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: const [
          _MenuItem(icon: Icons.edit, title: 'Edit Profil'),
          SizedBox(height: 12),
          _MenuItem(icon: Icons.notifications, title: 'Notifikasi'),
          SizedBox(height: 12),
          _MenuItem(icon: Icons.lock, title: 'Keamanan Akun'),
          SizedBox(height: 12),
          _MenuItem(icon: Icons.logout, title: 'Keluar', merah: true),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool merah;

  const _MenuItem({
    required this.icon,
    required this.title,
    this.merah = false,
  });

  @override
  Widget build(BuildContext context) {
    final warna = merah ? Colors.red : const Color(0xFF3F51B5);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: warna),
          const SizedBox(width: 14),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: merah ? Colors.red : Colors.black87,
            ),
          ),
          const Spacer(),
          const Icon(Icons.chevron_right, color: Colors.black38),
        ],
      ),
    );
  }
}