import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';

import '../../controller/category_controller.dart';
import '../widjets/newscard.dart';

class Category_Screen extends StatefulWidget {
  const Category_Screen({super.key});

  @override
  State<Category_Screen> createState() => _Category_ScreenState();
}

class _Category_ScreenState extends State<Category_Screen> {
  void fetchData() async {
    Provider.of<CategoryController>(context, listen: false).fetchData();
  }

  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CategoryController provider = Provider.of<CategoryController>(context);
    return DefaultTabController(
      length: provider.categorylist.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(
              color: Color(0xffff1111),
              fontSize: 20,
              fontWeight: FontWeight.w600),
          title: const Text("Categories"),
          bottom: TabBar(
            labelStyle: const TextStyle(
                color: Color(0xffff1111), fontWeight: FontWeight.w600),
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xffff1111),
            indicatorPadding: EdgeInsets.symmetric(horizontal: 5),
            unselectedLabelStyle: const TextStyle(
                color: Color(0xffff1111),
                fontSize: 15,
                fontWeight: FontWeight.w500),
            overlayColor: MaterialStatePropertyAll(Colors.grey),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
                color: Color(0xffff1111),
                borderRadius: BorderRadius.circular(10)),
            isScrollable: true,
            tabs: List.generate(
              provider.categorylist.length,
              (index) => Tab(
                text: provider.categorylist[index],
              ),
            ),
            onTap: (value) {
              provider.onTap(index: value);
            },
          ),
        ),
        body: provider.isLoading == true
            ? Center(
                child: LottieBuilder.asset(
                "assets/animation/Animation - 1706982397782.json",
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              ))
            : Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.separated(
                    itemBuilder: (context, index) => NewsCard(
                          title: provider.newsModal.articles?[index].title
                                  .toString() ??
                              "",
                          description: provider
                                  .newsModal.articles?[index].description
                                  .toString() ??
                              "",
                          date: provider.newsModal.articles?[index].publishedAt,
                          imageUrl: provider
                                  .newsModal.articles?[index].urlToImage
                                  .toString() ??
                              "",
                          contant: provider.newsModal.articles?[index].content
                                  .toString() ??
                              "",
                          sourceName: provider
                                  .newsModal.articles?[index].source?.name
                                  .toString() ??
                              "",
                          url: provider.newsModal.articles?[index].url
                                  .toString() ??
                              "",
                        ),
                    separatorBuilder: (context, index) => const Divider(
                          height: 20,
                        ),
                    itemCount: provider.newsModal.articles?.length ?? 0),
              ),
      ),
    );
  }
}
