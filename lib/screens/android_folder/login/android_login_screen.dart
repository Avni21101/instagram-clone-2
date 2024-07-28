import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/resurces/auth_methods.dart';
import 'package:instagram_clone/screens/android_folder/signup/sign_up.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/utils/utils.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      showSnackBar(res, context);
    }
  }

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
            const Center(
              child: Text(
                'Instagram',
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Satisfy'),
              ),
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: _emailController,
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
              controller: _passwordController,
              obscureText: _obsecureText,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obsecureText = !_obsecureText;
                      });
                    },
                    icon: Icon(_obsecureText
                        ? Icons.visibility
                        : Icons.visibility_off)),
                filled: true,
                fillColor: Colors.black12,
                hintText: 'Password',
                enabledBorder: const OutlineInputBorder(),
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.only(left: 10),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              onPressed: loginUser,
              /*{
                var _email = _emailcontroller.text;
                var _password = _passwordcontroller.text;
                if (_email=='abc@gmail.com' && _password == '123@xyz'){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (BuildContext context){return Home();} ,),
                          (route) => false);
                }
              },*/
              child: const Text(
                'Log in',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: 'Forget your login details?  ',
                    style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: 'get help loggin in.',
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('get help logging in');
                      })
              ])),
            ),
            Row(
              children: [
                const Expanded(
                  child: Divider(height: 70, thickness: 3),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'OR',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const Expanded(
                  child: Divider(height: 70, thickness: 3),
                ),
              ],
            ),
            Center(
              child: RichText(
                  text: TextSpan(
                      text: 'Log in with Facebook',
                      style: const TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Log in with facebook');
                        })),
            ),
            const SizedBox(height: 20),
            Center(
              child: RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: 'Don\'t have an account?  ',
                    style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: 'Sign up.',
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const SignUpScreen();
                        }));
                      })
              ])),
            )
          ],
        ),
      ),
    );
  }
}
