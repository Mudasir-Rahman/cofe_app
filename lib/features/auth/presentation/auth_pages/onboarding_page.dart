import 'package:flutter/material.dart';

import '../../../../core/constants/app_images.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  int _currentPage = 0;
  final List<Map<String, String>> onboardingData = [
    {
      'image': AppImages.onboarding1,
      'title': 'Discover Your Perfect Coffee',
      'subtitle':
      'Explore premium coffee crafted for every coffee lover.',
    },
    {
      'image': AppImages.onboarding2,
      'title': 'Fresh Coffee Delivered',
      'subtitle':
      'Enjoy fast delivery and fresh coffee anytime.',
    },
    {
      'image': AppImages.onboarding3,
      'title': 'Enjoy Every Sip',
      'subtitle':
      'Start your coffee journey with just one tap.',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: Column(
        children: [
Expanded(child: PageView.builder(
  controller: _pageController,
    itemCount: onboardingData.length,
    onPageChanged: (index) {
      setState(() {
        _currentPage = index;
      });
    },
    itemBuilder: (context, index) {
return Image.asset(
  onboardingData[index]['image']!,
  fit: BoxFit.cover,
);
    }
))

          ]
      ))
    );
  }
}