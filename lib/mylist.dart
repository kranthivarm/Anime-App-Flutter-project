import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tasks/data.dart';
import 'package:tasks/pressedResult.dart';

class Mylist extends StatefulWidget {
  const Mylist({super.key});

  @override
  State<Mylist> createState() => _MylistState();
}

class _MylistState extends State<Mylist> {
  
  List<Widget> GridGen(bool ptr,double hei){
    
    List<Widget>res=[];
    LinkedHashMap<int,bool>temp=LinkedHashMap();
    if(ptr==true)temp=lsUsers[userID].favoriteList;
    else temp=lsUsers[userID].savedList;
    // for(int i=0;i<temp.length;i++){
    temp.forEach((key,value){    
      
      //icons featues
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

      String t=AnimeTags[key][2];
      res.add(
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Pressedresult(ind: key)));
        },
        child:Container(
          decoration: BoxDecoration(
            
            borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
          child: Column(children: [
        Container(
          alignment: Alignment.topRight,          
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
        Container(height: 20,padding: EdgeInsets.fromLTRB(0, 0, 0, 0),child: Text("Categories: $t ",style: TextStyle(fontSize: 10,color: Colors.grey),)),
        ])
      )
      )      
      );
    });
    return res;
  }
  @override
  Widget build(BuildContext context) {
    // double hei=MediaQuery.of(context).size.height;
    double wid= MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            flexibleSpace: Container(
            decoration:const BoxDecoration(
              gradient: RadialGradient(
                radius: 2,
                // colors: [Colors.white,Colors.blue,Colors.indigo,Colors.black,Colors.black,Colors.black],
                colors: [Colors.white,Colors.blue,Colors.indigo,Colors.black,Colors.black],
                )
            )
          ),
          title: Text("MyList"),
          centerTitle: true,
          bottom:TabBar(
            indicator: BoxDecoration(
              // color: Colors.pink,              
            ),
            tabs: [            
              Tab(text:"favorite",icon:Icon(Icons.favorite,color: Colors.pink,)),
              Tab(text: "Saved",icon:Icon(Icons.bookmark,color: Colors.yellow,)),
              // Tab(icon:Icon(Icons.access_alarm_rounded)),
              // Tab(icon:Icon(Icons.access_alarm_rounded)),
              ],),
        ),
        body: 
        Stack(
          children:[ 
            Container(
              // decoration:const BoxDecoration(
              //   gradient: RadialGradient(
              //     radius: 2,
              //     colors: [Colors.blue,Colors.indigo,Colors.black,],
              //   )
              // )
              color:Colors.black
            ),
            TabBarView(children: [
             GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              // childAspectRatio: ((hei/2)-10)/((hei/2)-10),
              childAspectRatio: 3/4,
              shrinkWrap: true,          
              children:GridGen(true,wid)
            ),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              // childAspectRatio: ((hei/2)-10)/((hei/2)-10),
              childAspectRatio: 3/4,
              shrinkWrap: true,          
              children:GridGen(false,wid)
            )
          ],),
          ]
        ),
      ),
    );
  }
}