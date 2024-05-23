import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      title: Row(
        children: [
          Text('Instagram',style: TextStyle(
              fontSize: 30,
              fontFamily: 'Satisfy',
              fontWeight: FontWeight.bold
          ),),
          SizedBox(width: 150),
          Padding(
            padding: EdgeInsets.only(right: 0),
            child: Material(
              child: InkWell(
                onTap: (){},
                child: Icon(CupertinoIcons.heart),
              ),
            ),
          ),
          SizedBox(width: 20,),
          Padding(
            padding: EdgeInsets.only(right: 0),
            child: Material(
              child: InkWell(
                onTap: (){},
                child: Icon(Icons.message_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}