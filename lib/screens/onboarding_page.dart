/* 
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news/views/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int index = 0;
  bool _isOut = false;

  double width(BuildContext context) => MediaQuery.of(context).size.width;
  double height(BuildContext context) => MediaQuery.of(context).size.height;

  void _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_first_time', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 246, 247),

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: width(context),
              height: height(context) * .5,
              child: AnimatedScale(
                scale: _isOut ? 0 : 1,
                duration: const Duration(milliseconds: 250),
                child: Image.asset(images[index]),
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    left: _isOut ? width(context) + 150 : 0,
                    right: _isOut ? -150 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        title[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 34, 34, 34),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  AnimatedPositioned(
                    right: _isOut ? width(context) + 50 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: SizedBox(
                      width: width(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 40,
                        ),
                        child: Text(
                          descriptions[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustonIndicator(active: index == 0),
                const SizedBox(width: 5),
                CustonIndicator(active: index == 1),
                const SizedBox(width: 5),
                CustonIndicator(active: index == 2),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: index == 2
                  ? Center(
                      child: InkWell(
                        onTap: () async {
                          _completeOnboarding();
                          if (!mounted) return;
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: const CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 30, 58, 138),
                          radius: 30,
                          child: Icon(
                            Icons.arrow_forward_outlined,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            _completeOnboarding();
                            if (!mounted) return;
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isOut = true;
                            });
                            Timer(const Duration(milliseconds: 300), () {
                              setState(() {
                                index = index > 1 ? 0 : index + 1;
                                _isOut = false;
                              });
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 30, 58, 138),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustonIndicator extends StatelessWidget {
  final bool active;
  const CustonIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: active
            ? Color.fromARGB(255, 25, 55, 130)
            : Color.fromARGB(255, 209, 213, 219),
      ),
      width: active ? 30 : 10,
      height: 10,
    );
  }
}

final List<String> title = [
  'Stay updated \nwith breaking news',
  'Personalized \nnews feed',
  'Save & share \narticles easily',
];

final List<String> descriptions = [
  'Get the latest headlines from trusted sources\nright when they happen.',
  'Follow topics you care about and see news\nthat matters to you.',
  'Bookmark important stories or share them\ninstantly with others.',
];

List<String> images = [
  'assets/images/one.png',
  'assets/images/two.png',
  'assets/images/three.png',
];
*/

import 'package:flutter/material.dart';
import 'package:news/views/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController _pageController = PageController();
  int index = 0;

  void _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_first_time', false);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  double width(BuildContext context) => MediaQuery.of(context).size.width;
  double height(BuildContext context) => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 246, 247),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (i) {
                  setState(() {
                    index = i;
                  });
                },
                itemCount: 3,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      SizedBox(
                        width: width(context),
                        height: height(context) * .5,
                        child: Image.asset(images[i]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          title[i],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 34, 34, 34),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          descriptions[i],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 102, 102, 102),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustonIndicator(active: index == 0),
                const SizedBox(width: 5),
                CustonIndicator(active: index == 1),
                const SizedBox(width: 5),
                CustonIndicator(active: index == 2),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: index == 2
                  ? Center(
                      child: InkWell(
                        onTap: () async {
                          _completeOnboarding();
                          if (!mounted) return;
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: const CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 25, 55, 130),
                          radius: 30,
                          child: Icon(
                            Icons.arrow_forward_outlined,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            _completeOnboarding();
                            if (!mounted) return;
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 34, 34, 34),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (index < 2) {
                              _pageController.animateToPage(
                                index + 1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 30, 58, 138),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustonIndicator extends StatelessWidget {
  final bool active;
  const CustonIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: active
            ? const Color.fromARGB(255, 25, 55, 130)
            : const Color.fromARGB(255, 209, 213, 219),
      ),
      width: active ? 30 : 10,
      height: 10,
    );
  }
}

final List<String> title = [
  'Stay updated \nwith breaking news',
  'Personalized \nnews feed',
  'Save & share \narticles easily',
];

final List<String> descriptions = [
  'Get the latest headlines from trusted sources\nright when they happen.',
  'Follow topics you care about and see news\nthat matters to you.',
  'Bookmark important stories or share them\ninstantly with others.',
];

List<String> images = [
  'assets/images/one.png',
  'assets/images/two.png',
  'assets/images/three.png',
];
