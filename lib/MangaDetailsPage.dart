import 'package:flutter/material.dart';

import 'data2.dart';


class MangaDetailPage extends StatefulWidget {
  final String mangaTitle;
  final String imageUrl;

  MangaDetailPage({required this.mangaTitle, required this.imageUrl});

  @override
  _MangaDetailPageState createState() => _MangaDetailPageState();
}

class _MangaDetailPageState extends State<MangaDetailPage> {
  List<Map<String, String>> chapters = [];
  bool isLoading = false;
  int currentPage = 0;
  final int chaptersPerPage = 10;

  @override
  void initState() {
    super.initState();
    _loadMoreChapters();
  }

  Future<void> _loadMoreChapters() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2)); // Simulate network delay

    List<Map<String, String>> newChapters = List.generate(chaptersPerPage, (index) {
      int chapterNumber = currentPage * chaptersPerPage + index + 1;
      return {
        'title': 'Chapter $chapterNumber: Title',
        'imageUrl': widget.imageUrl,
        'description': 'Description for Chapter $chapterNumber',
        'chapterNumber': chapterNumber.toString()
      };
    });

    setState(() {
      currentPage++;
      chapters.addAll(newChapters);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.mangaTitle)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.imageUrl),
            SizedBox(height: 20),
            Text(widget.mangaTitle, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: chapters.length + (isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == chapters.length) {
                  _loadMoreChapters();
                  return Center(child: CircularProgressIndicator());
                }

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MangaChapterPage(
                          chapterTitle: chapters[index]['title']!,
                          imageUrl: chapters[index]['imageUrl']!,
                          description: chapters[index]['description']!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.network(
                          chapters[index]['imageUrl']!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chapters[index]['title']!,
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(chapters[index]['description']!),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MangaChapterPage extends StatelessWidget {
  final String chapterTitle;
  final String imageUrl;
  final String description;

  MangaChapterPage({required this.chapterTitle, required this.imageUrl, required this.description});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(chapterTitle)),
      body: ListView.builder(
        itemCount: pageImages.length,
        itemBuilder: (context, index) {
          return Image.network(pageImages[index]);
        },
      ),
    );
  }
}