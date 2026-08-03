import 'package:flutter/material.dart';

/// A Material Design 3 user profile card widget.
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

  // Helper to generate initials for the avatar fallback
  String get _initials {
    if (name.isEmpty) return '?';
    final parts = name.trim().split(' ');
    if (parts.length > 1) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts[0][0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    // Read colors and typography from the current theme
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Use Card widget with M3 elevation
    return Card(
      elevation: 1,
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1. Circular user avatar with initials as fallback
            CircleAvatar(
              radius: 32,
              backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl!) : null,
              backgroundColor: colorScheme.primaryContainer,
              child: avatarUrl == null
                  ? Text(
                      _initials,
                      style: TextStyle(color: colorScheme.onPrimaryContainer),
                    )
                  : null,
            ),
            const SizedBox(height: 8),

            // 2. Username using titleLarge
            Text(
              name,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),

            // 3. Email using bodyMedium in onSurfaceVariant
            Text(
              email,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),

            // 5. Row of 3 stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn('Posts', postsCount, textTheme, colorScheme),
                _buildStatColumn('Followers', followersCount, textTheme, colorScheme),
                _buildStatColumn('Following', followingCount, textTheme, colorScheme),
              ],
            ),
            const SizedBox(height: 16),

            // 4. Action buttons side by side
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: onFollowPressed,
                    child: const Text('Follow'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: onMessagePressed,
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

  // Helper to create a Column for each stat
  Widget _buildStatColumn(
    String label,
    int count,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          count.toString(),
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
