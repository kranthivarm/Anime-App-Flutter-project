import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tasks/data.dart';

import 'package:tasks/login.dart';
import 'editingProfile.dart';
import 'dart:typed_data';


class Profile extends StatefulWidget {
  final Uint8List? avatarImage;
  Profile({super.key, this.avatarImage});

  @override
  State<Profile> createState() => _ProfileState(avatarImage: avatarImage);
}

class _ProfileState extends State<Profile> {
  final Uint8List? avatarImage;
  _ProfileState({this.avatarImage});

  bool value = false;

  List<Widget> GraphBarReturner(double hei){
    double sum=0;
    List<double>res=[0,0,0,0,0];
    lsUsers[userID].favoriteList.forEach((key,value) {
      ++sum;
      if(AnimeTags[key][2]=="love")res[0]++;
      else if(AnimeTags[key][2]=="horror")res[1]++;
      else if(AnimeTags[key][2]=="action")res[2]++;
      else if(AnimeTags[key][2]=="drama")res[3]++;
      else if(AnimeTags[key][2]=="adventure")res[4]++;
    });
    lsUsers[userID].savedList.forEach((key,value) {
      ++sum;
      if(AnimeTags[key][2]=="love")res[0]++;
      else if(AnimeTags[key][2]=="horror")res[1]++;
      else if(AnimeTags[key][2]=="action")res[2]++;
      else if(AnimeTags[key][2]=="drama")res[3]++;
      else if(AnimeTags[key][2]=="adventure")res[4]++;
    });
    List<Widget>row=[];
    List<Color>col=[Colors.pink,Colors.black,Colors.blue,Colors.green,Colors.yellow];
    for(int i=0;i<5;i++){
      double doubX=0.0;
      if(sum!=0)doubX=((res[i]/sum)*100).toDouble();
      double HEIGHT;
      if(doubX==0.0)HEIGHT=1.0;
      else HEIGHT=(doubX*(hei-21))/100;
      print(HEIGHT);
      row.add(
        Container(height: hei,width: 50,
          child: Column(
            children:[
              Spacer(),
              Container(width: 50,height: 21,child: Text("$doubX%",style: TextStyle(fontSize: 15),)),
              Container(
                // alignment: Alignment.bottom;
                width: 30,
                // height:30,
                height: HEIGHT,
                color:col[i],
              ),
            ]
          ),
        )
      );
    }
    return row;
  }

  @override
  Widget build(BuildContext context) {
    double hei=MediaQuery.of(context).size.height;
    double wid=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          // clipBehavior: Clip.none,
          // alignment: AlignmentDirectional.bottomStart,
          children: [
          Container(// both graph single scroll
            color: Colors.grey,
            child: Column(
              children: [
                Container(//profile and graph
                  child: Column(
                    children:[
                      Container(//black container
                        height: (wid/4)+10,
                        color: Colors.black,
                      ),
                      SizedBox(height: (wid/4)-30),
                      Text("Taste ",style: TextStyle(fontSize: 20,color: Colors.purple),),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        height: wid,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color:Colors.black)
                          // border: Border(
                          //   left: BorderSide(color: Colors.black),
                          //   bottom: BorderSide(color: Colors.black),
                          // ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    child:Row(children: [
                                      ClipOval(child:Container(height: 15,width: 15,color:Colors.pink,)),
                                      Text("Love     ",style: TextStyle(fontSize: 15),)
                                    ],)
                                ),
                                SizedBox(
                                    child:Row(children: [
                                      ClipOval(child: Container(height: 15,width: 15,color:Colors.black,)),
                                      Text("Horror",style: TextStyle(fontSize: 15),)
                                    ],)
                                ),
                                SizedBox(
                                    child:Row(children: [
                                      ClipOval(child:Container(height: 15,width: 15,color:Colors.blue,)),
                                      Text("Action   ",style: TextStyle(fontSize: 15),)
                                    ],)
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    child:Row(children: [
                                      ClipOval(child:Container(height: 15,width: 15,color:Colors.green,),),
                                      Text("Drama    ",style: TextStyle(fontSize: 15),)
                                    ],)
                                ),
                                SizedBox(
                                    child:Row(children: [
                                      ClipOval(child:Container(height: 15,width: 15,color:Colors.yellow,),),
                                      Text("Adventure",style: TextStyle(fontSize: 15),)
                                    ],)
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Expanded(child:
                            Container(//Graph
                              // alignment: Alignment.bottomLeft,
                              margin: EdgeInsets.fromLTRB(20, 20, 20, 30),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                                child:
                                Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    // color: Colors.white,
                                    border: Border(
                                      left: BorderSide(color: Colors.black,width: 2),
                                      bottom: BorderSide(color: Colors.black,width: 2),
                                    ),

                                  ),
                                  child:LayoutBuilder(
                                    builder: (context, constraints) {
                                      double parentHeight = constraints.maxHeight;
                                      print(parentHeight);
                                      return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: GraphBarReturner(parentHeight)
                                      );
                                    }
                                  ),
                            )
                            )//graph
                            )//expanded with graph
                          ],
                        ),
                      ),//end of graph Container
                    ]
                  ),
                ),//end of profile and graph


                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.person_outline),
                          title: Text(
                            'Edit Profile',
                            style: TextStyle(color: Colors.white),
                          ),
                          tileColor: Colors.black,
                          hoverColor: Colors.green,
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex)=>Editingprofile()));
                            // setState(() {
                            //   lsUsers[userID].email=lsUsers[userID].email;
                            //   lsUsers[userID].userName=lsUsers[userID].userName;
                            // });
                          },
                        ),
                        SizedBox(height: 10),
                        ListTile(
                          leading: Icon(Icons.security),
                          title: Text(
                            'Security',
                            style: TextStyle(color: Colors.white),
                          ),
                          tileColor: Colors.black,
                          hoverColor: Colors.green,
                          mouseCursor: MouseCursor.defer,
                          onTap: () {},
                        ),
                        SizedBox(height: 10),
                        ListTile(
                          leading: Icon(Icons.logout_rounded),
                          title: Text(
                            'Log Out',
                            style: TextStyle(color: Colors.white),
                          ),
                          tileColor: Colors.black,
                          hoverColor: Colors.green,
                          mouseCursor: MouseCursor.defer,
                          onTap: () {
                            Navigator.pushReplacement( context,MaterialPageRoute(builder: (context) => SignupandLoginPage()));
                          },
                        ),
                        SizedBox(height: 10),
                        ListTile(
                          leading: Icon(Icons.subtitles),
                          title: Text(
                            'Subtitile Settings',
                            style: TextStyle(color: Colors.white),
                          ),
                          tileColor: Colors.black,
                          hoverColor: Colors.green,
                          mouseCursor: MouseCursor.defer,
                          onTap: () {},
                        ),
                        SizedBox(height: 10),
                        ListTile(
                          leading: Icon(Icons.help_center),
                          title: Text(
                            'Help Center',
                            style: TextStyle(color: Colors.white),
                          ),
                          tileColor: Colors.black,
                          hoverColor: Colors.green,
                          mouseCursor: MouseCursor.defer,
                          onTap: () {},
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),//end of graph and scrol





            //profile Image name and Email;
            Positioned(
              top: 20,
              left: 10,
              child: Container(
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: wid/4,
                        child: lsUsers[userID].profileImage!= null
                            ? ClipOval(
                          child: Image.memory(
                            lsUsers[userID].profileImage!,
                            fit: BoxFit.cover,
                            // width: 200,
                            // height: 300,
                          ),
                        )
                            : ClipOval(child:Image.network("https://i.pinimg.com/736x/d8/7d/bf/d87dbf4cc7f46c064a300bf2c6bd95a6.jpg"))

                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 25),
                      child: Column(
                        children: [
                          Text(
                            lsUsers[userID].userName,
                            style: TextStyle(color: Colors.white,fontSize: 25),
                          ),
                          Text(
                            lsUsers[userID].email,
                            style: TextStyle(color: Colors.white,fontSize: 15),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                height: 150,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ],
        )
      ),
    );
  }
}