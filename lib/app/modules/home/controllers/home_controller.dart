import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:rushd/app/data/models/audiobook_model.dart';

class HomeController extends GetxController {
  var audiobooks = RxList<Audiobook>();
  getaudiobooks() async {
    var collection =
        await FirebaseFirestore.instance.collection("audiobooks").get();
    for (var element in collection.docs) {
      audiobooks.add(Audiobook.fromFirebaseJson(element));
      print(jsonEncode(element.data()));
      log(jsonEncode(element.data()));
    }
  }

  @override
  void onInit() async {
    await getaudiobooks();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}