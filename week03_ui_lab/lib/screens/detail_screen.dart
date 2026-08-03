import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String subtitle;

  const DetailScreen({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // หาบรรทัดที่เป็นราคาจาก subtitle (สมมติว่าราคาอยู่บรรทัดที่สอง)
    final subtitleLines = subtitle.split('\n');
    final priceText = subtitleLines.length > 1 ? subtitleLines[1] : subtitle;

    return Scaffold(
      appBar: AppBar(
        title: const Text('รายละเอียดสินค้า'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: colorScheme.surfaceContainerHighest,
              child: Icon(
                Icons.category,
                color: colorScheme.onSurfaceVariant,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder for Lettuce Image
            Container(
              width: double.infinity,
              height: 250,
              color: colorScheme.primaryContainer.withOpacity(0.5),
              child: Icon(
                Icons.image,
                size: 100,
                color: colorScheme.onPrimaryContainer.withOpacity(0.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '฿$priceText',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'รายละเอียดสินค้า',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'ผักสลัดออร์แกนิกปลูกด้วยระบบไฮโดรโปนิกส์ ไม่ใช้สารเคมีฆ่าแมลง เก็บสดใหม่ทุกเช้า เหมาะสำหรับทำสลัดสุขภาพ',
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 48),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('เพิ่มลงตะกร้าสินค้าเรียบร้อยแล้ว'),
                          ),
                        );
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.onPrimary,
                      ),
                      icon: const Icon(Icons.shopping_cart_outlined),
                      label: const Text('เพิ่มลงตะกร้าสินค้า'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: colorScheme.outline),
                        foregroundColor: colorScheme.onSurface,
                      ),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('ย้อนกลับ'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
