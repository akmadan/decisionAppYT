import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decisionlite/services/functions/authFunctions.dart';

saveDecision(Map pollsWeights, String title) async {
  await FirebaseFirestore.instance.collection('decisions').add({
    'pollWeights': pollsWeights,
    'uid': currUser!.uid,
    'usersWhoVoted': {},
    'title': title
  });
}
