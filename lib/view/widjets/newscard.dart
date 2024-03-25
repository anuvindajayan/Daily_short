import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../controller/home_screen_controller.dart';
import 'news_details_screen.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.imageUrl,
    required this.contant,
    required this.sourceName,
    required this.url});

  final String title;
  final String description;
  final DateTime? date;
  final String imageUrl;
  final String contant;
  final String sourceName;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailsScreen(
              title: title,
              description: description,
              imageUrl: imageUrl,
              date: date,
              contant: contant,
              sourceName: sourceName,
              url: url,
            ),
          ));
    },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "$sourceName | ${DateFormat('dd/MM/yyyy')
                            .format(date!)
                            .toString() ?? ""}"),
                    IconButton(onPressed: () {
                      String newsToShare = "$title \n \n $description \n \n $url";
                      Provider.of<HomeScreenController>(context, listen: false)
                          .shareText(textToShare: newsToShare);
                    }, icon: Icon(Icons.share))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
