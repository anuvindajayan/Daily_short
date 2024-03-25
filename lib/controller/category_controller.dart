import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapplication/modal/newsmodal.dart';
import 'package:http/http.dart' as http;

class CategoryController extends ChangeNotifier {
  List<String> categorylist = [
    "Bussiness",
    "Entertainment",
    "Genaral",
    "Health",
    "Science",
    "Sports",
    "Technology"
  ];
  String category = "bussiness";

  onTap({required index}) {
    category = categorylist[index].toLowerCase();
    fetchData();
    print(category);
    notifyListeners();
  }

  late NewsModal newsModal;
  bool isLoading = false;

  void fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=8a94cb5454a545ac927e350fbf901a1f");
    print(category);
    final responce = await http.get(url);
    print(responce.statusCode);
    Map<String, dynamic> decodedData = {};
    if (responce.statusCode == 200) {
      decodedData = jsonDecode(responce.body);
    } else {
      print("Api failed");
    }
    newsModal = NewsModal.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
}
