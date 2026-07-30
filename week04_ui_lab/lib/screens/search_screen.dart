import 'package:flutter/material.dart';
import '../widgets/item_card.dart';
import 'detail_screen.dart';

/// SearchScreen (ค้นหา): ให้ผู้ใช้พิมพ์คำค้นเพื่อกรองรายการ
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String _query = '';

  final List<Map<String, dynamic>> _items = [
    {
      'title': 'รายการที่ 1',
      'subtitle': 'คำอธิบายสั้น ๆ ของรายการนี้',
      'icon': Icons.star_outline,
    },
    {
      'title': 'รายการที่ 2',
      'subtitle': 'ข้อมูลเพิ่มเติมของรายการที่สอง',
      'icon': Icons.favorite_outline,
    },
    {
      'title': 'รายการที่ 3',
      'subtitle': 'รายละเอียดของรายการที่สาม',
      'icon': Icons.bookmark_outline,
    },
    {
      'title': 'รายการที่ 4',
      'subtitle': 'ข้อมูลของรายการที่สี่',
      'icon': Icons.schedule_outlined,
    },
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final filtered = _query.isEmpty
        ? _items
        : _items
            .where((item) => item['title']
                .toString()
                .toLowerCase()
                .contains(_query.toLowerCase()))
            .toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ค้นหา'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              onChanged: (value) => setState(() => _query = value),
              decoration: InputDecoration(
                hintText: 'ค้นหารายการ...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _query.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        tooltip: 'ล้างคำค้นหา',
                        onPressed: () {
                          _controller.clear();
                          setState(() => _query = '');
                        },
                      ),
                filled: true,
                fillColor: colorScheme.surfaceContainerHighest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Text(
                      'ไม่พบรายการที่ค้นหา',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 8),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final item = filtered[index];
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
                  ),
          ),
        ],
      ),
    );
  }
}
