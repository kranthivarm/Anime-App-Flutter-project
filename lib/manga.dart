import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'data2.dart';
import 'MangaDetailsPage.dart';

class MangaPage extends StatefulWidget {
  @override
  State<MangaPage> createState() => _MangaPageState();
}

class _MangaPageState extends State<MangaPage> {
  String selectedCategory = 'All';

  List<Map<String, String>?> getFilteredManga() {
    if (selectedCategory == 'All') {
      return List.generate(mangaNames.length, (index) => {
        'title': mangaNames[index],
        'imageUrl': mangaImageUrls[index]
      });
    } else {
      return List.generate(mangaNames.length, (index) {
        if (mangaCategories[index] == selectedCategory) {
          return {
            'title': mangaNames[index],
            'imageUrl': mangaImageUrls[index]
          };
        } else {
          return null;
        }
      }).where((element) => element != null).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>?> filteredManga = getFilteredManga();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Text('Latest Manga', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
            ),
            CarouselSlider.builder(
              itemCount: filteredManga.length<10?filteredManga.length:10,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MangaDetailPage(
                        mangaTitle: filteredManga[index]!['title']!,
                        imageUrl: filteredManga[index]!['imageUrl']!,
                      )),
                    );
                  },
                  child: Column(
                    children: [
                      Image.network(
                        filteredManga[index]!['imageUrl']!,
                        fit: BoxFit.fill,
                        width: 450,
                        height: 250,
                      ),
                      SizedBox(height: 10),
                      Text(
                        filteredManga[index]!['title']!,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                height: 333,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16, left: 16),
              child: Text('Trending Manga', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
            ),
            Container(
              height: 227,
              child:ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredManga.length<10?filteredManga.length:10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MangaDetailPage(
                          mangaTitle: filteredManga[index]!['title']!,
                          imageUrl: filteredManga[index]!['imageUrl']!,
                        )
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: 140,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(filteredManga[index]!['imageUrl']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    filteredManga[index]!['title']!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                      ],
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
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = 'All';
                    });
                  },
                  child: Card(child: Center(child: Text('All', style: TextStyle(fontSize: 18)))),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = 'Action';
                    });
                  },
                  child: Card(child: Center(child: Text('Action', style: TextStyle(fontSize: 18)))),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = 'Adventure';
                    });
                  },
                  child: Card(child: Center(child: Text('Adventure', style: TextStyle(fontSize: 18)))),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = 'Romance';
                    });
                  },
                  child: Card(child: Center(child: Text('Romance', style: TextStyle(fontSize: 18)))),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = 'Comedy';
                    });
                  },
                  child: Card(child: Center(child: Text('Comedy', style: TextStyle(fontSize: 18)))),
                ),
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
                itemCount: filteredManga.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(filteredManga[index]!['imageUrl']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}