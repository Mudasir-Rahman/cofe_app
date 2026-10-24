import 'package:cofe_app/features/home_presentation/widget/HomeHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cofe_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:cofe_app/features/profile/presentation/bloc/profile_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Good morning ☀️';
    } else if (hour >= 12 && hour < 17) {
      return 'Good afternoon 🌤️';
    } else if (hour >= 17 && hour < 21) {
      return 'Good evening 🌆';
    } else {
      return 'Good night 🌙';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18181B),
      body: SafeArea(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            String fullName = '';
            String? avatarUrl;

            if (state is ProfileLoaded) {
              fullName = state.profile.fullName;
              avatarUrl = state.profile.avatarUrl;
            } else if (state is ProfileCreated) {
              fullName = state.profile.fullName;
              avatarUrl = state.profile.avatarUrl;
            } else if (state is ProfileUpdated) {
              fullName = state.profile.fullName;
              avatarUrl = state.profile.avatarUrl;
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                  child: Text(
                    getGreeting(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                HomeHeader(
                  userName: fullName,
                  avatarUrl: avatarUrl,
                  notificationCount: 0,
                  onProfileTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  onNotificationTap: () {
                    // TODO: Open the notifications page.
                  },
                ),

                // Add the rest of your home screen below.
                // Example: search bar, promotional banner,
                // coffee categories, and product grid.
              ],
            );
          },
        ),
      ),
    );
  }
}
