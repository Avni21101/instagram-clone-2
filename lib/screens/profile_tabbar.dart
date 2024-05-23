import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  GridViewWidget({super.key});

  List<Map<String, dynamic>> mediaItems = [
  {
  "id": "1",
  "imageUrl": "https://img.cutenesscdn.com/375/cme-data/getty/8619bd9f02594cbb9313424e29f38afa.jpg",
  },
  {
  "id": "2",
  "imageUrl": "https://img.freepik.com/premium-photo/there-is-cat-wearing-orange-jacket-white-ear-generative-ai_1028873-16975.jpg",
  },
  {
  "id": "3",
  "imageUrl": "https://i.pinimg.com/736x/fa/1f/ab/fa1fab5b95ead9f202258d6111f936b7.jpg",
  },
    {
      "id": "4",
      "imageUrl": "https://i.pinimg.com/736x/f7/2a/7d/f72a7d92fbeec47af0fee8dfbca294e7.jpg",
    },
    {
      "id": "4",
      "imageUrl": "https://img.freepik.com/premium-photo/cat-animal-renaissance-clothes-baroque-suit-closeup-portrait-past-era-fashionable-vintage-retro-style_888396-21163.jpg",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: mediaItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 2.0, mainAxisSpacing: 2.0),
        itemBuilder: (context, index) {
          var item = mediaItems[index];
          return Stack(
            children: [
              Image.network(
                "${item['imageUrl']}",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          );
        });
  }
}



