import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tasks/login.dart';
import 'package:tasks/mylist.dart';
import 'package:tasks/notification.dart';
import 'package:tasks/popUp.dart';
import 'package:tasks/pressedResult.dart';
import 'package:tasks/profile.dart';
import 'package:tasks/MangaDetailsPage.dart';
import 'package:tasks/manga.dart';
import 'data2.dart';
import 'package:tasks/data.dart';
import 'package:tasks/animeSearch.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime+',
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SignupandLoginPage(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 9, 9, 9),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image.network("https://media.istockphoto.com/id/1401675095/vector/letter-a-financial-logo-concept-with-growth-arrow-sign-and-economic-development-symbol-vector.jpg?s=612x612&w=0&k=20&c=cySbX2Klbk0h4Llv3fE4ZiLMfPyrC2jmJpOIHWkL3x8=",fit: BoxFit.cover,),
        ),
      ),
    );
  }
}


class mnb extends StatefulWidget {
  final Uint8List? selectedImage;
  mnb({super.key, this.selectedImage});

  @override
  State<mnb> createState() => _mnbState();
}

class _mnbState extends State<mnb> {
  int sno = 1;
  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      NotificationScreen(),
      MyHome(avatarImage: widget.selectedImage),
      Mylist()
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          screens[sno],
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
              currentIndex: sno,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black54,
              selectedIconTheme: IconThemeData(
                  color: Color.fromARGB(255, 5, 134, 255), size: 35),
              selectedItemColor: Color.fromARGB(255, 5, 134, 255),
              unselectedItemColor: Colors.white,
              unselectedFontSize: 16,
              selectedFontSize: 18,
              onTap: (index) {
                setState(() {
                  this.sno = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_active_outlined),
                  label: 'Notifications',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_outline_rounded),
                  label: 'My List',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class MyHome extends StatefulWidget {
  final Uint8List? avatarImage;
  const MyHome({super.key,this.avatarImage});

  @override
  State<MyHome> createState() => MyHomeClass(avatarImage: avatarImage);
}
class MyHomeClass extends State<MyHome> {    
  final Uint8List? avatarImage;
  MyHomeClass({this.avatarImage});
  String searchString="";
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {    
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox.square(
                        dimension: 50,
                        // child: Image.asset('assets/images/logo.jpg'),
                      ),
                       Row(children: [
                        Text(
                          'Anime',
                          style: TextStyle(
                              fontSize: 45,
                              color: Colors.blue,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          'Plus',
                          style: TextStyle(
                              fontSize: 45,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                      ]),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(avatarImage: avatarImage,)));
                        },
                        child:CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 35,
                          child: lsUsers[userID].profileImage!= null
                              ? ClipOval(
                                  child: Image.memory(
                                    lsUsers[userID].profileImage!,
                                    fit: BoxFit.cover,
                                    width: 200,
                                    height: 200,
                                  ),
                                )
                              : Image.network("https://i.pinimg.com/736x/d8/7d/bf/d87dbf4cc7f46c064a300bf2c6bd95a6.jpg")
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child:  Row(                      
                        children: [                        
                         Container(
                          height: 50,
                          width: (MediaQuery.of(context).size.width)-100,
                           child: TextFormField(
                          controller: _searchController,
                          style: TextStyle(color: Colors.white),
                          clipBehavior: Clip.none,
                          // focusNode: FocusScopeNode(
                          //   canRequestFocus: false
                          // ),
                          decoration: const InputDecoration(
                            labelText: 'Search',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15))),
                            hintText: "Enter Generes or Anime Name",
                          ),
                            // onChanged: (value){
                            //   setState(() {
                            //     searchString = value;
                            //     print(searchString);
                            //   });
                            // },
                          ),                            
                         ),
                         Container(
                          // color:Colors.pink,
                          height: 48,width: 40,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15))
                          ),
                          child: Center(
                            child: IconButton(onPressed: (){    
                              // print(_searchController.text)                        ;
                              // Navigator.push(context,Material
                              // PageRoute(builder: (context)=> Searchresult(searchSt:searchString)));
                              Navigator.push(context,MaterialPageRoute(builder: (context)=> Searchresult(searchSt:_searchController.text)));
                              },tooltip: "search button", icon:const Icon(Icons.search)
                            ),
                          ),
                         )
                      ]
                      ),                  
                  ),
                  const TabBar(
                      indicatorColor: Color.fromARGB(255, 147, 203, 255),
                      labelColor: Color.fromARGB(255, 147, 203, 255),
                      unselectedLabelColor:
                          Color.fromARGB(255, 255, 255, 255),
                      tabs: [
                          Tab(
                          child: Text(
                            'Anime',
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Manga',
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Series',
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Movies',
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                      ])
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                HomePage(),
                MangaPage(),
                SeriesPage(),
                MoviesPage()
              ]),
            )
          ],            
        ),
      
        
        
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 117, 180, 209),
      body: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  child: Center(
                    child: CarouselSlider(
                      carouselController: _carouselController,
                      options: CarouselOptions(
                        height: 400.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      items: headerImages
                          .map((item) => GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Pressedresult(ind: item)));
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => DetailsPage(
                                  //             imageUrl: item)));
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.85,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: NetworkImage(imgSrc[item]),
                                          fit: BoxFit.fill)),
                                  child: Align(
                                      alignment: Alignment(-0.8, 0.9),
                                      child: Opacity(
                                        opacity: 0.5,
                                        child: TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            fixedSize: Size(90, 10),
                                            padding: EdgeInsets.all(0.0),
                                            backgroundColor: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            iconColor: Colors.white, // Text color
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  20.0), // Rounded corners
                                              side: BorderSide(
                                                  color: const Color.fromARGB(
                                                      255, 119, 120, 120),
                                                  width:
                                                      2), // Border color and width
                                            ),
                                          ),
                                          child: Text(
                                            'Watch Now',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      )),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  height: 6,
                  child: Center(
                    child: AnimatedSmoothIndicator(
                      activeIndex: _currentIndex,
                      count: 10,
                      effect: const ExpandingDotsEffect(
                        dotWidth: 6.0,
                        dotHeight: 6.0,
                        radius: 10,
                        dotColor: Color.fromARGB(255, 148, 146, 146),
                        activeDotColor: Color.fromARGB(255, 246, 242, 242),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            ' Continuous Watching',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 255, 255, 255),
                                letterSpacing: 1,
                                wordSpacing: 1),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.18,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>  ));
                            },
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.18,
                              width: MediaQuery.sizeOf(context).width * 0.73,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(255, 3, 244, 212),
                              ),
                              child: VideoApp1(
                                videoUrl: videos[index],
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 15,
                        );
                      }),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 35,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            ' Latest Episodes',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          Spacer(),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'See all   ',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ))
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.23,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: trendingImages.length,
                        itemBuilder: (context, index) => Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                   Navigator.push(context, MaterialPageRoute(builder:(context)=>Pressedresult(ind: index)));
                                  },
                                  child: Container(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.2,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.315,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          const Color.fromARGB(255, 3, 244, 212),
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(trendingImages[index]),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Text(
                                    //   AnimeTags[index][0],
                                    //   style: TextStyle(
                                    //       fontSize: 13,
                                    //       color: Colors.white,
                                    //       fontWeight: FontWeight.bold),
                                    // ),
                                    // SizedBox(
                                    //     width: MediaQuery.sizeOf(context).width *
                                    //         0.085),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 13,
                                    ),
                                    Text(
                                      AnimeTags[index][0],
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 18,
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 35,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            ' Trending now',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          Spacer(),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'See all   ',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ))
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.23,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: trendingImages.length,
                        itemBuilder: (context, index) => Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                   Navigator.push(context, MaterialPageRoute(builder:(context)=>Pressedresult(ind: AnimeTags.length-index-1)));
                                  },
                                  child: Container(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.2,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.315,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          const Color.fromARGB(255, 3, 244, 212),
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(trendingImages[trendingImages.length-index-1]),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Text(
                                    //   AnimeTags[index][0],
                                    //   style: TextStyle(
                                    //       fontSize: 13,
                                    //       color: Colors.white,
                                    //       fontWeight: FontWeight.bold),
                                    // ),
                                    // SizedBox(
                                    //     width: MediaQuery.sizeOf(context).width *
                                    //         0.085),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 13,
                                    ),
                                    Text(
                                      AnimeTags[headerImages.length-index-1][0],
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 18,
                          );
                        }),
                  ),
                ),
                const SizedBox(
                  height: 40,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        ' Mosting Watch Videos',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        textAlign: TextAlign.center,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height*1.2,
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) => SizedBox(
                            //height: MediaQuery.sizeOf(context).height * 0.5,
                            width: MediaQuery.sizeOf(context).width,
                            child: index == 0
                                ? Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: VideoApp(
                                      videoUrl: videos[index],
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, top: 10),
                                    child: VideoApp(
                                      videoUrl: videos[index],
                                    ),
                                  ),
                          ),
                      separatorBuilder: (context, index) {
                        return const Divider();
                      }),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VideoApp extends StatefulWidget {
  const VideoApp({super.key, required this.videoUrl});
  final String videoUrl;

  @override
  State<VideoApp> createState() => _VideoAppState(videoUrl: videoUrl);
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  final String videoUrl;

  _VideoAppState({required this.videoUrl});
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((_) {
        setState(() {});
      });

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                  width: 450,
                  height: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                      border: Border.all(color: Colors.grey)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                ),
                VideoProgressIndicator(
                  _controller,
                  allowScrubbing: true,
                  padding: const EdgeInsets.only(left: 30, right: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                          color: Colors.white,
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow),
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(color: Colors.white, Icons.stop),
                      onPressed: () {
                        setState(() {
                          _controller.pause();
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(color: Colors.white, Icons.fast_rewind),
                      onPressed: () {
                        setState(() {
                          final currentPosition = _controller.value.position;
                          final newPosition =
                              currentPosition - const Duration(seconds: 10);
                          _controller.seekTo(newPosition >= Duration.zero
                              ? newPosition
                              : Duration.zero);
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(color: Colors.white, Icons.fast_forward),
                      onPressed: () {
                        setState(() {
                          final currentPosition = _controller.value.position;
                          final newPosition =
                              currentPosition + const Duration(seconds: 10);
                          _controller.seekTo(
                              newPosition <= _controller.value.duration
                                  ? newPosition
                                  : _controller.value.duration);
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                          color: Colors.white,
                          _controller.value.volume > 0
                              ? Icons.volume_up
                              : Icons.volume_off),
                      onPressed: () {
                        setState(() {
                          _controller.setVolume(
                              _controller.value.volume > 0 ? 0.0 : 1.0);
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class VideoApp1 extends StatefulWidget {
  const VideoApp1({super.key, required this.videoUrl});
  final String videoUrl;

  @override
  State<VideoApp1> createState() => _VideoApp1State(videoUrl: videoUrl);
}

class _VideoApp1State extends State<VideoApp1> {
  late VideoPlayerController _controller1;
  final String videoUrl;

  _VideoApp1State({required this.videoUrl});
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller1 = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((_) {
        setState(() {});
      });

    _initializeVideoPlayerFuture = _controller1.initialize();
    _controller1.setLooping(true);
    _controller1.setVolume(1.0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Center(
                child: Container(
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: AspectRatio(
                      aspectRatio: _controller1.value.aspectRatio,
                      child: VideoPlayer(_controller1),
                    ),
                  ),
                ),
              ),
              VideoProgressIndicator(
                _controller1,
                allowScrubbing: true,
                colors: VideoProgressColors(playedColor: Colors.white),
                padding: const EdgeInsets.only(left: 10, right: 10),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.play_circle_outline,
                    size: 45,
                    color: Colors.white,
                  ))
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}





class MoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Latest Movies",
            style: TextStyle(fontSize: 20, fontFamily: 'WorkSans',fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 22,
              itemBuilder: (context, index) {
                return _buildVideoItem(
                    context, animeTitles[index],youtubeVideoIds[index]);
              },
            ),
          ),
          SizedBox(height: 80,)
        ],
      ),
    );
  }

  Widget _buildVideoItem(BuildContext context, String title, String videoId) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: MyYoutubeVideoPlayer(videoId: videoId, context: context),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(fontSize: 14, fontFamily: 'WorkSans',fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class MyYoutubeVideoPlayer extends StatefulWidget {
  final String videoId;
  final BuildContext context;

  MyYoutubeVideoPlayer({required this.videoId, required this.context, Key? key})
      : super(key: key);

  @override
  State<MyYoutubeVideoPlayer> createState() => _MyYoutubeVideoPlayerState();
}

class _MyYoutubeVideoPlayerState extends State<MyYoutubeVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showFullScreenDialog() {
    showDialog(
      context: widget.context,
      builder: (context) => Dialog(
        child: YoutubePlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
          showVideoProgressIndicator: true,
          onReady: () {
            _controller.play();
          },
        ),
      ),
    ).then((_) {
      _controller.pause();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        YoutubePlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
          showVideoProgressIndicator: true,
        ),
        Positioned(
          right: 8,
          top: 8,
          child: IconButton(
            icon: Icon(Icons.fullscreen, color: Colors.white),
            onPressed: _showFullScreenDialog,
          ),
        ),
      ],
    );
  }
}


class SeriesPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Latest Series', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          CarouselSlider(
            options: CarouselOptions(height: 200, autoPlay: true),
            items: mangaImageUrls.map((url) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(url),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Trending Series', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mangaImageUrls.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(mangaImageUrls[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Categories', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            padding: EdgeInsets.all(8.0),
            children: [
              Card(child: Center(child: Text('Action', style: TextStyle(fontSize: 18)))),
              Card(child: Center(child: Text('Adventure', style: TextStyle(fontSize: 18)))),
              Card(child: Center(child: Text('Romance', style: TextStyle(fontSize: 18)))),
              Card(child: Center(child: Text('Comedy', style: TextStyle(fontSize: 18)))),
              Card(child: Center(child: Text('Fantasy', style: TextStyle(fontSize: 18)))),
              Card(child: Center(child: Text('Horror', style: TextStyle(fontSize: 18)))),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Recommended for You', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mangaImageUrls.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(mangaImageUrls[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



