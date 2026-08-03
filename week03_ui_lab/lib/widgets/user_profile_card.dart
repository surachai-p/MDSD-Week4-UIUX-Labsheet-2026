import 'package:flutter/material.dart';

/// A Material Design 3 User Profile Card.
/// 
/// This widget follows the latest M3 guidelines, utilizing tonal elevation,
/// standard spacing, and semantic color scheme mapping.
class UserProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String? avatarUrl;
  final int postsCount;
  final int followersCount;
  final int followingCount;

  const UserProfileCard({
    super.key,
    required this.name,
    required this.email,
    this.avatarUrl,
    required this.postsCount,
    required this.followersCount,
    required this.followingCount,
  });

  @override
  Widget build(BuildContext context) {
    // Accessing the current Material 3 color scheme and typography
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      // Material 3 elevation uses tonal color (surfaceTintColor) by default
      elevation: 1,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Standard 16px padding
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1. CIRCULAR AVATAR
            CircleAvatar(
              radius: 32,
              backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl!) : null,
              // Initials as fallback if avatarUrl is null
              child: avatarUrl == null 
                ? Text(_getInitials(name), style: textTheme.titleMedium) 
                : null,
            ),
            const SizedBox(height: 8),

            // 2. USERNAME
            Text(
              name,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            // 3. EMAIL
            Text(
              email,
              // Using onSurfaceVariant for lower-emphasis secondary text
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),

            // 5. STATS ROW (Posts, Followers, Following)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatItem(context, postsCount.toString(), 'Posts'),
                _buildStatItem(context, followersCount.toString(), 'Followers'),
                _buildStatItem(context, followingCount.toString(), 'Following'),
              ],
            ),
            const SizedBox(height: 16),

            // 4. ACTION BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Primary action using FilledButton
                FilledButton(
                  onPressed: () {},
                  child: const Text('Follow'),
                ),
                const SizedBox(width: 8),
                // Secondary action using OutlinedButton
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Message'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Helper to build the individual vertical stat items
  Widget _buildStatItem(BuildContext context, String value, String label) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          value,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  /// Extracts the first character of the first two names as initials
  String _getInitials(String name) {
    if (name.isEmpty) return "";
    final parts = name.trim().split(" ");
    if (parts.length > 1) {
      return (parts[0][0] + parts[1][0]).toUpperCase();
    }
    return parts[0][0].toUpperCase();
  }
}
