import 'package:flutter/material.dart';

/// UserProfileCard: การ์ดแสดงข้อมูลโปรไฟล์ผู้ใช้ตามหลัก Material Design 3
/// รับข้อมูลทั้งหมดผ่าน constructor เพื่อให้เป็น Reusable Widget
class UserProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String? avatarUrl;
  final int postsCount;
  final int followersCount;
  final int followingCount;
  final VoidCallback? onFollow;
  final VoidCallback? onMessage;

  const UserProfileCard({
    super.key,
    required this.name,
    required this.email,
    this.avatarUrl,
    required this.postsCount,
    required this.followersCount,
    required this.followingCount,
    this.onFollow,
    this.onMessage,
  });

  /// ดึงตัวอักษรตัวแรกของชื่อมาใช้เป็น fallback เมื่อไม่มีรูป avatar
  String get _initials => name.isNotEmpty ? name[0].toUpperCase() : '?';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      // Material 3 elevation: ใช้ elevation ต่ำ + tonal surface แทนเงาดำเข้ม
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Avatar + ชื่อ + อีเมล ──
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: colorScheme.primaryContainer,
                  backgroundImage:
                      avatarUrl != null ? NetworkImage(avatarUrl!) : null,
                  child: avatarUrl == null
                      ? Text(
                          _initials,
                          style: textTheme.titleLarge?.copyWith(
                            color: colorScheme.onPrimaryContainer,
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: textTheme.titleLarge),
                      const SizedBox(height: 4),
                      Text(
                        email,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ── ปุ่ม Follow / Message ──
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: onFollow,
                    child: const Text('Follow'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: onMessage,
                    child: const Text('Message'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ── สถิติ: Posts / Followers / Following ──
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _StatColumn(
                  count: postsCount,
                  label: 'Posts',
                  textTheme: textTheme,
                  colorScheme: colorScheme,
                ),
                _StatColumn(
                  count: followersCount,
                  label: 'Followers',
                  textTheme: textTheme,
                  colorScheme: colorScheme,
                ),
                _StatColumn(
                  count: followingCount,
                  label: 'Following',
                  textTheme: textTheme,
                  colorScheme: colorScheme,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final int count;
  final String label;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const _StatColumn({
    required this.count,
    required this.label,
    required this.textTheme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$count', style: textTheme.titleMedium),
        const SizedBox(height: 4),
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
