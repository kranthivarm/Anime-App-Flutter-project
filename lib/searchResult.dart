import 'package:flutter/material.dart';

class Searchresult extends StatefulWidget {
  final List<List<String>>tags;
  final List<String>img;
  final String searchSt;
  const Searchresult({
    super.key,    
    required this.tags,
    required this.img,
    required this.searchSt,
  });

  @override
  State<Searchresult> createState() => _Searchresult();
}

class _Searchresult extends State<Searchresult> {
  final TextEditingController tEc=TextEditingController();
  String searchString ="";
  Map<int,bool>mp={};

  void searching(String s){
    s=(s.toLowerCase()).trim();
    // s=s.trim();    
    
    for(int i=0;i<widget.tags.length;i++)mp[i]=false;
    for(int i=0;i<widget.tags.length;i++){
      if(widget.tags[i][0]==s || widget.tags[i][1]==s || widget.tags[i][2]==s || widget.tags[i][3]==s)mp[i]=true;
    }
  }

  List<Widget> searchResultReturner(String s,double hei){
    searching(s);
    List<Widget>res=[];
    mp.forEach((key,value){
      if(value==true)res.add(
      GestureDetector(
        onTap: (){
          
        },
        child:Container(
          color: Colors.white,
          child: Column(children: [
        Container(
          alignment: Alignment.topLeft,          
          height: (hei/2)-60,width: (hei/2)-60,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration( 
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(widget.img[key]),
              fit: BoxFit.cover)
          ),
        ),
        Container(height: 30,padding: EdgeInsets.fromLTRB(0, 0, 0, 5),child: Text(widget.tags[key][1],style: TextStyle(fontSize: 20),),),
        Container(height: 20,padding: EdgeInsets.fromLTRB(0, 0, 0, 0),child: Text(widget.tags[key][2]+widget.tags[key][3],style: TextStyle(fontSize: 10),),),
        ])
      )
      )      
      );
    })    ;
    return res;
  }
  @override
  Widget build(BuildContext context) {
    double hei=MediaQuery.of(context).size.height;
    double wid= MediaQuery.of(context).size.width;
    searchString=widget.searchSt;
    return Scaffold(
      backgroundColor: Colors.pink[200],
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
            Navigator.push(context,MaterialPageRoute(builder: (context)=> Searchresult(tags: widget.tags, img: widget.img, searchSt: searchString)));
            // setState(() {
              
            // });
          },tooltip: "search button", icon:const Icon(Icons.search))
        ],
      ),


      body:  GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: ((hei/2)-10)/((hei/2)-10),
          shrinkWrap: true,
          // children: List.generate(20, (index) {
          //     // listGen();
          //     return Padding(
          //       padding: const EdgeInsets.all(10.0),
          //       child: Container(
          //         decoration: BoxDecoration(
          //           color:Colors.yellow,
          //           // image: DecorationImage(
          //           //   image: NetworkImage(''),
          //           //   fit: BoxFit.cover,
          //           // ),
          //           borderRadius: 
          //           BorderRadius.all(Radius.circular(20.0),),
          //         ),
          //       ),
          //     );
          //   },),
          children:searchResultReturner(searchString,wid),
      )



    );
  }
}