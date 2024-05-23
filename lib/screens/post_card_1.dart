import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_clone/screens/profile_screen.dart';

class PostCardOne extends StatefulWidget {
  const PostCardOne({super.key});

  @override
  State<PostCardOne> createState() => _PostCardOneState();
}

class _PostCardOneState extends State<PostCardOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 6,horizontal: 10).copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/MrBillu.jpg')
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Text('Mr_Billu',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
              ],
            ),
          ),
          Container(color: Colors.blueGrey,
            height: MediaQuery.of(context).size.height*0.35,
            width: double.infinity,
            child: Image.asset('assets/billupic.jpg'),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.favorite,
                    color: Colors.red,
                  )
              ),
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.comment_outlined,
                  )
              ),
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.send,
                  )
              ),
              Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.bookmark_border),
                    ),
                  )
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('2,875 likes ', style: TextStyle(fontWeight: FontWeight.bold)),
                RichText(text: TextSpan(
                    children:[
                      TextSpan(
                          text: 'Mr_Billu   ',
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap=(){}
                      ),
                      TextSpan(
                        text: """How's my new glasses? Enjoying Sunday #sunday #CatClub #SunShine""" ,
                        style: TextStyle(color: Colors.black),
                      )
                    ]
                )
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text('View all 150 Comments'),
                  ),
                ),
                Container(
                  child: Text('1 Hour ago'),
                )
              ]
            ),
          ),
        ],
      ),
    );
  }
}
