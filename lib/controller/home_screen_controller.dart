import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapplication/modal/newsmodal.dart';
import 'package:http/http.dart ' as http;
import 'package:share_plus/share_plus.dart';

class HomeScreenController extends ChangeNotifier {
  late NewsModal newsmodal;
  bool isLoading = false;

  fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=8a94cb5454a545ac927e350fbf901a1f");
    final responce = await http.get(url);
    print(responce.statusCode);

    Map<String, dynamic> decodedData = {};
    if (responce.statusCode == 200) {
      decodedData= jsonDecode(responce.body);
    } else {
      print("api failed");
    }
    newsmodal=NewsModal.fromJson(decodedData);
    isLoading=false;
    notifyListeners();
  }
  void shareText({String textToShare = ""}) {
    try {
      Share.share(textToShare);
    } catch (e) {
      print('Error sharing: $e');
    }
    notifyListeners();
  }
}
