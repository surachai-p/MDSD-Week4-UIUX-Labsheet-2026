import 'package:flutter/material.dart';

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

  // Helper method to get initials from the name
  String _getInitials(String name) {
    if (name.isEmpty) return "?";
    final names = name.split(" ");
    if (names.length >= 2) {
      return "${names[0][0]}${names[1][0]}".toUpperCase();
    }
    return name[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    // Reading standard Material 3 color and text tokens
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      // Material 3 Cards use elevation and surface tint by default
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Proper 16px padding
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1. Circular Avatar (Radius 32)
            CircleAvatar(
              radius: 32,
              backgroundImage: avatarUrl != null
                  ? NetworkImage(avatarUrl!)
                  : null,
              // Fallback to initials if image is null or fails
              child: avatarUrl == null ? Text(_getInitials(name)) : null,
            ),
            const SizedBox(height: 8), // 8px spacing
            // 2. Username using titleLarge
            Text(name, style: textTheme.titleLarge),

            // 3. Email using bodyMedium + onSurfaceVariant
            Text(
              email,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16), // Increased spacing for stats section
            // 5. Row of Stats (Posts, Followers, Following)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn("Posts", postsCount, textTheme, colorScheme),
                _buildStatColumn(
                  "Followers",
                  followersCount,
                  textTheme,
                  colorScheme,
                ),
                _buildStatColumn(
                  "Following",
                  followingCount,
                  textTheme,
                  colorScheme,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 4. Buttons: Side by side (Filled and Outlined)
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text("Follow"),
                  ),
                ),
                const SizedBox(width: 8), // 8px spacing between buttons
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("Message"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for a single stat item
  Widget _buildStatColumn(
    String label,
    int count,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
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
