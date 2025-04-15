import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnboardingFirstScreen extends StatefulWidget {
  const OnboardingFirstScreen({super.key});

  @override
  State<OnboardingFirstScreen> createState() => _OnboardingFirstScreenState();
}

class _OnboardingFirstScreenState extends State<OnboardingFirstScreen> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).viewPadding;

    final List<Widget> carouselItems = [
      Column(
        children: [
          Column(
            children: [
              Text(
                'Welcome Your',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                ' All-in-One Service Solution',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Get Anything Done, Anytime, Anywhere!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                'From home repairs to beauty services, tutoring, healthcare, and more—we connect you with trusted professionals in minutes.',
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/onBoardingImage1.png',

                    fit: BoxFit.cover,

                    // width:
                    //     size.width > size.height
                    //         ? size.height * 0.6
                    //         : size.width * 0.8,
                    // height:
                    //     size.width > size.height
                    //         ? size.height * 0.6
                    //         : size.width * 0.8,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      Column(
        children: [
          Column(
            children: [
              Text(
                'How It Works',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Simple & Fast',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                '3 Easy Steps to Get Help',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),

              Text(
                textAlign: TextAlign.center,
                '1️⃣ Search & Book | 2️⃣ Get Matched | 3️⃣ Enjoy Quality Service – Professionals arrive on time, job done right!',
              ),
              // Text.rich(
              //   textAlign: TextAlign.center,
              //   TextSpan(
              //     text: 'Search & Book ',
              //     style: TextStyle(fontWeight: FontWeight.bold),
              //     children: [
              //       TextSpan(
              //         text: ' - Find the perfect service provider near you.',
              //         style: TextStyle(fontWeight: FontWeight.normal),
              //       ),
              //     ],
              //   ),
              // ),

              // Text.rich(
              //   textAlign: TextAlign.center,
              //   TextSpan(
              //     text: ' Get Matched ',
              //     style: TextStyle(fontWeight: FontWeight.bold),
              //     children: [
              //       TextSpan(
              //         text:
              //             '- Chat, compare prices, and confirm bookings instantly',
              //         style: TextStyle(fontWeight: FontWeight.normal),
              //       ),
              //     ],
              //   ),
              // ),

              // Text.rich(
              //   textAlign: TextAlign.center,
              //   TextSpan(
              //     text: 'Enjoy Quality Service ',
              //     style: TextStyle(fontWeight: FontWeight.bold),
              //     children: [
              //       TextSpan(
              //         text: '- Professionals arrive on time, job done right!',
              //         style: TextStyle(fontWeight: FontWeight.normal),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/onBoardingImage2.png',

                    fit: BoxFit.cover,

                    // width:
                    //     size.width > size.height
                    //         ? size.height * 0.6
                    //         : size.width * 0.8,
                    // height:
                    //     size.width > size.height
                    //         ? size.height * 0.6
                    //         : size.width * 0.8,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      Column(
        children: [
          Column(
            children: [
              Text(
                ' Services We Offer',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Everything You Need',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Hundreds of Services at Your Fingertips',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                '🏠 Home Services | 💇 Beauty & Wellness | 👨‍⚕️ Health & Care | 🎓 Tutoring | 🚗 Auto Repairs | 🍳 Food & Catering',
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/onBoardingImage3.png',

                    fit: BoxFit.cover,

                    // width:
                    //     size.width > size.height
                    //         ? size.height * 0.6
                    //         : size.width * 0.8,
                    // height:
                    //     size.width > size.height
                    //         ? size.height * 0.6
                    //         : size.width * 0.8,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: size.width > size.height ? 16 : 4 + padding.top,
            right: 12,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'skip',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            top: size.height - 230,
            left: size.width - 80,
            child: Transform.rotate(
              angle: -0.4,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Color(0xFF8DB8F5),
                  borderRadius: BorderRadius.circular(84),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 35,
                      top: 45,
                      child: Transform.rotate(
                        angle: 0.4,
                        child: IconButton(
                          onPressed: () {
                            _carouselController.nextPage();
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white70,
                            // size: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CarouselSlider(
                      carouselController: _carouselController,
                      items: carouselItems,
                      options: CarouselOptions(
                        aspectRatio: size.width > size.height ? 10 / 9 : 9 / 12,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() => _currentIndex = index);
                        },
                      ),
                    ),

                    // Dot indicators and buttons (same as before)
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children:
                    //       carouselItems.asMap().entries.map((entry) {
                    //         return GestureDetector(
                    //           onTap:
                    //               () => _carouselController.animateToPage(
                    //                 entry.key,
                    //               ),
                    //           child: Container(
                    //             width: 8,
                    //             height: 8,
                    //             margin: const EdgeInsets.symmetric(
                    //               horizontal: 4,
                    //             ),
                    //             decoration: BoxDecoration(
                    //               shape: BoxShape.circle,
                    //               color:
                    //                   _currentIndex == entry.key
                    //                       ? Colors.blue
                    //                       : Colors.grey,
                    //             ),
                    //           ),
                    //         );
                    //       }).toList(),
                    // ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     IconButton(
                    //       icon: const Icon(Icons.arrow_back),
                    //       onPressed: () => _carouselController.previousPage(),
                    //     ),
                    //     IconButton(
                    //       icon: const Icon(Icons.arrow_forward),
                    //       onPressed: () => _carouselController.nextPage(),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
