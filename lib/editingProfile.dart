import 'package:flutter/material.dart';
import 'dart:ui';
import 'profile.dart';
import 'package:tasks/data.dart';
class Editingprofile extends StatefulWidget {
  const Editingprofile({super.key});

  @override
  State<Editingprofile> createState() => _EditingprofileState();
}
class _EditingprofileState extends State<Editingprofile> {
  bool x=false;
  final TextEditingController _editUsername = TextEditingController();
  final TextEditingController _editEmail = TextEditingController();

  //alert box
  void alertMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editing profile'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // if (message == 'Confirm Edit') return;
                // else if(message=="Email isn't proper" || message=="Email already Exists"){
                //   Navigator.of(context).pop();
                // }
                if(message=='Confirm Edit')Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Profile()));
                else
                Navigator.of(context).pop();
                  x=true;
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://t.pimg.jp/104/149/208/1/104149208.jpg'), // Add your background image here
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Glass effect
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                child: Container(
                  width: 300.0,
                  height: 500,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage('https://render.fineartamerica.com/images/rendered/default/flat/round-beach-towel/images/artworkimages/medium/3/itachi-uchiha-yona-yora.jpg?&targetx=67&targety=-43&imagewidth=645&imageheight=879&modelwidth=788&modelheight=788&backgroundcolor=000000&orientation=0'), // Add your profile image here
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller:_editUsername,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.black38),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.2),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),      
                        keyboardType: TextInputType.emailAddress,                 
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller:_editEmail,
                        decoration: InputDecoration(                          
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.black38),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.2),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 20.0),                      
                      Container(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                            onPressed:(){
                                if(_editEmail.text==""  && _editUsername.text=="")alertMessage("Fill new details");
                                else if(_editEmail.text!=""){
                                      if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch((_editEmail.text).trim())){
                                        _editEmail.text="";
                                        alertMessage("Email isn't proper");
                                        return ;
                                      }
                                      for(int x=0;x<lsUsers.length;x++){
                                        // print(lsUsers[x].email+"     "+_editEmail.text);
                                        if(lsUsers[x].email==(_editEmail.text).trim()){
                                          // print("scsakjie"+lsUsers[x].email+"     "+_editEmail.text);
                                          _editEmail.text="";
                                          alertMessage("Email already Exists");
                                          return ;
                                        }
                                      }
                                }
                                if(_editEmail.text!="")lsUsers[userID].email=(_editEmail.text).trim();
                                if(_editUsername.text!="")lsUsers[userID].userName=(_editUsername.text).trim();
                                alertMessage("Confirm Edit");
                                // Navigator.of(context).pop();
                            },
                            child: const Text('Edit', style: TextStyle(fontSize: 17.5, color: Colors.black)),
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}