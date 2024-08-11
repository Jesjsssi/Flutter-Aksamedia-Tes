import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    return List.generate(3, (index) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 300), 
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        height: 6.0,
        width: _currentPage == index ? 22.0 : 6.0,
        decoration: BoxDecoration(
          color: _currentPage == index ? Colors.white : Colors.grey,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            if (_currentPage == index)
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
              )
          ],
        ),
        curve: Curves.easeInOut, 
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: <Widget>[
              OnboardingPage(
                image: 'assets/home.png',
                title: 'Gratis Materi Belajar\nMenjadi Seller Handal',
                description:
                    'Nggak bisa jualan?\nJangan khawatir, Tokorame akan membimbing kamu hingga menjadi seller langsung dari ahlinya',
              ),
              OnboardingPage(
                image: 'assets/home (1).png',
                title: 'Ribuan Produk\ndengan Kualitas Terbaik',
                description:
                    'Tokorame menyediakan ribuan produk dengan kualitas terbaik dari seller terpercaya',
              ),
              OnboardingPage(
                image: 'assets/home (2).png',
                title: 'Toko Online Unik\nUntuk Kamu Jualan',
                description:
                    'Subdomain unik dan toko online profesional siap pakai',
              ),
            ],
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height *
                0.35, 
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            right: 20.0,
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage == 2) {
                } else {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text(
                _currentPage == 2 ? 'Selesai' : 'Selanjutnya',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                textStyle: TextStyle(fontSize: 14.0),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), 
                ),
                foregroundColor: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 40.0,
            right: 20.0,
            child: TextButton(
              onPressed: () {
              },
              child: Text(
                'Lewati',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        ClipRRect(
          child: Image.asset(image,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.topCenter),
        ),
        Positioned(
          bottom: 0.0, 
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
                bottomLeft: Radius.zero,
                bottomRight: Radius.zero,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height *
                    0.32, 
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20.0), 
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey[600],
                        ),
                      ),
                      Spacer(), 
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
