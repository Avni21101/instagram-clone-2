import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../screens/mobilescreen_homepage.dart';
class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {

  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: const Text(
                'Instagram',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Satisfy'
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: _emailcontroller,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.black12,
                hintText: 'Phone number, email or username',
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordcontroller,
              obscureText: _obsecureText,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: (){setState(() {
                      _obsecureText =! _obsecureText;
                    });},
                    icon: Icon(_obsecureText ? Icons.visibility : Icons.visibility_off)),
                filled: true,
                fillColor: Colors.black12,
                hintText: 'Password',
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
              onPressed: () {
                var _email = _emailcontroller.text;
                var _password = _passwordcontroller.text;
                if (_email=='abc@gmail.com' && _password == '123@xyz'){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (BuildContext context){return Home();} ,),
                          (route) => false);
                }
              },
              child: Text('Log in',style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 20),
            Center(
              child: RichText(text:TextSpan(
                  children: [
                    TextSpan(
                        text: 'Forget your login details?  ',
                        style: TextStyle(color: Colors.black)
                    ),
                    TextSpan(
                        text: 'get help loggin in.',
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap = (){print('get help logging in');}
                    )
                  ]
              ) ),
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(height: 70, thickness: 3),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text('OR',style: TextStyle(fontSize: 20),),
                ),
                Expanded(
                  child: Divider(height: 70, thickness: 3),
                ),
              ],
            ),
            Center(
              child: RichText(text: TextSpan(
                  text: 'Log in with Facebook',
                  style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 15),
                  recognizer: TapGestureRecognizer()..onTap = (){print('Log in with facebook');}
              )
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: RichText(text:TextSpan(
                  children: [
                    TextSpan(
                        text: 'Don\'t have an account?  ',
                        style: TextStyle(color: Colors.black)
                    ),
                    TextSpan(
                        text: 'Sign up.',
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap = (){print('sign up');}
                    )
                  ]
              ) ),
            )
          ],
        ),
      ),
    );
  }
}