import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:ulearning_app/common/service/storage_service.dart';

class Global {
  static late StorageService storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    Platform.isAndroid
        ? await Firebase.initializeApp(
            options: const FirebaseOptions(
              apiKey: "AIzaSyAGGRIrCafoXEKiOtJUOZvBNwdXtYJoKlo",
              appId: "1:517622384852:android:f2c0ba09df20c13a30d341",
              messagingSenderId: "517622384852",
              projectId: "ulearning-app-db2ccs",
            ),
          )
        : await Firebase.initializeApp();

    storageService = await StorageService().init();
  }
}
