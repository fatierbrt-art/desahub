import 'package:flutter/material.dart';

void main() {
  runApp(const DesaHubApp());
}

class DesaHubApp extends StatelessWidget {
  const DesaHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DesaHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF059669), // Emerald Green Accent
          primary: const Color(0xFF059669),
          surface: const Color(0xFFF8FAFC),
        ),
        fontFamily: 'Roboto',
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nikController = TextEditingController(text: "3304021809980001");
  final _passController = TextEditingController(text: "12345678");

  void _handleLogin() {
    if (_nikController.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF059669), Color(0xFF065F46)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // App Logo Header
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Text('🏛️', style: TextStyle(fontSize: 48)),
              ),
              const SizedBox(height: 16),
              const Text(
                'DesaHub',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const Text(
                'Ekosistem Digital Desa Berkelanjutan',
                style: TextStyle(color: Color(0xFFA7F3D0), fontSize: 13),
              ),
              const Spacer(),

              // Login Form Card
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Masuk ke Akun Warga',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _nikController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'NIK (Nomor Induk Kependudukan)',
                        prefixIcon: const Icon(Icons.badge_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF8FAFC),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _passController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Kata Sandi',
                        prefixIcon: const Icon(Icons.lock_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF8FAFC),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF059669),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 2,
                        ),
                        child: const Text(
                          'MASUK APLIKASI',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Text(
                '© Tim KKN Universitas - DesaHub v1.0',
                style: TextStyle(color: Color(0xFFA7F3D0), fontSize: 11),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    SuratScreen(),
    PasarScreen(),
    LaporScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        indicatorColor: const Color(0xFFD1FAE5),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Color(0xFF059669)),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.description_outlined),
            selectedIcon: Icon(Icons.description, color: Color(0xFF059669)),
            label: 'Surat',
          ),
          NavigationDestination(
            icon: Icon(Icons.storefront_outlined),
            selectedIcon: Icon(Icons.storefront, color: Color(0xFF059669)),
            label: 'Pasar',
          ),
          NavigationDestination(
            icon: Icon(Icons.campaign_outlined),
            selectedIcon: Icon(Icons.campaign, color: Color(0xFF059669)),
            label: 'Lapor',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: Color(0xFF059669)),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF059669),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white24,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Halo, Budi Santoso 👋',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Desa Sukamaju, RT 02/RW 01',
                  style: TextStyle(color: Color(0xFFA7F3D0), fontSize: 10),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Announcement Banner Widget
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF047857), Color(0xFF065F46)],
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  const Text('📢', style: TextStyle(fontSize: 32)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'PENTING',
                          style: TextStyle(
                            color: Color(0xFFFBBF24),
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Jadwal Posyandu Balita & Lansia',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Kamis, 14 Agustus di Balai Desa',
                          style: TextStyle(color: Color(0xFFA7F3D0), fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Quick Access Section
            const Text(
              'Layanan Cepat',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildQuickAccessItem(Icons.article, 'Surat', Colors.green),
                _buildQuickAccessItem(Icons.shopping_bag, 'Pasar', Colors.amber),
                _buildQuickAccessItem(Icons.warning, 'Lapor', Colors.red),
                _buildQuickAccessItem(Icons.pie_chart, 'APBDes', Colors.blue),
              ],
            ),
            const SizedBox(height: 24),

            // Village News Feed
            const Text(
              'Kabar Desa Terbaru',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD1FAE5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text('🌾', style: TextStyle(fontSize: 24)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'KEGIATAN DEKAT',
                            style: TextStyle(
                              color: Color(0xFF059669),
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Gotong Royong Pembersihan Saluran Irigasi RW 01',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '2 jam yang lalu',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAccessItem(IconData icon, String label, MaterialColor color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.shade50,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: color.shade700, size: 24),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class SuratScreen extends StatelessWidget {
  const SuratScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layanan Surat Mandiri'),
        backgroundColor: const Color(0xFF059669),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSuratCard(
            context,
            '📄',
            'SKTM (Kurang Mampu)',
            'Persyaratan: Foto KTP & KK',
          ),
          _buildSuratCard(
            context,
            '🏪',
            'Surat Keterangan Usaha',
            'Persyaratan: Foto Usaha & KTP',
          ),
          _buildSuratCard(
            context,
            '🏠',
            'Surat Pengantar Domisili',
            'Persyaratan: KTP & Surat Pengantar RT',
          ),
          const SizedBox(height: 16),
          const Text(
            'Pengajuan Terakhir',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFECFDF5),
              border: Border.all(color: const Color(0xFFA7F3D0)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SKTM Sekolah Anak',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text('Tiket: #SRT-2026-0881', style: TextStyle(fontSize: 10)),
                  ],
                ),
                Chip(
                  label: Text('Diproses Admin', style: TextStyle(fontSize: 10)),
                  backgroundColor: Color(0xFFFEF3C7),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSuratCard(BuildContext context, String emoji, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        leading: Text(emoji, style: const TextStyle(fontSize: 28)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 10)),
        trailing: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Form $title berhasil dibuka!')),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF059669),
            foregroundColor: Colors.white,
          ),
          child: const Text('Buat', style: TextStyle(fontSize: 11)),
        ),
      ),
    );
  }
}

class PasarScreen extends StatelessWidget {
  const PasarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pasar Lokal Desa'),
        backgroundColor: const Color(0xFF059669),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari olahan pisang, kerajinan...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(12),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
              children: [
                _buildProductCard(
                  context,
                  '🍌',
                  'Keripik Pisang Lumut',
                  'Rp 15.000',
                  'Bu Siti (RT 01)',
                ),
                _buildProductCard(
                  context,
                  '🍯',
                  'Madu Hutan Murni 250ml',
                  'Rp 65.000',
                  'Pak Joko (RW 02)',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, String emoji, String title, String price, String seller) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                 color: const Color(0xFFECFDF5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(child: Text(emoji, style: const TextStyle(fontSize: 48))),
              ),
            ),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12), maxLines: 1),
            Text(price, style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF059669))),
            Text('Penjual: $seller', style: const TextStyle(fontSize: 9, color: Colors.grey)),
            const SizedBox(height: 6),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Membuka WhatsApp Penjual...')),
                  );
                },
                icon: const Icon(Icons.chat, size: 12),
                label: const Text('Beli via WA', style: TextStyle(fontSize: 10)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF10B981),
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LaporScreen extends StatelessWidget {
  const LaporScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posko Lapor Desa'),
        backgroundColor: const Color(0xFFE11D48),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Unggah Foto Bukti Kendala', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFCBD5E1), style: BorderStyle.solid),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud_upload_outlined, size: 36, color: Colors.grey),
                  Text('Ketuk untuk Ambil Foto', style: TextStyle(fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text('Kategori Laporan', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: 'Jalan / Jembatan Rusak',
              items: const [
                DropdownMenuItem(value: 'Jalan / Jembatan Rusak', child: Text('Jalan / Jembatan Rusak')),
                DropdownMenuItem(value: 'Lampu Jalan Padam', child: Text('Lampu Jalan Padam')),
                DropdownMenuItem(value: 'Penumpukan Sampah', child: Text('Penumpukan Sampah')),
              ],
              onChanged: (val) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Deskripsi Laporan', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Tuliskan lokasi dan rincian masalah...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Laporan aduan berhasil dikirim!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE11D48),
                  foregroundColor: Colors.white,
                ),
                child: const Text('KIRIM LAPORAN ADUAN', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil & Transparansi'),
        backgroundColor: const Color(0xFF059669),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(
            child: Column(
              children: [
                CircleAvatar(radius: 36, backgroundColor: Color(0xFF059669), child: Icon(Icons.person, size: 40, color: Colors.white)),
                SizedBox(height: 8),
                Text('Budi Santoso', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('NIK: 3304021809980001', style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('📊 Transparansi APBDesa 2026', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Total Anggaran: Rp 1.250.000.000', style: TextStyle(fontSize: 11, color: Colors.grey)),
                  SizedBox(height: 12),
                  LinearProgressIndicator(value: 0.45, color: Color(0xFF059669), backgroundColor: Color(0xFFE2E8F0)),
                  SizedBox(height: 6),
                  Text('Pembangunan Infrastruktur (45%)', style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Keluar Akun', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          )
        ],
      ),
    );
  }
}