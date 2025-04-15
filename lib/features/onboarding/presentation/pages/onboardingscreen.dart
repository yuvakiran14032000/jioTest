import 'package:flutter/material.dart';
import 'package:jioyathri/config/routes/approutes.dart';
import 'package:jioyathri/core/util/snackbar_helper.dart';
import 'package:jioyathri/features/onboarding/presentation/provider/onboarding_provider.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'title': "Get Anything Done, Anytime, Anywhere!",
      'subtitle':
          "From home repairs to beauty services, tutoring, healthcare, and more.",
      'icon': Icons.all_inclusive,
      'color': Colors.blue,
    },
    {
      'title': "3 Easy Steps to Get Help",
      'subtitle':
          "1. Search & Book\n2. Get Matched Instantly\n3. Enjoy Quality Service",
      'icon': Icons.work_outline,
      'color': Colors.green,
    },
    {
      'title': "Reliable Professionals",
      'subtitle':
          "• Verified Experts\n• Secure Payments\n• 24/7 Customer Support",
      'icon': Icons.verified_user,
      'color': Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final onboardingprovider = Provider.of<OnboardingProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (int page) {
                setState(() => _currentPage = page);
              },
              itemBuilder: (context, index) {
                return OnboardingPage(
                  title: _pages[index]['title'],
                  subtitle: _pages[index]['subtitle'],
                  icon: _pages[index]['icon'],
                  color: _pages[index]['color'],
                );
              },
            ),
          ),
          // 3-Dot Indicator
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pages.length, (index) {
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentPage == index
                            ? Colors.blue
                            : Colors.grey.withAlpha(102),
                  ),
                );
              }),
            ),
          ),
          // Next/Get Started Button
          Padding(
            padding: const EdgeInsets.only(bottom: 60, left: 20, right: 20),
            child: Material(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue, // Use your preferred button color
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () async {
                  if (_currentPage == _pages.length - 1) {
                    await onboardingprovider.setOnboardingStatus();
                    if (onboardingprovider.error != null) {
                      showTopSnackbar(
                        context,
                        onboardingprovider.error!.errorMessage,
                        'error',
                      );
                      return;
                    }
                    Navigator.pushReplacementNamed(
                      context,
                      AppRouter.loginRoute,
                    );
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                child: Container(
                  width: double.infinity, // Makes it full width
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: Text(
                      _currentPage == _pages.length - 1
                          ? 'Get Started'
                          : 'Next',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white, // Text color
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: color.withAlpha(26),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 50, color: color),
          ),
          const SizedBox(height: 40),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            subtitle,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
