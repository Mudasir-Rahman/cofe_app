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
      body: Container(
        padding: const EdgeInsets.all(20),
        color: const Color(0xFF18181B),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  getGreeting(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    String? fullName;
                    if (state is ProfileLoaded) {
                      fullName = state.profile.fullName;
                    } else if (state is ProfileCreated) {
                      fullName = state.profile.fullName;
                    } else if (state is ProfileUpdated) {
                      fullName = state.profile.fullName;
                    }

                    if (fullName == null || fullName.isEmpty) {
                      return const SizedBox.shrink();
                    }

                    return Text(
                      'Coffee lover, ',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
