import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_store_app/utils/logging/logger.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManage extends GetxController {
  static NetworkManage get instance => Get.find();
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>>
      streamConnectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /// initialize the connection manager
  @override
  void onInit() {
    super.onInit();
    streamConnectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  /// update the connection on the basis of variations
  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    for (var result in results) {
      _connectionStatus.value = result;
    }
    if (_connectionStatus.value == ConnectivityResult.none) {
      LoggerHelper.warningSnakebar(title: "No internet connection");
    }
  }

  /// check for connectivity
  Future<bool> isConnected() async {
    try {
      final res = await _connectivity.checkConnectivity();
      if (res.first == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  /// Dispostion
  @override
  void onClose() {
    super.onClose();
    streamConnectivitySubscription.cancel();
  }
}
