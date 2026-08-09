
import 'package:cofe_app/core/constants/app_images.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:


  SingleChildScrollView(
  padding:  const EdgeInsets.all(20),
    child: Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),

    ),
      child: Padding(padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          ClipRRect(
            child: Image.asset(AppImages.onboarding1,
            height: 200,
            fit: BoxFit.cover,
            width: double.infinity,),

          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Signup Your Account ',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Full Name',
              prefixIcon: const Icon(Icons.person_outline),
              filled: true,
              fillColor: const Color(0xFFF7EDE0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 15),

          // Email
          TextField(
            decoration: InputDecoration(
              hintText: 'Email',
              prefixIcon: const Icon(Icons.email_outlined),
              filled: true,
              fillColor: const Color(0xFFF7EDE0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 15),

          // Password
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: const Icon(Icons.lock_outline),
              filled: true,
              fillColor: const Color(0xFFF7EDE0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Signup button
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Sign Up'),
            ),
          ),

        ],
      ),),

),

      ),
    ));
  }
}
