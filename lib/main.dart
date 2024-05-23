import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/screens/spash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /*if(kIsWeb){
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCmt70lEHtPCAJXUpIfHGr90JeE3wRDKMY",
            appId: "1:116934423349:web:40ec19869e8909eca0d27c",
            messagingSenderId: "116934423349",
            projectId: "instgramui"
        )
    );
  }*/
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ResponsiveLayout(webScreenLayout: WebScreenLayout(),mobileScreenLayout: SplashScreen(),),
    );
  }
}
// hello world

