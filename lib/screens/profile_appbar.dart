import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(75);
}
class _ProfileAppBarState extends State<ProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.lock,size: 17,),
            Text(' Mr_Billu01',style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),),
            Icon(Icons.arrow_drop_down_outlined,size: 30),
            Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Material(
                    child: InkWell(
                      onTap: (){},
                      child: Icon(CupertinoIcons.plus_app,size: 30,),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
      endDrawer : Drawer(),
    );
  }
}
