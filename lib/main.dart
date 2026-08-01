import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/config/app_routes.dart';
import 'features/auth/presentation/auth_bloc.dart';
import 'features/auth/presentation/auth_event.dart';
import 'features/auth/presentation/auth_pages/home.dart';
import 'features/auth/presentation/auth_pages/onboarding_page.dart';
import 'features/auth/presentation/auth_pages/signIn.dart';
import 'features/auth/presentation/auth_pages/signUp.dart';
import 'features/auth/presentation/auth_pages/splash_screen.dart';

import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load .env
  await dotenv.load(fileName: ".env");

  print("SUPABASE_URL = ${dotenv.env['SUPABASE_URL']}");
  print("SUPABASE_KEY = ${dotenv.env['SUPABASE_ANON_KEY']?.substring(0, 20)}...");

  // Initialize Supabase
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
  );

  // Initialize GetIt
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<AuthBloc>()..add(GetCurrentUserEvent()),
      child: MaterialApp(
        title: 'Coffee App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.brown,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.splash,
        routes: {
          AppRoutes.splash: (context) => const SplashScreeen(),
          AppRoutes.onboarding: (context) => const OnboardingPage(),
          // AppRoutes.signIn: (context) => const SignInPage(),
          // AppRoutes.signUp: (context) => const SignUpPage(),
          // AppRoutes.home: (context) => const HomePage(),
        },
      ),
    );
  }
}
