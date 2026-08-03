import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      // --- AppBar Section ---
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'โปรไฟล์ผู้ใช้',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          // Using a settings/more icon as seen in the top right
          IconButton(
            icon: CircleAvatar(
              radius: 14,
              backgroundColor: colorScheme.surfaceContainerHighest,
              child: Icon(Icons.settings, size: 16, color: colorScheme.onSurfaceVariant),
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),

      // --- Body Section ---
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            
            // 1. Large Circular Avatar with Initials
            CircleAvatar(
              radius: 50,
              backgroundColor: colorScheme.primaryContainer,
              child: Text(
                'KB',
                style: textTheme.headlineMedium?.copyWith(
                  color: colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            const SizedBox(height: 24),

            // 2. Username
            Text(
              'สมชาย ใจดี',
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),

            // 3. Email / ID
            Text(
              '67030011@kmitl.ac.th',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                decoration: TextDecoration.underline,
              ),
            ),

            const SizedBox(height: 32),

            // 4. Edit Profile Button (Outlined with Icon)
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.stars_rounded, size: 20),
              label: const Text('แก้ไขข้อมูลโปรไฟล์'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                side: BorderSide(color: colorScheme.outlineVariant),
              ),
            ),
          ],
        ),
      ),

      // --- Bottom Navigation Bar Section ---
      bottomNavigationBar: NavigationBar(
        selectedIndex: 2, // 'Profile' is selected
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
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
}
