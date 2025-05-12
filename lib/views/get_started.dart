import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pretium/widgets/custom_button.dart';
import 'package:pretium/utils/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:pretium/views/auth/login_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  final controller = CarouselController();

  final List<IconData> icons = [
    Icons.credit_card,
    Icons.wallet,
    Icons.receipt_long,
  ];

  String _getTitle(int index) {
    final titles = ["Direct Pay", "Accept Payments", "Pay Bills"];
    return titles[index];
  }

  final List<String> captions = [
    "Pay with crypto across Africa effortlessly",
    "Accept stable coin payments hassle-free",
    "Pay for utility services and earn rewards",
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: screenHeight,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(onTap: () {}, child: Text('Skip')),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Expanded(
                          child: CarouselSlider.builder(
                            itemCount: icons.length,
                            itemBuilder: (context, index, realIndex) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: kLightGreen,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      icons[index],
                                      size: 50,
                                      color: kDarkGreen,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    _getTitle(index),
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 10),
                                  // Body text
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      captions[index],
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                        color: Colors.blueGrey,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              );
                            },
                            options: CarouselOptions(
                              height: screenHeight * 0.4,
                              autoPlay: false,
                              enlargeCenterPage: true,
                              viewportFraction: 0.9,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  activeIndex = index;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        AnimatedSmoothIndicator(
                          activeIndex: activeIndex,
                          count: icons.length,
                          effect: ExpandingDotsEffect(
                            dotWidth: 10,
                            dotHeight: 10,
                            activeDotColor: kDarkGreen,
                            dotColor: kLightGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: 10),
                          CustomButton(
                            callBackFunction: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            label: 'Next',
                          ),
                        ],
                      ),
                    ),
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
