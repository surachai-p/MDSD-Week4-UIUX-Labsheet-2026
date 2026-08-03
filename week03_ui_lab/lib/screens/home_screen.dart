import 'package:flutter/material.dart';
import '../widgets/item_card.dart';
import '../widgets/user_profile_card.dart'; // 1. Import ตัวการ์ดโปรไฟล์เข้ามาใช้งาน
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // รายการสินค้าตัวอย่างของแอป Green Market
  final List<Map<String, dynamic>> _items = [
    {
      'title': 'ผักสลัดออร์แกนิก',
      'subtitle': 'สดใหม่จากฟาร์ม • ฿45 / กิโลกรัม',
      'icon': Icons.eco,
    },
    {
      'title': 'สตรอว์เบอร์รีสด',
      'subtitle': 'หวานกรอบ เกรดพรีเมียม • ฿120 / กล่อง',
      'icon': Icons.shopping_basket,
    },
    {
      'title': 'กล้วยหอมทอง',
      'subtitle': 'อุดมด้วยวิตามิน • ฿35 / หวี',
      'icon': Icons.lightbulb_outline,
    },
    {
      'title': 'มะเขือเทศเชอร์รี',
      'subtitle': 'ปลอดสารเคมี 100% • ฿50 / ถุง',
      'icon': Icons.local_florist,
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dev by Koson'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            tooltip: 'ค้นหาสินค้า',
          ),
        ],
      ),
      // 2. เปลี่ยน body ให้เรียกฟังก์ชันเลือกหน้าตามแท็บที่กด
      body: _buildBody(),

      // 3. ปรับให้แสดงปุ่มเพิ่มสินค้า "เฉพาะแท็บหน้าหลัก (0)" เท่านั้น
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton.extended(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('เปิดหน้าเพิ่มสินค้าใหม่'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('เพิ่มสินค้า'),
            )
          : null, // แท็บอื่นจะได้ไม่มีปุ่มลอยเกะกะ
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search),
            label: 'ค้นหา',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'โปรไฟล์',
          ),
        ],
      ),
    );
  }

  /// ฟังก์ชันสำหรับเลือกแสดง Widget ตามแท็บที่เลือก
  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        // แท็บ 0: หน้าหลัก (แสดงรายการสินค้าเดิมของคุณ)
        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final item = _items[index];
            return ItemCard(
              title: item['title'],
              subtitle: item['subtitle'],
              icon: item['icon'],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      title: item['title'],
                      subtitle: item['subtitle'],
                    ),
                  ),
                );
              },
            );
          },
        );
      case 1:
        // แท็บ 1: หน้าค้นหา (ใส่ข้อความไว้รอก่อน)
        return const Center(
          child: Text('หน้าค้นหาสินค้า', style: TextStyle(fontSize: 18)),
        );
      case 2:
        // แท็บ 2: หน้าโปรไฟล์ (เรียกใช้งาน UserProfileCard ที่สร้างไว้)
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              UserProfileCard(
                name: 'Koson Dev',
                email: 'koson.dev@example.com',
                avatarUrl:
                    'https://picsum.photos/200', // ดึงภาพจำลองจากเน็ต หรือเปลี่ยนเป็น null เพื่อดูอักษรย่อ KD
                postsCount: 24,
                followersCount: 1500, // ระบบแปลงข้อความจะแสดงผลเป็น 1.5k
                followingCount: 180,
                onFollowPressed: () {
                  // เขียนการทำงานเมื่อกดปุ่ม Follow เพิ่มเติมได้ตรงนี้
                  print('กดติดตาม Koson Dev แล้ว');
                },
                onMessagePressed: () {
                  // เขียนการทำงานเมื่อกดปุ่ม Message เพิ่มเติมได้ตรงนี้
                  print('เปิดหน้าแชทคุยกับ Koson Dev');
                },
              ),
            ],
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
