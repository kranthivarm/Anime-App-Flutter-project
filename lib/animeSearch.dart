import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tasks/data.dart';
import 'package:tasks/pressedResult.dart';

class Searchresult extends StatefulWidget {
  final String searchSt;
  const Searchresult({
    super.key,
    required this.searchSt
  });

  @override
  State<Searchresult> createState() => _Searchresult();
}

class _Searchresult extends State<Searchresult> {
  final TextEditingController _searchController=TextEditingController();
  String searchString ="";

  LinkedHashMap<int,bool> searching(String s){
    s=(s.toLowerCase()).trim();
    // for(int i=0;i<widget.tags.length;i++)mp[i]=false;
    // for(int i=0;i<widget.tags.length;i++){
    //   if(widget.tags[i][0]==s || widget.tags[i][1]==s || widget.tags[i][2]==s || widget.tags[i][3]==s)mp[i]=true;
    // }
    LinkedHashMap<int,bool>mp= LinkedHashMap();  
    List<int>ptr=[]; 
    for(int i=0;i<AnimeTags.length;i++) {
      if(AnimeTags[i][0]==s){
        mp[i]=true;
        ptr.add(i);    
      }
    }int p=2;
    // while(p<AnimeTags[0].length){
    for(int j=0;j<ptr.length;j++){  
      for(int k=0;k<AnimeTags.length;k++){
        // if(AnimeTags[k][p]==AnimeTags[ptr[k]][p])mp[k]=true;
        if(AnimeTags[ptr[j]][p]==AnimeTags[k][p])mp[k]=true;
        // for(int i=0;i<AnimeTags.length;i++)if(AnimeTags[i][0]==s)mp[i]=true;
        // for(int i=0;i<AnimeTags.length;i++)if(AnimeTags[i][1]==s)mp[i]=true;
        // for(int i=0;i<AnimeTags.length;i++)if(AnimeTags[i][2]==s)mp[i]=true;
      }
    }
    // p++;
  // }
    if(ptr.length==0){
      for(int i=0;i<AnimeTags.length;i++)if(AnimeTags[i][1]==s)mp[i]=true;
      for(int i=0;i<AnimeTags.length;i++)if(AnimeTags[i][2]==s)mp[i]=true;
    }
    return mp;
  }
  
  List<Widget> searchResultReturner(String s,double hei){
    final TextEditingController _searchController = TextEditingController();
    LinkedHashMap<int,bool>mp= searching(s);
    List<Widget>res=[];
    mp.forEach((key,value){
      String t=AnimeTags[key][2];
      Color col,col2;
      if((lsUsers[userID].favoriteList)[key]==true)col=Colors.pink;
      else {
        var t=lsUsers[userID].favoriteList.remove(key);
        col=Colors.white;
      }
      if((lsUsers[userID].savedList)[key]==true)col2=Colors.pink;
      else {
        var t=lsUsers[userID].savedList.remove(key);
        col2=Colors.white;
      }
      res.add(
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Pressedresult(ind: key)));
        },
        child:Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            // boxShadow: [
            //         BoxShadow(
            //           color: Colors.black,
                    
            //           blurRadius: 10.0,
            //           spreadRadius: 1.0,
            //         ), 
            //       ],
            ),
          child: Column(children: [
        Container(
          alignment: Alignment.bottomRight,          
          height: (hei/2)-5,width: (hei/2)-5,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration( 
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(imgSrc[key]),
              fit: BoxFit.cover)
          ),          
          child:Column(children: [            
              IconButton(onPressed: (){
                  setState(() {
                    if((lsUsers[userID].favoriteList)[key]==true){
                      col=Colors.white;
                      var t=lsUsers[userID].favoriteList.remove(key);
                    }
                    else {
                      (lsUsers[userID].favoriteList)[key]=true;
                      col=Colors.pink;
                    }
                  });
                }, icon: Icon(Icons.favorite,color: col),),
                Spacer(),
               IconButton(onPressed: (){
                setState(() {
                    if((lsUsers[userID].savedList)[key]==true){
                      col2=Colors.white;
                      var t=lsUsers[userID].savedList.remove(key);
                    }
                    else {
                      (lsUsers[userID].savedList)[key]=true;
                      col2=Colors.pink;
                    }
                  });
                }, 
               icon:Icon(Icons.bookmark_add,color: col2,)
              ),
          ],),
        ),
        Container(height: 30,padding: EdgeInsets.fromLTRB(0, 0, 0, 5),child: Text(AnimeTags[key][0],style: TextStyle(fontSize: 20,color: Colors.black),),),
        Container(height: 20,padding: EdgeInsets.fromLTRB(0, 0, 0, 0),child: Text("Catogeries: $t ",style: TextStyle(fontSize: 10,color: Colors.grey),)),
        ])
      )
      )      
      );
    })    ;
    return res;
  }
  @override
  Widget build(BuildContext context) {
    // double hei=MediaQuery.of(context).size.height;
    double wid= MediaQuery.of(context).size.width;
    searchString=widget.searchSt;
    return Scaffold(
      backgroundColor: Colors.white,                    
      appBar: AppBar(        
           flexibleSpace: Container(
            decoration:const BoxDecoration(
              gradient: RadialGradient(
                radius: 2,
                // colors: [Colors.white,Colors.yellow,Colors.yellow,Colors.green,Colors.green],
                // colors:[Colors.white,Colors.pink,Colors.pink,Colors.purple,Colors.purple]
                colors: [Colors.white,Colors.blue,Colors.indigo,Colors.black],
                )
            )
          ),
        // title: TextField(
        //   controller: tEc,
        //   decoration: InputDecoration(
        //     hintText: "enter any feature of product",            
        //   ),
        //   onChanged: (value){
        //     setState(() {
        //       searchString = value;
        //     });
        //   },
        // ),
        // actions: [
        //   IconButton(onPressed: (){            
        //     Navigator.push(context,MaterialPageRoute(builder: (context)=> Searchresult(searchSt: searchString)));
        //   },tooltip: "search button", icon:const Icon(Icons.search))
        // ],
        title: Container(          
                    // padding:
                    //     const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child:  Row(                      
                        children: [                        
                         Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)
                            ),
                            color:Colors.white,  
                          )     ,                   
                          height: 50,
                          width: (MediaQuery.of(context).size.width)-130,
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
                              print(_searchController.text)                        ;
                              // Navigator.push(context,MaterialPageRoute(builder: (context)=> Searchresult(searchSt:searchString)));
                              Navigator.push(context,MaterialPageRoute(builder: (context)=> Searchresult(searchSt:_searchController.text)));
                              },tooltip: "search button", icon:const Icon(Icons.search)
                            ),
                          ),
                         )
                      ]
                      ),                  
                  ),
                  centerTitle: false,
      ),


      body:  Stack(
        children:[ 
          Container(
            // decoration:const BoxDecoration(
            //       gradient: RadialGradient(
            //       radius: 2,
            //       // colors: [Colors.yellow,Colors.yellow,Colors.green,Colors.green,Colors.black,],
            //       // colors:[Colors.white,Colors.pink,Colors.pink,Colors.purple,Colors.purple,Colors.black,Colors.black]
            //       colors: [Colors.white,Colors.blue,Colors.indigo,Colors.black,Colors.black,Colors.black],
            //     )
            //   )
            color:Colors.black
          ),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            // childAspectRatio: ((hei/2)-10)/((hei/2)-10),
            childAspectRatio: 3/4,
            shrinkWrap: true,
        
            children:searchResultReturner(searchString,wid),
        ),
        ]
      )



    );
  }
}