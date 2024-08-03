import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'main.dart';

class Poppage extends StatelessWidget {
  final Uint8List? selectedImage;
  Poppage({super.key,this.selectedImage});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SurveyCard1(
                imagePath:
                    'https://image.lexica.art/full_webp/192b2600-bac9-42fc-a591-16a426f01a0e',
                text: 'Are You a\nManga Reader?',
                pageController: _pageController,
              ),
              SurveyCard1(
                imagePath:
                    'https://image.lexica.art/full_webp/06d0c7c3-493c-44f3-9070-b03e3786b00f',
                text: 'Are You an\nAnime Watcher?',
                pageController: _pageController,
              ),
              SurveyCard(
                imagePath:
                    'https://image.lexica.art/full_webp/060b46cc-8d70-4a36-a763-8f8f08e23da7',
                title: 'Couples',
                selectedImage: selectedImage,
              ),
            ],
          ),
          Align(
            alignment: const Alignment(0, 0.5),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotWidth: 15.0,
                dotHeight: 15.0,
                radius: 5,
                dotColor: Color.fromARGB(255, 255, 255, 255),
                activeDotColor: Color.fromARGB(91, 0, 0, 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SurveyCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final Uint8List? selectedImage;

  const SurveyCard({super.key, required this.imagePath, required this.title,this.selectedImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'Welcome to  Anime+',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'The AI Anime studio in your phone',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Top Anime Streaming App',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.yellow,
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>  mnb()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            child: const Text(
              'Let\'s get Started',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class SurveyCard1 extends StatefulWidget {
  final String imagePath;
  final String text;
  final PageController pageController;

  const SurveyCard1(
      {super.key, required this.imagePath,
      required this.text,
      required this.pageController});

  @override
  State<SurveyCard1> createState() => _SurveyCard1State(pageController: pageController);
}

class _SurveyCard1State extends State<SurveyCard1> {
  _SurveyCard1State({required this.pageController});
  final PageController pageController;

  void _goToNextPage() {
    if (pageController.hasClients) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: const Alignment(0, 0.7),
            child: Text(
              textAlign: TextAlign.center,
              widget.text,
              style: const TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _goToNextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                child: const Text(
                  'Yes',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ElevatedButton(
                onPressed: () => _goToNextPage(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                child: const Text(
                  'No',
                  style: TextStyle(fontSize: 21),
                ),
              ),
            ],
          ),
          const SizedBox(height: 26.0),
        ],
      ),
    );
  }
}