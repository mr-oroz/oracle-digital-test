import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:oracle_digital/presentation/models/new_today_model.dart';
import 'package:oracle_digital/presentation/models/search_result_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseService {
  final FirebaseFirestore store = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  /// result person all images
  Future<List<NewTodayModel>> getImages() async {
    try {
      var collection = FirebaseFirestore.instance.collection('person_data');
      var querySnapshot = await collection.get();
      List<NewTodayModel> models = [];
      for (var doc in querySnapshot.docs) {
        // Создаем объект PersonDataModel из Map
        models.add(NewTodayModel.fromJson(doc.data()));
      }
      return models;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// result get all today images
  Future<List<NewTodayModel>> getNewToday() async {
    try {
      var collection =
          FirebaseFirestore.instance.collection('What’s new today');
      var querySnapshot = await collection.get();
      List<NewTodayModel> models = [];
      for (var doc in querySnapshot.docs) {
        models.add(NewTodayModel.fromJson(doc.data()));
      }
      return models;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// result get all images
  Future<List<NewTodayModel>> getAll() async {
    try {
      var collection = FirebaseFirestore.instance.collection('all');
      var querySnapshot = await collection.get();
      List<NewTodayModel> models = [];
      for (var doc in querySnapshot.docs) {
        models.add(NewTodayModel.fromJson(doc.data()));
      }
      return models;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// result search images
  Future<List<SearchResultModel>> getSearchAll(String searchTerm) async {
    try {
      var collection = FirebaseFirestore.instance.collection('search');
      var querySnapshot = await collection
          .where('title', isEqualTo: searchTerm.toLowerCase())
          .get();
      List<SearchResultModel> models = [];
      for (var doc in querySnapshot.docs) {
        models.add(SearchResultModel.fromJson(doc.data()));
      }
      return models;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // auth sign in
  Future<void> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  // auth register
  Future<String> register(String email, String password) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      String userId = user?.uid ?? "";
      await prefs.setString('isUserId', userId);
      return userId;
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<void> addDetailUserName(String userId, String login) async {
    try {
      CollectionReference users = store.collection('users');
      return users.doc(userId).set({
        'username': login,
      });
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }
}
