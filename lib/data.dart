import 'dart:collection';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tasks/AvatarPage.dart';



import 'dart:io';
import 'PopUp.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'Data.dart';


// import 'dart:nativewrappers/_internal/vm/lib/hash_factories.dart';

int userID=-1;

List<List<String>>AnimeTags=[
["solo leveling","sung jin wo","action"],
["one piece","luffy","adventure"],
["jujutsu kaisen","gojo","horror"],
["pokemon","ash","adventure"],
["demon slayer","tanjiro","action"],
["naruto","naruto","action"],
["doctor stone","hero","drama"],
["bleach","bleach","action"]

];



//search results
List<String>name=["solo leveling","one piece","jujutsu kaisen","pokemon","demon slayer","naruto","doctor stone","bleach"];
List<String>imgSrc=[
              "https://sgimage.netmarble.com/images/netmarble/sololv/20240318/fxbt1710761341766.jpg",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlW9fB_ZzrD65QMDbBMQQwaPrVxdUsXUkmX1H3VSnUsXj3t5M88vpLz4XirToVULt6bG8&usqp=CAU",
              "https://metapress.com/wp-content/uploads/2024/05/gojo-vs-sukuna-1024x574.png",
              "https://editors.dexerto.com/wp-content/uploads/2022/08/15/is-pokemon-an-anime.jpg",
              "https://altselection.com/wp-content/uploads/2024/05/Demon-Slayer-10-choses-sur-la-serie-que-les-lecteurs-de-mangas-connaissent-mais-que-les-fans-de-lanime-ignorent.webp",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXTV10qdYdhetHBzE-WQVqn3DD3F65KiLG5tZfAcoCsNunQZejyqTI5C0ioO5fVIUhPtA&usqp=CAU",
              "https://images6.alphacoders.com/102/1027254.jpg",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKiAi9j3LbQxy4WmjGtNAiEwjfFsV44Ekb-w&s"
          ];
List<List<int>>lMp=[
  [10,22,31,44,5,6,17],
  [22,31,5,16,6,17],
  [20,22,31,5,16,8,6],
  [10,22,31,44,5,16],
  [22,31,5,16,6,17],
  [11,3,56,3,56],
  [10,11,2,3,4,5],
  [20,22,8,8,6,17],
];
List<String>videoSrc=[
  "https://youtu.be/Pm-wNmS9RGI?si=Qs856dO-TWf0k5jX"
];



 List<String> predefinedAvatars = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvhkngvkLvzwxUkvfwWfl23veK4pO2yshwN0SMRmY2eopj6MX9',
  'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTbT32LUn6S7sm0Ut1QBbDQm-vjbrAbZwhBy69huMSV-hNpX_-v',
  'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSosmNTu4jYfpUt8FbEPid9F1WN5H9Q6S3BNaSlqjXLifu757Gq',
  'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTr7D32hVP2dO0n5USzeo8n7chnztqPTWan5JESbeSIgH3aPKlV',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjLmWnaB5VtB-tqoA3J9XbsLlb7vo32PZAVg&s',
  'https://i.pinimg.com/originals/ab/94/d0/ab94d04932df2788f1a370cffbb333b6.gif',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOOaMQzgSjBXV5OXiwrxjfG1y-ToDpeXq2BQ&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFnuQHad8GeFn1S-SWq95AXxeqaZsX6F235A&s',
];



//main page
List<String> videos = [
    'https://cdn.pixabay.com/video/2023/01/06/145578-787481766_tiny.mp4',
    'https://cdn.pixabay.com/video/2021/08/10/84574-586228759_large.mp4',
    'https://cdn.pixabay.com/video/2021/10/01/90408-626004752_tiny.mp4',
    'https://cdn.pixabay.com/video/2022/06/19/108865-649916436_tiny.mp4',
    'https://cdn.pixabay.com/video/2022/07/22/144687-671979936_tiny.mp4',
  ];

  List<int> headerImages = [0,1,2,3,4,5,6,7];

  List<String> trendingImages = [
    "https://wallpapercave.com/wp/wp8427646.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgaJWOCGUUztW1oYmRQt6M0Fjg7IdbJm-mj_L5HqpOgeDIuExBeqIlcMvIOiHxyoOBQUQ&usqp=CAU",
    "https://mfiles.alphacoders.com/101/thumb-1013144.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA7tf1NT8YAMt8yXYloni0TAlQw2YyY4w1zg&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzgl_Dm_EzLrhNRcVFUKKuVSgRsIyXuKTOSg&s",
    "https://i.pinimg.com/736x/e3/87/e8/e387e8fa8516d0f06ff9d882e1bd01c4.jpg",
    'https://m.media-amazon.com/images/M/MV5BODFmYTUwYzMtM2M2My00NGExLWIzMDctYmRjNTNhZDc4MGI2XkEyXkFqcGdeQXVyMTMzNDExODE5.V1_FMjpg_UX1000.jpg',
    'https://m.media-amazon.com/images/M/MV5BNjRiNmNjMmMtN2U2Yi00ODgxLTk3OTMtMmI1MTI1NjYyZTEzXkEyXkFqcGdeQXVyNjAwNDUxODI@.V1_FMjpg_UX1000.jpg',
  ];












  class Users {    
    String email="",userName="",_passWd="";
    // Uint8List? profileImage=Uint8List(Image(imag:"https://i.pinimg.com/736x/d8/7d/bf/d87dbf4cc7f46c064a300bf2c6bd95a6.jpg"));
    Uint8List? profileImage;  
    LinkedHashMap<int,bool>favoriteList= LinkedHashMap();      
    LinkedHashMap<int,bool>savedList=LinkedHashMap();
    Users(String userName,String passWd,String email){
      this.userName=userName;
      this._passWd=passWd;
      this.email=email;
    }
    bool checkPassword(String passWd){
      if(this._passWd==passWd)return true;
      return false;
    }
    void changeData(String userName,String passWd,String email){
      if(userName!="")this.userName=userName;
      if(passWd!="")this._passWd=passWd;
      if(email!="")this.email=email;
    }
  //   @override
  // Widget build(BuildContext context){
  //   return Placeholder();
  // }
  
  // Future<Uint8List> _fetchImageBytes(String imageUrl) async {
  //   final response = await http.get(Uri.parse(imageUrl));
  //   if (response.statusCode == 200) {
  //     return response.bodyBytes;
  //   } else {
  //     throw Exception('Failed to load image');
  //   }
  // }

  // void _pickPredefinedAvatar(String imageUrl) async {
  //   try {
  //     final bytes = await _fetchImageBytes(imageUrl);
      
  //   } catch (e) {
  //     print('Error fetching image: $e');
  //   }
  // }
  }
  List<Users>lsUsers=[new Users("kranthi","siva5K","kranthivarma74@gmail.com"),new Users("siva", "12345678", "a@gmail.com")];



