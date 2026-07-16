 import 'package:flutter/material.dart';
import 'package:depi/features/auth/presentation/views/sign_in_view.dart'; 
import 'package:depi/core/cash/cache_helper.dart'; 

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  void _navigateToLogin() {
    CacheHelper.saveData(key: 'showOnboarding', value: false).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    
    List<String> topTitles = ["Borcelle", "Borcelle", "Borcelle"];
    List<String> topDescriptions = [
      "Your favorite online store",
      "Best shopping experience",
      "Fast and reliable delivery"
    ];

    List<String> titles = ["Purchase Online", "Track Your Order", "Get Your Order"];
    List<String> descriptions = [
      "Browse our wide collection and buy your favorite items easily.",
      "Stay updated with your order status from dispatch to delivery.",
      "Receive your package quickly and enjoy your shopping experience."
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/shape_${_currentIndex + 1}.png'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          
          PageView.builder(
            controller: _controller,
            itemCount: 3,
            onPageChanged: (i) => setState(() => _currentIndex = i),
            itemBuilder: (context, index) {
              bool isBluePage = (index != 1);
              Color topColor = isBluePage ? Colors.white : Colors.blue.shade900;
              Color descColor = isBluePage ? Colors.white70 : Colors.blueGrey;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 110, left: 20, right: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/logo.png', height: 40, color: topColor),
                          const SizedBox(height: 5),
                          Text(topTitles[index], style: TextStyle(color: topColor, fontSize: 24, fontWeight: FontWeight.bold)),
                          Text(topDescriptions[index], style: TextStyle(color: descColor, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 200), 
                  Image.asset('assets/images/onboarding${index + 1}.png', height: 250, fit: BoxFit.contain),
                  const SizedBox(height: 50),
                  
                  GestureDetector(
                    onTap: () {
                      if (_currentIndex < 2) {
                        _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                      } else {
                        _navigateToLogin(); 
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(color: Colors.blue.shade900, shape: BoxShape.circle),
                      child: const Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 25), 
                  Text(titles[index], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: Text(descriptions[index], textAlign: TextAlign.center, style: const TextStyle(color: Color.fromARGB(255, 116, 93, 93), fontSize: 17)),
                  ),
                ],
              );
            },
          ),
          
          
          if (_currentIndex >= 1)
            Positioned(
              top: 60, right: 20,
              child: TextButton(
                onPressed: _navigateToLogin, 
                child: const Text("Skip", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
            
          Positioned(
            bottom: 30, left: 0, right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (i) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 8, width: 8,
                decoration: BoxDecoration(color: _currentIndex == i ? Colors.blue : Colors.grey.shade400, shape: BoxShape.circle),
              )),
            ),
          ),
        ],
      ),
    );
  }
}