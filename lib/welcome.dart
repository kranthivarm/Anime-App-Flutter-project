import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimePlus',
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

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(
              builder: (context) => const MyHome(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 9, 9),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset('assets/images/design1.jpg'),
        ),
      ),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Color.fromARGB(255, 122, 175, 225),Color.fromARGB(255, 122, 225, 125)],begin: Alignment.topRight,end: Alignment.bottomLeft)
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 7, 191, 222),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 45,child: Container(color: Colors.black,)),
              Container(
                color: Colors.black,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Anime',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                        Text('Plus',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 30),)
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        const SizedBox(width: 40,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          width: 275,
                          child: const TextField(

                          ),
                        ),
                        const SizedBox(width: 20,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white
                          ),
                          child: IconButton(
                              onPressed: (){},
                              color: Colors.black,
                              icon: const Icon(
                                Icons.search,
                              )
                          ),
                        )
                      ],
                    ),
                    const Column(
                      children: [
                        Center(child: Text('Top Search:',style: TextStyle(color: Colors.white))),
                        Text('Tower of God Season 2, Tower of God,',style: TextStyle(color: Colors.white)),
                        Text('Alya Sometimes Hides Her Feeling in Russian',style: TextStyle(color: Colors.white)),
                        Text('My Hero Academia Season 7',style: TextStyle(color: Colors.white)),
                        Text('Wistoria: Wand and Sword, One Piece',style: TextStyle(color: Colors.white)),
                        Text('I Parry with Everything',style: TextStyle(color: Colors.white),),
                        Text('Failure Frame: I Become the Strongest',style: TextStyle(color: Colors.white)),
                        Text('Solo Levelling, Jujutsu Kaisen 2nd Season',style: TextStyle(color: Colors.white))
      
                      ],
                    ),
                    const SizedBox(height: 25,),
                    Container(
                      height: 45,
                      width: 375,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey
                      ),
                      child: Container(
                        child: const Center(
                          child: Text('Watch Anime',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        ),
                      ),
                    ),
                    const SizedBox(height: 22.5,)
                  ],
                ),
              ),
              SizedBox(
                height:15,
                child: Container(
                  color: Colors.white,
                )
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    const Text('Share Anime+',style: TextStyle(fontSize: 17.5),),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        const SizedBox(width: 25,),
                        const Column(
                            children:[
                              Text('234 K',style: TextStyle(fontSize: 16),),
                              Text('shares',style: TextStyle(fontSize: 16))
                            ]
                        ),
                        const SizedBox(width: 15,),
                        IconButton(
                            onPressed: (){},
                            icon: const Icon(
                              Icons.telegram,size: 35,
                              color: Colors.blue,
                            )
                        ),
                        const SizedBox(width: 15,),
                        IconButton(
                            onPressed: (){},
                            color: Colors.blue,
                            icon: const Icon(
                                Icons.facebook,
                              size: 35,
                              color: Colors.blueAccent,
                            )
                        ),
                        const SizedBox(width: 15,),
                        IconButton(
                          color: Colors.redAccent,
                            onPressed: (){},
                            icon: const Icon(
                                Icons.reddit,
                              size: 35,
                            )
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.abc),//(FontAwesomeIcons.twitter,size: 30,),
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 15,),
                        IconButton(
                            color: Colors.black54,
                            onPressed: (){},
                            icon: const Icon(
                              Icons.share,
                              size: 27.5,
                            )
                        ),
                      ],
                    ),
                  ]
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 116, 183, 200),Color.fromARGB(
                        255, 190, 190, 190),Color.fromARGB(255, 116, 183, 200)],
                    end: Alignment.bottomRight,
                    begin: Alignment.topLeft
                    //radius: 1.75
                  )
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text('     Anime+.to - The best site to watch\n     anime online for free',style: TextStyle(fontSize: 23),)
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      child: const Text('Do you know that according to Google, the\n'
                          'monthly search volume for anime related topics\n'
                          'is up to over 1 Billion times? Anime is famous\n'
                          'worldwide and it is no wonder we have seen a \n'
                          'sharp rise in the number of free anime streaming\nsites',style: TextStyle(fontSize: 15),),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      child: const Text('Just like free online movie streaming sites, anime\n'
                          'watching sites are not created equally, some are\n'
                          'better than the rest, so we have decided to build\n'
                          'Anime+.to to be one of the best free anime \n'
                          'streaming site for all anime fans on the world.',style: TextStyle(fontSize: 15),),
                    ),
                    const SizedBox(height: 30,),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text('      1/ What is Anime+.to?',style: TextStyle(fontSize: 20),),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      child: const Text('Anime+.to is a free site to watch anime and\n'
                          'you can even download subbed or dubbed anime in\n'
                          'ultra HD quality without any registration or \n'
                          'payment. By having only one ads in all kinds, we are \n'
                          'trying to make it the safest site for free anime.'),
                    ),
                    const SizedBox(height: 30,),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text('      2/ Is Anime+.to safe?',style: TextStyle(fontSize: 20),),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      child: const Text('Yes we are, we do have only one Ads to cover the\n'
                          'server cost and we keep scanning the ads 24/7 to\n'
                          'make sure all are clean, If you find any ads that is\n'
                          'suspicious, please forward us the info and we will\n'
                          'remove it.',style: TextStyle(fontSize: 15),),
                    ),
                    const SizedBox(height: 30,),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text('      3/ So what make Anime+.to the\n'
                          '      best site to watch anime free\n'
                          '      online?',style: TextStyle(fontSize: 20),),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      child: const Text('Before building Anime+.to, we have checked many \n'
                          'other free anime sites, and learnt from them. We \n'
                          'only keep the good things and remove all the bad \n'
                          'things from all the competitors, to put it in our\n'
                          "Anime+ website. Let's see how we're so confident\n"
                          "about being the best site for anime streaming:",style: TextStyle(fontSize: 15),),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black
                      ),
                      child: const Column(
                        children: [
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Image(
                                  image: AssetImage('assets/images/logo.jpg',),
                                width: 85,
                              ),
                              SizedBox(width: 20,),
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 40),
                                    child: Text('CONTACT US',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),),
                                  ),
                                  Text(' +1 5553167548\n'
                                      ' support@animeplus.com\n'
                                      '\n'
                                      '\n'
                                      '',style: TextStyle(color: Colors.white,fontSize: 10,),)
                                ],
                                ),
                              SizedBox(width: 15,),
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text('SUPPORT',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),),
                                  ),
                                  Text('FAQ\n'
                                      'LINKS\n'
                                      'THE APP\n'
                                      ' \n'
                                      ' ',style: TextStyle(color: Colors.white,fontSize: 10),)
                                ],
                              ),
                              SizedBox(width: 20,),
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text('AnimePlus',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),),
                                  ),
                                  Text('CAREERS\n'
                                      'ABOUT US\n'
                                      ' \n'
                                      ' \n'
                                      '',style: TextStyle(color: Colors.white,fontSize: 10),),
                                ],
                              ),
                              SizedBox(height: 40,)
                            ],
                          ),
                        ],
                      )
                    )

                  ],
                ),
              )
            ],
          ),
        ),
      
      ),
    );
  }
}





// backgroundColor: Colors.blueGrey,
// body: SingleChildScrollView(
// child: Column(
// children: [
// SizedBox(height: 50,),
// Row(
// children: [
// SizedBox(width: 15,),
// TextButton(
// onPressed: () {},
// child: Text('Home',style: TextStyle(color: Colors.black,fontSize: 14),)
// ),
// TextButton(
// onPressed: (){},
// child: Text('Movies',style: TextStyle(color: Colors.black,fontSize: 14),)
// ),
// TextButton(
// onPressed: (){},
// child: Text('Recommendations',style: TextStyle(color: Colors.black,fontSize: 14),)
// ),
// TextButton(
// onPressed: (){},
// child: Text('Top Airing',style: TextStyle(color: Colors.black,fontSize: 14),)
// ),
//
// ],
// ),
// Container(
// height: 300,
// width: double.infinity,
// color: Colors.indigo,
// ),
// SizedBox(height: 13,),
// Row(
// children: [
// Text('Top Anime',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
// ],
// ),
// SizedBox(height: 13,),
// SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row(
// children: [
// Container(
// margin: EdgeInsets.only(left: 10),
// child: ClipRRect(
// borderRadius: BorderRadius.circular(20),
// child: Image.network('https://www.dexerto.com/cdn-cgi/image/width=3840,quality=60,format=auto/https://editors.dexerto.com/wp-content/uploads/2023/12/13/classroom-of-the-elite.jpg',height:250)),
// ),
// SizedBox(width: 10,),
// Container(
// margin: EdgeInsets.only(left: 10),
// child: ClipRRect(
// borderRadius: BorderRadius.circular(20),
// child: Image.network('https://staticg.sportskeeda.com/editor/2023/08/d83bc-16929832322856-1920.jpg?w=640',height: 250,)),
// ),
// Container(
// margin: EdgeInsets.only(left: 10),
// child: ClipRRect(
// borderRadius: BorderRadius.circular(20),
// child: Image.network('https://imgsrv.crunchyroll.com/cdn-cgi/image/fit=contain,format=auto,quality=85,width=1200,height=675/catalog/crunchyroll/59ae7b430945bbdf9638b2e017897fb2.jpe',height: 250))
// ),
// ],
// ),
// )
// ],
// ),
// )