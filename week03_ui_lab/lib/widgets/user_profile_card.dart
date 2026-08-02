import 'package:flutter/material.dart';

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

  // Helper to generate initials from the name
  String get _initials {
    if (name.isEmpty) return '';
    final parts = name.trim().split(' ');
    if (parts.length > 1) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts[0][0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    // Access current theme colors and text styles
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Card widget with Material 3 elevation
    return Card(
      elevation: 1, // Standard M3 elevation for an elevated card
      clipBehavior: Clip.antiAlias,
      child: Padding(
        // Proper padding (16px)
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Circular Avatar (radius 32) with initials fallback
            CircleAvatar(
              radius: 32,
              backgroundImage:
                  avatarUrl != null ? NetworkImage(avatarUrl!) : null,
              backgroundColor: colorScheme.primaryContainer,
              child: avatarUrl == null
                  ? Text(
                      _initials,
                      style: TextStyle(color: colorScheme.onPrimaryContainer),
                    )
                  : null,
            ),
            const SizedBox(height: 8), // Spacing

            // Username using titleLarge
            Text(
              name,
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),

            // Email using bodyMedium in onSurfaceVariant
            Text(
              email,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16), // Extra spacing before stats

            // Row of 3 stats: Posts, Followers, Following
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn(context, postsCount.toString(), 'Posts'),
                _buildStatColumn(
                    context, followersCount.toString(), 'Followers'),
                _buildStatColumn(
                    context, followingCount.toString(), 'Following'),
              ],
            ),
            const SizedBox(height: 16), // Spacing before actions

            // Buttons: Follow (Filled) and Message (Outlined)
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: onFollow,
                    child: const Text('Follow'),
                  ),
                ),
                const SizedBox(width: 8), // Spacing between buttons
                Expanded(
                  child: OutlinedButton(
                    onPressed: onMessage,
                    child: const Text('Message'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for the stat columns
  Widget _buildStatColumn(BuildContext context, String count, String label) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          count,
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
}
