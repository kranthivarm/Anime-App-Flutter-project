// import 'dart:convert';
import 'dart:ui';


import 'package:flutter/widgets.dart';
import 'package:tasks/AvatarPage.dart';
import 'package:tasks/data.dart';
import 'package:tasks/main.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tasks/popUp.dart';

class SignupandLoginPage extends StatelessWidget {
  const SignupandLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black,              
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:NetworkImage("https://images.hdqwalls.com/download/satoru-gojo-28-1125x2436.jpg"),
              fit: BoxFit.cover
            )
          ),
          alignment: Alignment(0,0),
          child: Column(
            children: [
              Spacer(),
              // SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
              // Container(
              //   height: MediaQuery.sizeOf(context).height * 0.2,
              //   decoration: BoxDecoration(
              //     image: const DecorationImage(
              //         image:NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeS3ZnKUbfvKTLhzTjqb0dVkSr2jtR09slrewKb-dBDOe3SkonPmSflo3w7DRWxOJ5TqE&usqp=CAU"),
              //         fit: BoxFit.cover
              //       ),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              // ),
              // SizedBox(height: MediaQuery.sizeOf(context).height * 0.43),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                        color: const Color.fromARGB(255, 57, 139, 215),
                        width: 3.0,
                        style: BorderStyle.solid,
                        strokeAlign: BorderSide.strokeAlignInside,
                      )),
                  child: const Center(
                    child: Text(
                      'LOG IN',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.025,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupForm(),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: const Color.fromARGB(255, 57, 139, 215),
                      border: Border.all(
                        color: const Color.fromARGB(255, 57, 139, 215),
                        width: 3.0,
                        style: BorderStyle.solid,
                        strokeAlign: BorderSide.strokeAlignInside,
                      )),
                  child: const Center(
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.025,
              ),
            ],
          ),
        ));
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  // ignore: non_constant_identifier_names
  Color col=Colors.red;
  String signUserName ="", signPasswd = "", signEmail="", signPasswd2 = "";

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =TextEditingController();

  void _signUp() async {
    signUserName = _usernameController.text;
    signEmail= _emailController.text;
    signPasswd = _passwordController.text;
    signPasswd2 = _confirmPasswordController.text;

    if (_formKey.currentState?.validate() ?? false) {
      if(_passwordController.text== _confirmPasswordController.text){             
        for(int i=0;i<lsUsers.length;i++){
          if(lsUsers[i].email==_emailController.text){
            setState(() {
              _emailController.text="";              
            });
            _showDialog("User already exists");
            return ;
          }
        }

        lsUsers.add(
          new Users(signUserName, signPasswd, signEmail)
        );
        userID=(lsUsers.length)-1;
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>MyAvatarPage()));
      }
      else{
        setState(() {
           _passwordController.text="";
           _confirmPasswordController.text="";
        });       
      }

    //   try {
    //     final response = await http.post(
    //       Uri.parse('http://10.16.55.110:3000/data'),
    //       body: json.encode({
    //         'email': Email,
    //         'password': Password,
    //       }),
    //       headers: {
    //         'Content-Type': 'application/json',
    //       },
    //     );
    //     if (response.statusCode == 200) {
    //       setState(() {
    //         _showDialog(response.body);

    //         // Navigator.push(context,MaterialPageRoute(builder:
    //         // (context) => myNavigationBar(),
    //         // ));
    //       });
    //     } else {
    //       _showDialog('Failed to register user');
    //     }
    //   } catch (e) {
    //     _showDialog('An error occurred: $e\n');
    //   }
    }
  }

  bool _passwordVisible = false;

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign Up'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                if (message == 'User Registered Successfully') {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Poppage(),
                      ));
                } else {
                  Navigator.of(context).pop();
                }
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
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://img.freepik.com/free-photo/anime-style-clouds_23-2151071749.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.35),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0),
                child: Container(
                  clipBehavior: Clip.none,
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20),
                  //     gradient: const LinearGradient(colors: [
                  //       Color.fromARGB(255, 200, 190, 180),
                  //       Color.fromARGB(255, 180, 150, 188)
                  //     ], end: Alignment.topLeft, begin: Alignment.topRight)),                  
                  height: 700,
                   padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Anime',
                                style: TextStyle(color: Colors.black.withOpacity(0.75),
                                    fontWeight: FontWeight.bold, fontSize: 35),
                              ),
                              Text(
                                'Plus',
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.blue.withOpacity(0.6),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                  labelText: 'User Name',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter user name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16.0),
                              TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16.0),
                              TextFormField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: const OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                                obscureText: !_passwordVisible,
                                validator: (value) {
                                  final passwordRegex = RegExp(
                                      r'^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[@$!%?&_])[A-Za-z\d@$!%?&_]{8,}$');
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (value.length < 8) {
                                    return 'Password must be at least 8 characters long';
                                  } else if (passwordRegex.hasMatch(
                                      _confirmPasswordController.text)) {
                                    return 'password must have';
                                  } else if (value != _passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20.0),
                              TextFormField(
                                style: TextStyle(color: col),
                                controller: _confirmPasswordController,
                                decoration: InputDecoration(                                
                                  labelText: 'Confirm Password',
                                  border: const OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                                onChanged: (value){
                                  if(_passwordController.text==value){
                                    setState(() {
                                      col=Colors.green;
                                    });                                  
                                  }
                                  else {setState(() {
                                      col=Colors.red;
                                    });
                                  }
                                },
                                obscureText: !_passwordVisible,
                                validator: (value) {
                                  final passwordRegex = RegExp(
                                      r'^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[@$!%?&_])[A-Za-z\d@$!%?&_]{8,}$');
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (value.length < 8) {
                                    return 'Password must be at least 8 characters long';
                                  } else if (passwordRegex.hasMatch(
                                      _confirmPasswordController.text)) {
                                    return 'password must have';
                                  } else if (value != _passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Already an User?',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                         Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>LoginPage())); 
                                      },
                                      child: const Text(
                                        'Login',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color.fromARGB(255, 33, 79, 243),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 150,
                                child: ElevatedButton(
                                  onPressed: _signUp,
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(
                                        fontSize: 17.5, color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Text(
                        'Or',
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: SizedBox(
                          width: 375,
                          child: TextButton(
                              onPressed: () {},
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.google,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 22),
                                  Text(
                                    'SignUp with Google',
                                    style: TextStyle(
                                        fontSize: 22.5, color: Colors.grey),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: SizedBox(
                          width: 375,
                          child: TextButton(
                              onPressed: () {},
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 14),
                                  Icon(
                                    Icons.facebook,
                                    size: 30,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    'SignUp with FaceBook',
                                    style: TextStyle(
                                        fontSize: 22.5, color: Colors.grey),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      )
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



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Color col =Colors.black;
  bool _passwordVisible = false;  


  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('login'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                if (message == 'User Registered Successfully') {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Poppage(),
                      ));
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _login() {
    // _emailController.text = 'mallidivikasreddy@gmail.com';
    
    if (_formKey.currentState?.validate() ?? false ) {  
      for(int k=0;k<lsUsers.length;k++){
        if(lsUsers[k].email== _emailController.text && lsUsers[k].checkPassword(_passwordController.text) ){
          userID=k;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (Context) =>  mnb()));
          return ;
        }
      }          
      
        _showDialog("Credentials are invalid");
        setState(() {          
          _emailController.text="";        
          _passwordController.text="";
        });
      
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://img.freepik.com/free-photo/anime-style-clouds_23-2151071749.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          // Login form with glass effect
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: 350,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Anime',
                            style: TextStyle(color: Colors.black.withOpacity(0.75),
                                fontWeight: FontWeight.bold, fontSize: 35),
                          ),
                          Text(
                            'Plus',
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.blue.withOpacity(0.6),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                     Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            controller: _emailController,
                            style: TextStyle(color:col),
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              // hintText: "Email",
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: _passwordController,
                            style: TextStyle(color:col),
                            onChanged: (value){
                              if(_emailController.text=="" && _passwordController.text==""){
                                setState(() {col=Colors.black; }); 
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Password',                              
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                            obscureText: !_passwordVisible,
                            validator: (value) {
                              // _passwordController.text = 'Mvikas@123';
                              // final passwordRegex = RegExp(
                              //     r'^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[@$!%?&_])[A-Za-z\d@$!%?&_]{8,}$');
                              // if (value == null || value.isEmpty) {
                              //   return 'Please enter your password';
                              // } else if (value.length < 8) {
                              //   return 'Password must be at least 8 characters long';
                              // }// else if (passwordRegex
                              // //     .hasMatch(_passwordController.text)) {
                              // //   return 'password must have';
                              // // } 
                              // else if (value != _passwordController.text) {
                              //   return 'Passwords do not match';
                              // }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          Padding(
                            // padding: const EdgeInsets.only(left: (wid/2)-30),
                            padding: const EdgeInsets.only(left: 60),
                            child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              LoginPage(),
                                        ));
                                  },
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      fontSize: 17,
                                      decoration: TextDecoration.underline,
                                      color: Color.fromARGB(255, 33, 79, 243),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 2.0),
                          Container(
                            height: 50,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: _login,
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 17.5, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                    const Text(
                    'Or',
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: SizedBox(
                      width: 375,
                      child: TextButton(
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.google,
                                size: 30,
                                color: Colors.black,
                              ),
                              SizedBox(width: 22),
                              Text(
                                'Login with Google',
                                style: TextStyle(
                                    fontSize: 22.5, color: Colors.black),
                              ),
                              SizedBox(width: 20),
                            ],
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: SizedBox(
                      width: 375,
                      child: TextButton(
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.facebook,
                                size: 35,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 20),
                              Text(
                                'Login with FaceBook',
                                style: TextStyle(
                                    fontSize: 22.5, color: Colors.black),
                              ),
                            ],
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: SizedBox(
                      width: 375,
                      child: TextButton(
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.xTwitter,
                                size: 30,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              SizedBox(width: 20),
                              Text(
                                'Login with Twitter',
                                style: TextStyle(
                                    fontSize: 22.5, color: Colors.black),
                              ),
                              SizedBox(width: 10),
                            ],
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: SizedBox(
                      width: 375,
                      child: TextButton(
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.apple,
                                size: 33,
                                color: Colors.black,
                              ),
                              SizedBox(width: 20),
                              Text(
                                'Login with Apple',
                                style: TextStyle(
                                    fontSize: 22.5, color: Colors.black),
                              ),
                              SizedBox(width: 20),
                            ],
                          )),
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