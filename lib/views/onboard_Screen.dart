import 'package:flutter/material.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentPage = 0;
  PageController pageController = PageController();
  List<Map<String, dynamic>> onboardData = [
    {
      'images': 'assets/images/onboard_1.png',
      'title': 'Plant Describe',
      'description':
          'Beautiful and gorgeous plant as based location on the market',
    },
    {
      'images': 'assets/images/onboard_2.png',
      'title': 'Plant Model',
      'description':
          'Beautiful and gorgeous plant as based location on the market',
    },
    {
      'images': 'assets/images/onboard_3.png',
      'title': 'Plant Features',
      'description':
          'Beautiful and gorgeous plant as we dont know how it can be on the based location on the market',
    }
  ];

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: onboardData.length,
            scrollDirection: Axis.horizontal,

            /// physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Image.asset(
                        onboardData[index]['images'],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      onboardData[index]['title'],
                      style: appStyle(Colors.white, FontWeight.bold, 25),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      onboardData[index]['description'],
                      textAlign: TextAlign.justify,
                      style: appStyle(Colors.white, FontWeight.normal, 18),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    buildPageIndicator(index),
                  ],
                ),
              );
            },
          ),
          (currentPage == (onboardData.length - 1))
              ? const SizedBox()
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Container(
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 8, 8, 8),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                pageController
                                    .jumpToPage(onboardData.length - 1);
                              },
                              child: Text(
                                'Skip',
                                style: appStyle(
                                    Colors.white, FontWeight.normal, 20),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: Text(
                                'Next',
                                style: appStyle(
                                    Colors.white, FontWeight.normal, 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
          (currentPage == (onboardData.length - 1))
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed('/homeScreen');
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(300, 50),
                        backgroundColor: const Color.fromARGB(255, 51, 51, 51),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: Text(
                        'Get Started',
                        style: appStyle(Colors.white, FontWeight.bold, 20),
                      ),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

//widget for appStyle
  appStyle(Color color, FontWeight fw, double size) {
    return TextStyle(color: color, fontWeight: fw, fontSize: size);
  }

  //widget to show currentPageIndex

  Widget buildPageIndicator(int currentIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardData.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          width: index == currentIndex ? 25.0 : 15.0,
          height: 15.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: index == currentIndex ? Colors.blue : Colors.white,
          ),
        ),
      ),
    );
  }
}






















// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:flutterconnect/utils/colors.dart';
// import 'package:flutterconnect/views/login_Screen.dart';
// import 'package:flutterconnect/widgets/app_Style.dart';

// class OnboardScreen extends StatefulWidget {
//   const OnboardScreen({super.key});

//   @override
//   State<OnboardScreen> createState() => _OnboardScreenState();
// }

// class _OnboardScreenState extends State<OnboardScreen> {
//   PageController pageController = PageController();
//   int currentPage = 0;
//   List onboardData = [
//     {
//       'image': 'assets/images/onboard_1.png',
//       'title': 'Find Perfect Plant',
//       'description': 'It is something that need to be chaneded',
//     },
//     {
//       'image': 'assets/images/onboard_2.png',
//       'title': 'Find Perfect Plant',
//       'description':
//           'It is something that need to be chaneded and nothing can be predicted  what is correct way to determine the concept of mesmerizing',
//     },
//     {
//       'image': 'assets/images/onboard_3.png',
//       'title': 'Find Perfect Plant',
//       'description': 'It is something that need to be chaneded',
//     }
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           PageView.builder(
//             controller: pageController,
//             itemCount: onboardData.length,
//             scrollDirection: Axis.horizontal,
//             // physics: const NeverScrollableScrollPhysics(),
//             onPageChanged: (value) {
//               setState(() {
//                 currentPage = value;
//               });
//             },
//             itemBuilder: (BuildContext context, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 300,
//                       width: double.infinity,
//                       child: Image.asset(
//                         onboardData[index]['image'],
//                       ),
//                     ),
//                     Text(onboardData[index]['title'],
//                         style: appStyle(whiteColor, FontWeight.bold, 16)),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       onboardData[index]['description'],
//                       textAlign: TextAlign.justify,
//                       maxLines: 3,
//                       style: appStyle(whiteColor, FontWeight.bold, 16),
//                     ),
//                     _buildPageIndicator(index),
//                   ],
//                 ),
//               );
//             },
//           ),
//           (currentPage == (onboardData.length - 1))
//               ? const SizedBox()
//               : Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Container(
//                       height: 50,
//                       width: 300,
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 11, 11, 11),
//                         borderRadius: BorderRadius.circular(15.0),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 pageController
//                                     .jumpToPage(onboardData.length - 1);
//                               },
//                               child: Text('Skip',
//                                   textAlign: TextAlign.left,
//                                   style: appStyle(
//                                       whiteColor, FontWeight.normal, 20)),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 pageController.nextPage(
//                                   duration: const Duration(milliseconds: 600),
//                                   curve: Curves.easeInOut,
//                                 );
//                               },
//                               child: Text('Next',
//                                   style: appStyle(
//                                       whiteColor, FontWeight.normal, 20)),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//           (currentPage == (onboardData.length - 1))
//               ? Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context)
//                             .pushReplacementNamed('/loginScreen');
//                       },
//                       style: ElevatedButton.styleFrom(
//                           fixedSize: const Size(300, 50),
//                           backgroundColor:
//                               const Color.fromARGB(255, 11, 11, 11),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15.0))),
//                       child: Text('Get Started',
//                           style: appStyle(whiteColor, FontWeight.bold, 20)),
//                     ),
//                   ),
//                 )
//               : const SizedBox(),
//         ],
//       ),
//     );
//   }

//   Widget _buildPageIndicator(int currentIndex) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(
//         onboardData.length,
//         (index) => AnimatedContainer(
//           duration: const Duration(milliseconds: 100),
//           curve: Curves.easeInOut,
//           margin: const EdgeInsets.symmetric(horizontal: 5.0),
//           width: index == currentIndex ? 25.0 : 13.0,
//           height: 13.0,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10.0),
//             color: (index == currentIndex) ? Colors.blue : Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
