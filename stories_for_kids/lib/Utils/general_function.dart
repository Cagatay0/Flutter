import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stories_for_kids/Utils/constants.dart';

class GeneralFunction {
  getStoryList() async {
    await FirebaseFirestore.instance.collection('Story').get().then((value) {
      for (var element in value.docs) {
        storyList.addAll([element]);
      }
    });
  }
}
