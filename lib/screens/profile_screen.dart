import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_clone/screens/profile_appbar.dart';
import 'package:instagram_clone/screens/profile_tabbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: ProfileAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/MrBillu.jpg'),
                      radius: 45,
                    ),
                    BuildColumn(5, 'Posts'),
                    BuildColumn(12453, 'Followers'),
                    BuildColumn(13120, 'Followings')
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Container(
                  alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mr Billy Orange',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text('Whisker-tastic & Purr-fectly Orange 🧡'),
                        Text('Professional Napper 😴'),
                        Text('Master of Mischief 😼'),
                        Text('Tuna Enthusiast 🐟 #OrangeCatVibes'),
                      ],
                    )
                ),
              ),
             SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.only(top: 5),
               child: Container(
                 child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       ElevatedButton(
                         style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.grey)),
                           onPressed: (){},
                           child: Text('Edit Profile',style: TextStyle(color: Colors.black),)
                       ),
                       ElevatedButton(
                           style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.grey)),
                           onPressed: (){},
                           child: Text('Share Profile',style: TextStyle(color: Colors.black),)
                       )
                     ],
                   ),
               ),
             ),
              SizedBox(height: 10,),
              TabBar(tabs: [
                Tab(icon: Icon(Icons.grid_on)),
                Tab(icon: Icon(Icons.movie_outlined)),
                Tab(icon: Icon(CupertinoIcons.profile_circled))
              ],
                indicatorColor: Colors.black,
                labelColor: Colors.black,
              ),
              Expanded(
                child: TabBarView(children:[
                  GridViewWidget(),
                  Container(child: Center(child: Text('Rills',style: TextStyle(fontSize: 30),)),),
                  Container(child: Center(child: Text('tags',style: TextStyle(fontSize: 30)),))
                ]

                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}
Column BuildColumn(int num,String label){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        num.toString(),
        style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)
      ),
      Text(
        label,
      style: TextStyle(fontSize: 15,color: Colors.black54),)
    ],
  );
}

