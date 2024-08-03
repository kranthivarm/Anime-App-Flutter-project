import 'package:flutter/material.dart';
import 'package:tasks/searchResult.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _Mainpage();
}

class _Mainpage extends State<MainPage> {
  final TextEditingController tEc=TextEditingController();
  String searchString="";
  List<List<String>>tags=[
    ["shoes","puma","yellow","sneakers"],
    ["shoes","puma","pink","sneakers"],
    ["shoes","Nike","white","sneakers"],
    ["shoes","Redtape","green","sneakers"],
    ["shoes","louis vuitton","brown","sneakers"],
    ["dress","allen solly","black","blazer"],
    ["dress","peter england","blue","shirt"],
    ["dress","tommy hilfiger","navy","tshirt"],
    ["dress","sri ram","brown","under wear"]
  ];
  List<String>img=[
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKJ_hXiLgrcFW3AsXJeYNO5eG-WGIG1MCBug&s",
    "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/392061/03/sv02/fnd/AUS/fmt/png/Slipstream-PRM-Women's-Sneakers",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB06kzCxgzT_CmPyvUALjrtChuy2TbK03XBA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGDirBBDu1n_4PjLvprpYNB7OnWh4kuMOh2A&s",
    "https://kdbdeals.com/wp-content/uploads/2024/02/Loui_s_Vuitton-Trainer-LV-Leather-Beige-Plain-Men-Shoes-3700-2-1.webp",
    "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/e/e/ee5ee65AHBZCRGHX13492_1.jpg?rnd=20200526195200&tr=w-512",
    "https://imgmedia.lbb.in/media/2019/05/5cd26d4e5b4994477ff5482e_1557294414292.jpg",
    "https://images-cdn.ubuy.co.in/633ff81722079a5064597a9b-tommy-hilfiger-mens-adaptive-t-shirt.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPSF_7SID-FzJIaBF6Zb5hhyTPCS-MGQeRyA&s",
  ];
  // List<int>resInd=[];
  Map<int,bool>mp={};

  Map<int,bool> searching(String s){
    s=(s.toLowerCase()).trim();
    // s=s.trim();
    for(int i=0;i<tags.length;i++)mp[i]=false;
    for(int i=0;i<tags.length;i++){
      if(tags[i][0]==s || tags[i][1]==s || tags[i][2]==s || tags[i][3]==s)mp[i]=true;
    }
    return mp;
  }

  List<Widget> searchResultReturner(String s){
    searching(s);
    List<Widget>res=[];
    mp.forEach((key,value){
      if(value==true)res.add(
        GestureDetector(
          onTap: (){
            // Navigator.push(context,MaterialPageRoute(builder: (context)=>))
          },
        child:Container(
          height: 200,width: 200,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration( 
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(img[key]),
              fit: BoxFit.cover)
          ),
        )
      )
      );
    })    ;
    // return[
    //   Container(height: 50,alignment: Alignment.centerLeft,child: Text(s),),
    //   SizedBox(height: 200,
    //     child: SingleChildScrollView(scrollDirection:Axis.horizontal,child:Row(children:res),)
    //   )
    // ];
    return res;
  }
  @override
  Widget build(BuildContext context) {
    double hei=MediaQuery.of(context).size.height;
    double wid= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.pink[300],
      appBar: AppBar(        
        title: TextField(
          controller: tEc,
          decoration: InputDecoration(
            hintText: "enter any feature of product",            
          ),
          onChanged: (value){
            setState(() {
              searchString = value;
            });
          },
        ),
        actions: [
          IconButton(onPressed: (){
            // searching(searchString);
            Navigator.push(context,MaterialPageRoute(builder: (context)=> Searchresult(tags: tags, img: img, searchSt: searchString)));
          },tooltip: "search button", icon:const Icon(Icons.search))
        ],
      ),


      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Container(
            height: wid,
            width: wid,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage("https://img.freepik.com/free-vector/diwali-sale-poster-design-with-cracker_1017-15852.jpg"),
                fit:BoxFit.cover)
            ),
          ),          
          Container(height: 50,alignment: Alignment.centerLeft,child: Text("shoes",style: TextStyle(fontSize: 20),),),
          SingleChildScrollView(scrollDirection: Axis.horizontal,child:Row(children: searchResultReturner("shoes"),)),
          Container(height: 50,alignment: Alignment.centerLeft,child: Text("dress",style: TextStyle(fontSize: 20),),),
          SingleChildScrollView(scrollDirection: Axis.horizontal,child:Row(children: searchResultReturner("dress"),)),
          Container(height: 50,alignment: Alignment.centerLeft,child: Text("watch",style: TextStyle(fontSize: 20),),),
          SingleChildScrollView(scrollDirection: Axis.horizontal,child:Row(children: searchResultReturner("shoes"),)),
          

        ],)
        ),
      






      drawer: Drawer(
        child:ListView(
          children: [
            DrawerHeader(
              child:UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [
                  Colors.yellow,Colors.red,Colors.orange
                  ],
                  )
                ),
              accountName: Text('kranthi'),
              accountEmail: Text("kranthi5S@gmail.com"),
              currentAccountPicture:ClipOval(child: Container(                
              height: 100,
              width:100,
              child:Image.network("https://wallpapers.com/images/featured/detective-pikachu-9z3yp3akua2dnmeh.jpg",fit: BoxFit.cover,)              
              ),
              ),
            )
            ),
            ListTile(
              leading:Icon(Icons.favorite,color: Colors.pink,),
              title: Text("sivani"),
              trailing:Icon(Icons.thumb_up)
            ),
            ListTile(
              leading:Icon(Icons.favorite,color: Colors.pink,),
              title: Text("Lalitha"),
              trailing:Icon(Icons.thumb_up)
            ),
            ListTile(
              leading:Icon(Icons.favorite,color: Colors.pink,),
              title: Text("sahitya{pyari}"),
              trailing:Icon(Icons.thumb_up)
            ),
          ],
        )
      ),
    );
  }
}