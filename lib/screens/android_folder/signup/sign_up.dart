import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/screens/android_folder/login/android_login_screen.dart';
import 'package:instagram_clone/resurces/auth_methods.dart';
import 'package:instagram_clone/utils/utils.dart';
import '';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  Uint8List? _image;
  //bool _isLoading =  false;

  void disposs() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  Future<void> selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    /*setState(() {
      _isLoading = true;
    });*/
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: _image!
    );

    if (res != 'success' ) {
      showSnackBar(res, context);
    }else{}

    /*setState(() {
      _isLoading = false;
    });*/

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: const Text(
                      'Instagram',
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Satisfy'),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(_image!),
                              )
                            : CircleAvatar(
                                radius: 64,
                                backgroundImage:
                                    AssetImage('assets/defaultProfilePic.jpg'),
                              ),
                        Positioned(
                            bottom: -10,
                            left: 85,
                            child: IconButton(
                              onPressed: selectImage,
                              icon: Icon(Icons.add_a_photo),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                      controller: _usernameController,
                      obscureText: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black12,
                        hintText: 'Enter User Name',
                        border: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context)),
                      )),
                  SizedBox(height: 20),
                  TextFormField(
                      controller: _emailController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Email',
                        filled: true,
                        fillColor: Colors.black12,
                        border: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context)),
                      )),
                  SizedBox(height: 20),
                  TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black12,
                        hintText: 'Enter Password',
                        border: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context)),
                      )),
                  SizedBox(height: 20),
                  TextFormField(
                      controller: _bioController,
                      obscureText: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black12,
                        hintText: 'Enter Bio details',
                        border: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context)),
                      )),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    child: Flexible(
                      child: ElevatedButton(
                          onPressed: signUpUser,
                          child: /*_isLoading
                              ? Center(child: CircularProgressIndicator(color: Colors.white,),)
                          :*/ Text('Sign up',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.lightBlue))),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Already have an account?  ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: 'Login.',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return MobileScreenLayout();
                              }));
                            })
                    ])),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
