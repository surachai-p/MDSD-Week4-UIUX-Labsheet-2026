import 'package:flutter/material.dart';
import '../widgets/user_profile_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: UserProfileCard(
        name: 'วิชญาพร เนียมเที่ยง',
        email: '67030211@kmitl.ac.th',
        postsCount: 12,
        followersCount: 300,
        followingCount: 150,
      ),
    );
  }
}
