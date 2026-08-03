import 'package:flutter/material.dart';

/// A Material 3 User Profile Card widget.
class UserProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String? avatarUrl;
  final int postsCount;
  final int followersCount;
  final int followingCount;
  final VoidCallback? onFollowPressed;
  final VoidCallback? onMessagePressed;

  const UserProfileCard({
    super.key,
    required this.name,
    required this.email,
    this.avatarUrl,
    required this.postsCount,
    required this.followersCount,
    required this.followingCount,
    this.onFollowPressed,
    this.onMessagePressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    // แก้ไข: ป้องกันการ Crash กรณีมีช่องว่างซ้อนกันหลายช่องในชื่อ
    final String initials = name.trim().isNotEmpty
        ? name
              .trim()
              .split(' ')
              .where((e) => e.isNotEmpty)
              .map((e) => e[0])
              .take(2)
              .join()
              .toUpperCase()
        : '?';

    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        dynamic: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: colorScheme.primaryContainer,
              // แก้ไข: ป้องกัน Error กรณีส่ง String ว่างมาแทนที่จะเป็น null
              foregroundImage: avatarUrl != null && avatarUrl!.isNotEmpty
                  ? NetworkImage(avatarUrl!)
                  : null,
              child: Text(
                initials,
                style: TextStyle(color: colorScheme.onPrimaryContainer),
              ),
            ),
            const SizedBox(height: 8),

            Text(
              name,
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 4),

            Text(
              email,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: onFollowPressed,
                  child: const Text('Follow'),
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: onMessagePressed,
                  child: const Text('Message'),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Divider(color: colorScheme.outlineVariant),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn(context, postsCount.toString(), 'Posts'),
                _buildStatColumn(
                  context,
                  _formatCount(followersCount),
                  'Followers',
                ),
                _buildStatColumn(
                  context,
                  _formatCount(followingCount),
                  'Following',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(BuildContext context, String value, String label) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Text(
          value,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        Text(
          label,
          style: textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  String _formatCount(int count) {
    if (count >= 1000) {
      final formatted = (count / 1000).toStringAsFixed(1);
      // แก้ไข: เปลี่ยนจาก 1.0k ให้เป็น 1k เพื่อความสวยงาม
      return formatted.endsWith('.0')
          ? '${formatted.substring(0, formatted.length - 2)}k'
          : '${formatted}k';
    }
    return count.toString();
  }
}
