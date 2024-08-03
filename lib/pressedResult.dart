import 'package:flutter/material.dart';
import 'package:tasks/data.dart';
import 'package:video_player/video_player.dart';


class Pressedresult extends StatefulWidget {
  final int ind;
  const Pressedresult({super.key,required this.ind});

  @override
  State<Pressedresult> createState() => _PressedresultState();
}

class _PressedresultState extends State<Pressedresult> {
  int i=0;
  bool ptr=false;
  List<Tab> tabsGen(int i){
    List<Tab>res=[];
    for(int j=0;j<lMp[i].length;j++){
      j++;
      res.add(Tab(text:"$j"));
      j--;
    }
    return res;
  }
  @override
  Widget build(BuildContext context) {
    late VideoPlayerController _controller;
    double wid=MediaQuery.of(context).size.width;
    i=widget.ind;


    Color col,col2;
      if((lsUsers[userID].favoriteList)[i]==true)col=Colors.pink;
      else {
        var t=lsUsers[userID].favoriteList.remove(i);
        col=Colors.white;
      }
      if((lsUsers[userID].savedList)[i]==true)col2=Colors.pink;
      else {
        var t=lsUsers[userID].savedList.remove(i);
        col2=Colors.white;
      }


    return DefaultTabController(length:lMp[i].length,
    child:Scaffold(
    backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:const BoxDecoration(
            gradient: RadialGradient(
              radius: 2,
              colors: [Colors.blue,Colors.indigo,Colors.black,],
              )
          )
        ),
        title: Text(AnimeTags[i][0],style: const TextStyle(color:Colors.white),),
        centerTitle: true,
      ),
      body: Stack(children: [
      Column(children: [
        Container(
          alignment: Alignment.topRight,
          height: wid-100,width: wid,
          decoration: BoxDecoration(              
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: NetworkImage(imgSrc[i]),fit: BoxFit.cover),              
          ),  


          child:Column(children: [            
              IconButton(onPressed: (){
                  setState(() {
                    if((lsUsers[userID].favoriteList)[i]==true){
                      col=Colors.white;
                      var t=lsUsers[userID].favoriteList.remove(i);
                    }
                    else {
                      (lsUsers[userID].favoriteList)[i]=true;
                      col=Colors.pink;
                    }
                  });
                }, icon: Icon(Icons.favorite,color: col),),
                Spacer(),
               IconButton(onPressed: (){
                setState(() {
                    if((lsUsers[userID].savedList)[i]==true){
                      col2=Colors.white;
                      var t=lsUsers[userID].savedList.remove(i);
                    }
                    else {
                      (lsUsers[userID].savedList)[i]=true;
                      col2=Colors.pink;
                    }
                  });
                }, 
               icon:Icon(Icons.bookmark_add,color: col2,)
              ),
          ],),


        ),          
        Container(child:Text("Seasons")),
        
        TabBar(
          physics:const NeverScrollableScrollPhysics(),
          // indicator: BoxDecoration(color:Colors.yellow),
          tabs: tabsGen(i)
        ),          
        Expanded(
          // height: 200,
          // color: Colors.pink,
          child: TabBarView(
            // children: TabBarViewGen(i)  
            children: List.generate(lMp[i].length, 
                (ind){                    
                 return  ListView.builder(
                    itemCount: lMp[i][ind],         
                    itemBuilder: (context,postion){
                      ind++;postion++;
                      String t=name[i]+" Season $ind Episode $postion";
                      ind--;postion--;
                      return GestureDetector(
                        onTap: (){
                         setState(() {
                          if(ptr==true){
                            ptr=false;                              
                          }
                          else{
                            ptr=true;
                            // _controller = VideoPlayerController.networkUrl(Uri.parse(
                            // 'https://cdn.pixabay.com/video/2023/01/06/145578-787481766_tiny.mp4'))
                            // ..initialize().then((_) {setState(() {});});
                          }
                         });
                        },
                        child:
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 1, 0, 1),                            
                            child: ListTile(
                              leading: Container(height: 100,width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image:NetworkImage(imgSrc[i]),fit: BoxFit.cover
                                  )
                                ),
                              ),
                              title: Text(t,style: TextStyle(color: Colors.black),),
                              subtitle: Text("size 32",style: TextStyle(color: Colors.black,fontSize: 15)),
                              // trailing:Container(child:Row(children:[IconButton(icon: Icon(Icons.download),onPressed: (){})]))
                              trailing: IconButton(icon: Icon(Icons.download),onPressed: (){}),
                            ),
                          ),
                        )                      
                      );
                    },
                  );
              }
            ),          
          ),
        )
      
      ],),
      if(ptr==true)...[
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          alignment: Alignment.center,
          width: wid,height: wid-100,
          // color: Colors.pink,          
          // child: _controller.value.isInitialized
          //   ? AspectRatio(
          //       aspectRatio: _controller.value.aspectRatio,
          //       child: VideoPlayer(_controller),
          //     )
          //   : Container(
          //       child: CircularProgressIndicator(),
          //     ),          
          child:VideoApp()
        )
      ]
      ]
    )
    )
    );
  }
}

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        videoSrc[0]))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Container(
          child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),

      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

















