import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  // Required and optional constructor parameters
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

  /// Helper method to extract initials from the name as a fallback avatar
  String _getInitials(String name) {
    if (name.trim().isEmpty) return '';
    final nameParts = name.trim().split(RegExp(r'\s+'));
    if (nameParts.length == 1) {
      return nameParts.first.substring(0, 1).toUpperCase();
    }
    return (nameParts.first[0] + nameParts.last[0]).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    // Access M3 theme color scheme and text theme
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Card(
      elevation: 1, // Standard Material 3 filled card elevation
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16.0), // 16px card padding
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // -----------------------------------------------------------------
            // 1. User Avatar Section
            // -----------------------------------------------------------------
            CircleAvatar(
              radius: 32,
              backgroundColor: colorScheme.primaryContainer,
              foregroundColor: colorScheme.onPrimaryContainer,
              backgroundImage: avatarUrl != null && avatarUrl!.isNotEmpty
                  ? NetworkImage(avatarUrl!)
                  : null,
              child: avatarUrl == null || avatarUrl!.isEmpty
                  ? Text(
                      _getInitials(name),
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : null,
            ),
            const SizedBox(height: 8),

            // -----------------------------------------------------------------
            // 2. User Information Section (Name & Email)
            // -----------------------------------------------------------------
            Text(
              name,
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              email,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // -----------------------------------------------------------------
            // 3. User Statistics Section (Posts, Followers, Following)
            // -----------------------------------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn(context, 'Posts', postsCount),
                _buildStatColumn(context, 'Followers', followersCount),
                _buildStatColumn(context, 'Following', followingCount),
              ],
            ),
            const SizedBox(height: 16),

            // -----------------------------------------------------------------
            // 4. Action Buttons Section (Follow & Message)
            // -----------------------------------------------------------------
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      
                    },
                    child: const Text('Follow'),
                  ),
                ),
                const SizedBox(width: 8), // 8px horizontal spacing
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      
                    },
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

  /// Helper widget to build individual stat columns (Number + Label)
  Widget _buildStatColumn(BuildContext context, String label, int count) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$count',
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 2),
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