//
// import 'package:flutter/material.dart';
//
// class SplashScreeen extends StatefulWidget {
//   const SplashScreeen({super.key});
//
//   @override
//   State<SplashScreeen> createState() => _SplashScreeenState();
// }
//
// class _SplashScreeenState extends State<SplashScreeen> {
//   @override
//   void initState() {
//
//     super.initState();
//     Future.delayed(const Duration(seconds: 3), () {
//       Navigator.pushReplacementNamed(context, '/onboarding');
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/splash/splash_logo.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({super.key});

  @override
  State<SplashScreeen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {
  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  Future<void> _checkUser() async {
    // Keep splash screen visible for 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    // Get currently logged-in Supabase user
    final user = Supabase.instance.client.auth.currentUser;

    if (user != null) {
      // User is already logged in
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // User is not logged in
      Navigator.pushReplacementNamed(context, '/onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash/splash_logo.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
