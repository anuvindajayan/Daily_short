import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapplication/modal/newsmodal.dart';
import 'package:http/http.dart' as http;

class SearchScreenController extends ChangeNotifier {
  bool isLoading = false;
   NewsModal? newsModal;

  void SearchData({required String searchlist}) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$searchlist&apiKey=8a94cb5454a545ac927e350fbf901a1f");
    print(searchlist);
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
