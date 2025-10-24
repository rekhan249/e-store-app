import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CloudHelper {
  /// To check the state of single database record
  static Widget? checkingSingleRecordState<T>(AsyncSnapshot<T> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }
    if (!snapshot.hasData || snapshot.data == null) {
      return Center(child: Text("Data not found"));
    }
    if (!snapshot.hasError) {
      return Center(child: Text("Something went wrong"));
    }
    return null;
  }

  /// To check the state of multiple list database record
  static Widget? checkingMultipleRecordState<T>(
      {required AsyncSnapshot<T> snapshot,
      Widget? loader,
      Widget? error,
      Widget? nothingFound}) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      if (loader != null) return loader;
      return Center(child: CircularProgressIndicator());
    }
    if (!snapshot.hasData || snapshot.data == null) {
      if (nothingFound != null) return nothingFound;
      return Center(child: Text("Data not found"));
    }
    if (!snapshot.hasError) {
      if (error != null) return error;
      return Center(child: Text("Something went wrong"));
    }
    return null;
  }

  /// Create a reference with initial file path and name with retrive download URL
  static Future<String> getURLFromFilePathAndName(String path) async {
    try {
      if (path.isEmpty) return "";
      return "";
    } on FirebaseException catch (e) {
      throw e.message!;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw "Something went wrong";
    }
  }
}
