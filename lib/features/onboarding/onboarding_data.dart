
import 'package:flutter/material.dart';

class OnboardingData {
  final String label; 
  final String imagePath; 
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color cardColor; 
  final bool isLast;

  const OnboardingData({
    required this.label,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.cardColor,
    this.isLast = false,
  });
}


final List<OnboardingData> onboardingPages = [
  const OnboardingData(
    label: '',
    imagePath: 'assets/images/onboarding1.png',
    title: 'Welcome To Route',
    subtitle: 'Discover the latest trends in fashion and lifestyle.',
    backgroundColor: Color(0xFF15161F),
    cardColor: Color(0xFF1B2140),
  ),
  const OnboardingData(
    label: '',
    imagePath: 'assets/images/onboarding2.png',
    title: 'Created Just For You',
    subtitle: 'Our experts hand-pick the best products to match your unique style.',
    backgroundColor: Color(0xFF15161F),
    cardColor: Color(0xFF1B2140),
  ),
  const OnboardingData(
    label: '',
    imagePath: 'assets/images/onboarding3.png',
    title: 'Ready to Shop?',
    subtitle:
        'Join our community and enjoy exclusive offers and early access to sales.',
    backgroundColor: Color(0xFF0B1B6B),
    cardColor: Color(0xFF9FC6FF),
    isLast: true,
  ),
];
