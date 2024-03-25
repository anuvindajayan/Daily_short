import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapplication/controller/home_screen_controller.dart';
import 'package:newsapplication/view/search_screen/search_screen.dart';
import 'package:newsapplication/view/widjets/newscard.dart';
import 'package:provider/provider.dart';

class Home_Screen extends StatefulWidget {
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  void initState() {
    fetchData();
  }

  void fetchData() async {
    Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    HomeScreenController provider = Provider.of<HomeScreenController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          children: [
            Container(decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Text(
                " DAILY ",
                style: GoogleFonts.robotoMono(
                    letterSpacing: 0,
                    color: Colors.red,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.red),
              child: Text(
                " SHORT📰 ",
                style: GoogleFonts.robotoMono(
                    letterSpacing: 0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Search_Screen()));
            },
          ),
        ],
      ),
      body: Provider
          .of<HomeScreenController>(context)
          .isLoading == true
          ? Center(
        child: LottieBuilder.asset(
          "assets/animation/Animation - 1706982397782.json",
          fit: BoxFit.cover,
          height: 150,
          width: 150,
        ),
      )
          : ListView.separated(
          itemBuilder: (context, index) =>
              NewsCard(
                  title: provider.newsmodal.articles?[index].title.toString() ??
                      "",
                  description: provider.newsmodal.articles?[index].description
                      .toString() ??
                      "",
                  date: provider.newsmodal.articles?[index].publishedAt,
                  imageUrl: provider.newsmodal.articles?[index].urlToImage
                      .toString() ??
                      "",
                  contant:
                  provider.newsmodal.articles?[index].content.toString() ??
                      "",
                  sourceName:
                  provider.newsmodal.articles?[index].source.toString() ??
                      "",
                  url:
                  provider.newsmodal.articles?[index].url.toString() ?? ""),
          separatorBuilder: (context, index) =>
              Divider(
                height: 20,
              ),
          itemCount: provider.newsmodal.articles?.length ??
              0
      )
      ,
    );
  }
}
