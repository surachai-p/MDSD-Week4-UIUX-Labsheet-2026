import 'package:flutter/material.dart';
import '../widgets/user_profile_card.dart';

/// ProfileScreen (โปรไฟล์): แสดงข้อมูลผู้ใช้ผ่าน UserProfileCard (ขั้นตอนที่ 4.4)
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('โปรไฟล์'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            UserProfileCard(
              name: 'ผู้ใช้ตัวอย่าง',
              email: 'user@example.com',
              postsCount: 12,
              followersCount: 340,
              followingCount: 180,
              onFollow: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('ติดตามแล้ว'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              onMessage: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('ส่งข้อความ'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('แก้ไขโปรไฟล์'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                icon: const Icon(Icons.edit_outlined),
                label: const Text('แก้ไขโปรไฟล์'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
