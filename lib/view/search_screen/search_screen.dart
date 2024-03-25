import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapplication/controller/search_screen_controller.dart';
import 'package:newsapplication/view/widjets/newscard.dart';
import 'package:provider/provider.dart';

class Search_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController tController = TextEditingController();
    SearchScreenController provider =
        Provider.of<SearchScreenController>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0,left: 10,right: 10),
              child: SearchBar(hintText: "Search",
                controller: tController,
                onSubmitted: (result) {
                  provider.SearchData(searchlist: result.toLowerCase());
                },
              ),
            ),
            Expanded(child: Consumer<SearchScreenController>(
              builder: (context, SearchScreenController, child) {
                return provider.isLoading == true
                    ? Center(
                        child: LottieBuilder.asset(
                          "assets/animation/Animation - 1706982397782.json",
                          fit: BoxFit.cover,
                          height: 150,
                          width: 150,
                        ),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) => NewsCard(
                            title: SearchScreenController
                                    .newsModal?.articles?[index].title ??
                                "",
                            description: SearchScreenController
                                    .newsModal?.articles?[index].description ??
                                "",
                            date: SearchScreenController
                                .newsModal?.articles?[index].publishedAt,
                            imageUrl: SearchScreenController
                                    .newsModal?.articles?[index].urlToImage ??
                                "",
                            contant: SearchScreenController
                                    .newsModal?.articles?[index].content ??
                                "",
                            sourceName:
                                SearchScreenController.newsModal?.articles?[index].source.toString() ?? "",
                            url: SearchScreenController.newsModal?.articles?[index].url ?? ""),
                        separatorBuilder: (context, index) => Divider(
                              height: 10,
                            ),
                        itemCount: SearchScreenController.newsModal?.articles?.length ?? 0);
              },
            ))
          ],
        ),
      ),
    );
  }
}
