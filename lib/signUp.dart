import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tasks/popUp.dart';

class SignupandLoginPage extends StatelessWidget {
  const SignupandLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black,
        body: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.2,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/images/design2.jpg')),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.43),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Poppage(),
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const SignupForm(),
                //   ),
                // );
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
            )
          ],
        ));
  }
}

// class SignupForm extends StatefulWidget {
//   const SignupForm({super.key});

//   @override
//   State<SignupForm> createState() => _SignupFormState();
// }
// int size = 4;
// class _SignupFormState extends State<SignupForm> {
  
//   final List<TextEditingController> _controllers =
//       List.generate(size, (_) => TextEditingController());
//   final List<FocusNode> focusNodes = List.generate(size, () => FocusNode());
//   final List<bool> isFocused = List.generate(size, () => false);
//   List<String> text2 = ['User Name','Email', 'Password', 'Confirm Password'];
//   List<String> text1 = ['Enter User_Name','Enter Email', 'Enter Password', 'Re-Enter Password'];
//   String User_name='',Email = '', Password = '', Password1 = '';

//   void _signUp() async {
//     User_name = _controllers[0].text;
//     Email = _controllers[1].text;
//     Password = _controllers[2].text;
//     Password1 = _controllers[2].text;
//     if (Email == '' || Password == '' || Password1 == '') {
//       _showDialog('Please fill all the fields');
//       return;
//     }
//     else if (Password1.length < 8) {
//       _showDialog('Password should be at least 8 characters long');
//       return;
//     }
//     else if (Password != Password1) {
//       _showDialog('Passwords do not match');
//       return;
//     }
    
//     else if (!validateEmail(Email)) {
//       _showDialog('Invalid email format');
//       return;
//     }
//     else if (!validatePassword(Password)) {}
//     try {
//       final response = await http.post(
//         Uri.parse('http://10.16.55.110:3000/data'),
//         body: json.encode({
//           'email': Email,
//           'password': Password,
//         }),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );
//       if (response.statusCode == 200) {
//         setState(() {
//           _showDialog(response.body);
//           for (int i = 0; i < 3; i++) {
//             _controllers[i].clear();
//             _focusNodes[i].unfocus();
//             _isFocused[i] = false;
//           }
//           // Navigator.push(context,MaterialPageRoute(builder:
//           // (context) => myNavigationBar(),
//           // ));
//         });
//       } else {
//         _showDialog('Failed to register user');
//         for (int i = 0; i < 3; i++) {
//           _controllers[i].clear();
//           _focusNodes[i].unfocus();
//           _isFocused[i] = false;
//         }
//       }
//     } catch (e) {
//       _showDialog('An error occurred: $e\n');
//     }
//   }

//   void _showDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Sign Up'),
//           content: Text(message),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('OK'),
//               onPressed: () {
//                 if (message == 'User Registered Successfully') {
//                   // Navigator.push(context, MaterialPageRoute(builder:
//                   // (context) => myNavigationBar(),
//                   // ));
//                 } else {
//                   Navigator.of(context).pop();
//                 }
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         for (var focusNode in _focusNodes) {
//           focusNode.unfocus();
//         }
//       },
//       child: Scaffold(
//         resizeToAvoidBottomInset: true,
//         backgroundColor: const Color.fromARGB(255, 43, 43, 206),
//         body: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height,
//                 decoration: const BoxDecoration(color: Colors.black),
//                 child: Column(
//                   children: <Widget>[
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height * 0.382,
//                       child: Column(
//                         children: [
//                           SizedBox(
//                               height: MediaQuery.sizeOf(context).height * 0.09),
//                           Center(
//                             child: Container(
//                               height: MediaQuery.sizeOf(context).height * 0.2,
//                               decoration: BoxDecoration(
//                                 image: const DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/design2.jpg')),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                               height: MediaQuery.sizeOf(context).height * 0.04),
//                           const Center(
//                             child: Text(
//                               'Hello,\nCreate Your Account',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 22.5,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Poppins',
//                                 letterSpacing: 1.5,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height * 0.618,
//                       decoration: const BoxDecoration(
//                         //color: Color.fromARGB(255, 30, 32, 33),
//                         color: Color.fromARGB(255, 48, 132, 211),
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(50),
//                             topRight: Radius.circular(50)),
//                       ),
//                       child: Column(
//                         children: <Widget>[
//                           SizedBox(
//                             height: MediaQuery.sizeOf(context).height * 0.04,
//                           ),
//                           const Text(
//                             'Sign Up',
//                             style: TextStyle(
//                               color: Colors.black,
//                               shadows: [
//                                 Shadow(
//                                   offset: Offset(2.0, 2.0),
//                                   blurRadius: 3.0,
//                                   color: Colors.blue,
//                                 ),
//                                 Shadow(
//                                   offset: Offset(-2.0, -2.0),
//                                   blurRadius: 3.0,
//                                   color:
//                                       Color.fromARGB(255, 227, 212, 229),
//                                 ),
//                               ],
//                               fontFamily: 'Poppins',
//                               fontSize: 60,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.sizeOf(context).height * 0.05,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 22, right: 22),
//                             child: Column(
//                               children: List.generate(size, (index) {
//                                 return Padding(
//                                   padding: const EdgeInsets.only(bottom: 16.0),
//                                   child: TextFormField(
//                                     controller: _controllers[index],
//                                     focusNode: _focusNodes[index],
//                                     decoration: InputDecoration(
//                                       labelText: text1[index],
//                                       alignLabelWithHint: true,
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: const BorderSide(
//                                             color: Color.fromARGB(255, 255, 255, 255),
//                                             width: 1.8),
//                                         borderRadius:
//                                             BorderRadius.circular(10.0),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: const BorderSide(
//                                             color: Color.fromARGB(
//                                                 255, 16, 199, 227),
//                                             width: 1.8),
//                                         borderRadius:
//                                             BorderRadius.circular(10.0),
//                                       ),
//                                     ),
//                                     obscureText: index > 1,
//                                   ),
//                                 );
//                               }),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 150),
//                             child: Row(
//                               children: [
//                                 const Text(
//                                   'Already an User?',
//                                   style: TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {},
//                                   child: const Text(
//                                     'Login',
//                                     style: TextStyle(
//                                       decoration: TextDecoration.underline,
//                                       color: Color.fromARGB(255, 33, 219, 243),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                               height:
//                                   MediaQuery.sizeOf(context).height * 0.015),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               InkWell(
//                                 onTap: () {
//                                   _signUp();
//                                 },
//                                 child: Container(
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.5,
//                                   height:
//                                       MediaQuery.of(context).size.height * 0.05,
//                                   decoration: BoxDecoration(
//                                     //color: Color.fromARGB(255, 145, 33, 243),
//                                     borderRadius: BorderRadius.circular(100),
//                                     gradient: const LinearGradient(
//                                       colors: [Color.fromARGB(255, 181, 154, 186),Color.fromARGB(255, 3, 142, 255),Color.fromARGB(255, 181, 154, 186)],
//                                       begin: Alignment.topLeft,
//                                       end: Alignment.centerRight,
//                                     ),
//                                   ),
//                                   child: const Center(
//                                     child: Text(
//                                       'Sign Up',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontFamily: 'Poppins',
//                                         fontSize: 20,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// bool validatePassword(String password) {
//   final passwordRegex = RegExp(
//       r'^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[@$!%?&_])[A-Za-z\d@$!%?&_]{8,}$');
//   return passwordRegex.hasMatch(password);
// }

// bool validateEmail(String email) {
//   final emailRegex =
//       RegExp(r'^[a-zA-Z0-9._%+-]+@gmail+\.com$', caseSensitive: false);
//   return emailRegex.hasMatch(email);
// }