import 'package:flutter/material.dart';

class ListCardsScreen extends StatelessWidget {
  ListCardsScreen({super.key});

  final List<String> titles = ['Sparrow', 'Elephant', 'Humming Bird', 'Lion'];

  final subtitles = [
    "Here is list 1 subtitle",
    "Here is list 2 subtitle",
    "Here is list 3 subtitle",
    "Here is list 4 subtitle"
  ];
  final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time, Icons.sports_bar];

final List<String> images = [
  'https://cdn.pixabay.com/photo/2021/06/01/07/03/sparrow-6300790_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/10/20/10/58/elephant-2870777_960_720.jpg',
  'https://cdn.pixabay.com/photo/2014/09/08/17/32/humming-bird-439364_960_720.jpg',
  'https://cdn.pixabay.com/photo/2018/05/03/22/34/lion-3372720_960_720.jpg'
];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: titles.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              clipBehavior: Clip.hardEdge,
              child: ListTile(
                  onTap: () {
                    /*
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('${titles[index]} pressed!'),
                    ));
                    */
                    debugPrint(titles[index]);
                  },
                  title: Text(titles[index]),
                  subtitle: Text(subtitles[index]),
                  /*
                  leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                          */
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          images[index])),
                  trailing: Icon(icons[index])));
        });
  }
}

/*
Widget card(String image, String title, BuildContext context) {
  return Card(
    color: Colors.yellow[50],
    elevation: 8.0,
    margin: const EdgeInsets.all(4.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.network(
            image,
            height: MediaQuery.of(context).size.width * (3 / 4),
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 38.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}
*/


