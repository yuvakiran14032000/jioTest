import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewOnboardingScreen extends StatefulWidget {
  const NewOnboardingScreen({super.key});

  @override
  State<NewOnboardingScreen> createState() => _NewOnboardingScreenState();
}

class _NewOnboardingScreenState extends State<NewOnboardingScreen> {
  final _currentIndex = 0;
  final carouselItems = [3];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFBED9FF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: size.height * 0.17),
          SvgPicture.asset('assets/images/onBoardingImage5.svg', width: 300),
          SizedBox(height: size.height * 0.1),
          Container(
            width: size.width,
            height: size.height * 0.5,
            decoration: BoxDecoration(color: Colors.white),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        carouselItems.asMap().entries.map((entry) {
                          return GestureDetector(
                            child: Container(
                              width: 8,
                              height: 8,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    _currentIndex == entry.key
                                        ? Colors.blue
                                        : const Color.fromARGB(
                                          255,
                                          119,
                                          58,
                                          58,
                                        ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Stack(
//         children: [
//           Container(
//             width: size.width,
//             height: size.height,
//             decoration: BoxDecoration(color: Color(0xFFBED9FF)),
//           ),
//           SizedBox(
//             width: size.width,
//             height: size.height - 390,
//             child: SvgPicture.asset(
//               'assets/images/onBoardingImage5.svg',
//               width: size.width * 0.75,
//               height: 150,
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             child: Container(
//               width: size.width,
//               height: 400,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//               ),
//               child: Center(child: Text('data')),
//             ),
//           ),
//         ],
//       ),
