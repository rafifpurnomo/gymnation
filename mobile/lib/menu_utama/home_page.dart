import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gymnation/api/carouselAPI.dart';
import 'package:gymnation/menu_utama/notification_page.dart';
import 'package:gymnation/widget/main_menu_item.dart'; // Pastikan ini mengarah ke widget yang benar
import 'package:gymnation/menu_utama/see_all_page.dart';
import 'package:gymnation/menu_utama/food_page.dart';
import 'package:gymnation/menu_utama/class_page.dart';
import 'package:gymnation/menu_utama/discount_page.dart';
import 'package:gymnation/menu_utama/facility_page.dart';
import 'package:gymnation/menu_utama/account_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _isSearching = false; // Variabel untuk menandai pencarian
  String _searchQuery = ""; // Variabel untuk menyimpan query pencarian

  // Method untuk memperbarui status pencarian
  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching; // Toggle pencarian
      if (!_isSearching)
        _searchQuery = ""; // Reset query jika pencarian dimatikan
    });
  }

  // Method untuk memperbarui query pencarian
  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query; // Update search query
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey.shade700, Colors.grey.shade900],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor:
            Colors.transparent, // Background Scaffold dibuat transparan
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          toolbarHeight: 80.0,
          title: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Image.asset(
                    'assets/images/icon-appbar.jpg',
                    fit: BoxFit.contain, // Sesuaikan ukuran gambar
                  ),
                ),
              ),
              const Spacer(), // Mengisi ruang kosong di kanan
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationPage(),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(
                _isSearching ? Icons.close : Icons.search,
                color: Colors.white,
              ),
              onPressed:
                  _toggleSearch, // Panggil toggleSearch untuk toggle status
            ),
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex, // Mengatur halaman yang akan ditampilkan
          children: [
            HomeContent(
              isSearching: _isSearching,
              searchQuery: _searchQuery,
              onSearchQueryChanged: _updateSearchQuery,
            ),
            AccountPage(
              isSearching: _isSearching,
              searchQuery: _searchQuery,
              onSearchQueryChanged: _updateSearchQuery,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: _toggleSearch,
          child: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24.0)),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 8.0,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  // Tambahkan Spacer di kiri untuk penyeimbang
                  const Spacer(flex: 1),
                  IconButton(
                    icon: Icon(Icons.home,
                        color:
                            _selectedIndex == 0 ? Colors.orange : Colors.white),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0; // Ubah ke halaman Home
                      });
                    },
                  ),
                  const SizedBox(width: 200), // Jarak antar icon
                  IconButton(
                    icon: Icon(Icons.account_circle,
                        color:
                            _selectedIndex == 1 ? Colors.orange : Colors.white),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1; // Ubah ke halaman Account
                      });
                    },
                  ),
                  // Tambahkan Spacer di kanan untuk penyeimbang
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Widget untuk konten halaman Home
class HomeContent extends StatefulWidget {
  final bool isSearching;
  final String searchQuery;
  final ValueChanged<String> onSearchQueryChanged;

  const HomeContent({
    super.key,
    required this.isSearching,
    required this.searchQuery,
    required this.onSearchQueryChanged,
  });

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<Map<String, String>> _carouselData = [];
  bool _isLoading = true; // Menandai jika data masih diambil

  @override
  void initState() {
    super.initState();
    _fetchCarouselData();
  }

  Future<void> _fetchCarouselData() async {
    try {
      final data = await CarouselAPI().fetchCarouselData();
      setState(() {
        _carouselData = data;
        _isLoading = false; // Data berhasil diambil
      });
    } catch (e) {
      print("Error fetching carousel: $e");
      setState(() {
        _isLoading = false; // Tetap hentikan loader jika ada error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (widget.isSearching)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: widget.onSearchQueryChanged,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Cari Makanan, Kelas, Fasilitas, atau Diskon...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
          // Tampilkan loader saat data diambil
          if (_isLoading)
            const CircularProgressIndicator()
          else if (_carouselData.isNotEmpty)
            CarouselSlider(
              options: CarouselOptions(
                height: 225.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
              ),
              items: _carouselData.map((item) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                      image: NetworkImage(item['image']!), // Gambar dari API
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Text(
                        item['text']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              }).toList(),
            )
          else
            const Text(
              "Tidak ada data carousel.",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          const SizedBox(height: 16),
          // GridView for Menu Items
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: [
                MenuItem(
                  icon: Icons.grid_view,
                  title: 'Lihat Semua',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SeeAllPage()),
                    );
                  },
                ),
                MenuItem(
                  icon: Icons.restaurant,
                  title: 'Makanan Sehat',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FoodPage()),
                    );
                  },
                ),
                MenuItem(
                  icon: Icons.event_note,
                  title: 'Daftar Kelas',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ClassPage()),
                    );
                  },
                ),
                MenuItem(
                  icon: Icons.percent,
                  title: 'Potongan Harga',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DiscountsPage()),
                    );
                  },
                ),
                MenuItem(
                  icon: Icons.list,
                  title: 'Daftar Fasilitas',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FacilitiesPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
