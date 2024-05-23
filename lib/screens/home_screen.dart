import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/post_card_1.dart';
import 'package:instagram_clone/screens/post_card_2.dart';
import 'package:instagram_clone/screens/post_card_3.dart';

import 'homescreen_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          PostCardOne(),
          PostCardTwo(),
          PostCardThree()
        ],
      ),
    );
  }
}




