import 'dart:ffi';

import 'package:baseapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:convert';
import 'dart:io';

class GetAppVersion {
  // Future<void> checkForUpdates() async {
  //   // final currentVersion = await VersionService.getCurrentVersion();
  //   // final latestVersionData = await _apiService.fetchLatestVersion();
  //   //
  //   // final latestVersion = latestVersionData['version'];
  //   // final forceUpdate = latestVersionData['forceUpdate'];
  //   // final updateUrl = latestVersionData['updateUrl'];
  //   //
  //   // if (currentVersion != latestVersion) {
  //   //   _showUpdateDialog(context, forceUpdate, updateUrl);
  //   // }
  //
  //   Map<String, dynamic> versionResponseData = {
  //     "android": {
  //       "latest_version_name": "1.0.0",
  //       "latest_version_code": 11,
  //       "min_required_version_name": "1.0.0",
  //       "min_required_version_code": 10,
  //       "force_update": false,
  //       "show_warning": false,
  //       "update_url":
  //           "https://play.google.com/store/apps/details?id=com.formfree.enroll"
  //     },
  //     "ios": {
  //       "latest_version_name": " 22.0.4",
  //       "latest_version_code": "22.0.4",
  //       "min_required_version_name": " 0.0.9",
  //       "min_required_version_code": "22.0.4",
  //       "force_update": true,
  //       "show_warning": true,
  //       "update_url": "https://apps.apple.com/us/app/passport/id1579373499"
  //     }
  //   };
  //   String serverAppLatestVersionCode = "";
  //   String serverAppMinVersionCode = "";
  //   String serverStoreUrl = "";
  //   bool forceUpdate = false;
  //   bool showWarning = false;
  //
  //   if (Platform.isAndroid) {
  //     serverAppLatestVersionCode =
  //         versionResponseData['android']['latest_version_code'];
  //     serverAppMinVersionCode =
  //         versionResponseData['android']['min_required_version_name'];
  //     forceUpdate = versionResponseData['android']['force_update'];
  //     showWarning = versionResponseData['android']['show_warning'];
  //     serverStoreUrl = versionResponseData['android']['update_url'];
  //   } else if (Platform.isIOS) {
  //     print(
  //         "latestVersionCode ${versionResponseData['ios']['latest_version_code']}");
  //
  //     serverAppLatestVersionCode =
  //         versionResponseData['ios']['latest_version_code'];
  //     serverAppMinVersionCode =
  //         versionResponseData['ios']['min_required_version_name'];
  //     forceUpdate = versionResponseData['ios']['force_update'];
  //     showWarning = versionResponseData['ios']['show_warning'];
  //     serverStoreUrl = versionResponseData['ios']['update_url'];
  //   }
  //
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   if (Platform.isAndroid) {
  //     String buildNumberAndroid = packageInfo.buildNumber;
  //     print("buildNumberAndroid ${buildNumberAndroid}");
  //   } else if (Platform.isIOS) {
  //     String versionNumberiOS = packageInfo.version;
  //     print("versionNumberiOS ${versionNumberiOS}");
  //     print("serverAppLatestVersionCode ${serverAppLatestVersionCode}");
  //     print("serverAppMinVersionCode ${serverAppMinVersionCode}");
  //     print("update forceUpdate${forceUpdate}");
  //     print("update showWarning${showWarning}");
  //
  //     if (forceUpdate) {
  //       // Force update required for when latest version < minimum supportable version
  //       if (versionNumberiOS.compareTo(serverAppMinVersionCode) < 0) {
  //         // isForceUpdate = true;
  //         print("update force");
  //         // alertDialogForForceUpdate(serverStoreUrl);
  //       }else{
  //         print("update force else");
  //
  //       }
  //     } else if (showWarning) {
  //       // Warning required when current version < latest version
  //       if (versionNumberiOS.compareTo(serverAppLatestVersionCode) < 0) {
  //         print("update waring");
  //         // alertDialogForLatestBuild(serverStoreUrl);
  //       }
  //     }
  //   }
  // }

  Future<void> checkForUpdates(VoidCallback callbackStatus) async {
    //*****   Here we can call master data api for get app version,under maintenance etc value *******
    Map<String, dynamic> versionResponseData = {
      "android": {
        "latest_version_code": "3",
        "force_update": false,
        // true - force update App , false - normal update
        "under_maintenance": false,
        "update_url": "https://play.google.com/store/"
      },
      "ios": {
        "latest_version_code": "1.0.0",
        "force_update": false,
        // true - force update App , false - normal update
        "under_maintenance": false,
        "update_url": "https://apps.apple.com/us/app/"
      }
    };
    String serverAppLatestVersionCode = "";
    String serverStoreUrl = "";
    bool forceUpdate = false;
    bool underMaintenance = false;

    if (Platform.isAndroid) {
      serverAppLatestVersionCode =
          versionResponseData['android']['latest_version_code'];
      forceUpdate = versionResponseData['android']['force_update'];
      serverStoreUrl = versionResponseData['android']['update_url'];
      underMaintenance = versionResponseData['android']['under_maintenance'];
    } else if (Platform.isIOS) {
      serverAppLatestVersionCode =
          versionResponseData['ios']['latest_version_code'];
      forceUpdate = versionResponseData['ios']['force_update'];
      serverStoreUrl = versionResponseData['ios']['update_url'];
      underMaintenance = versionResponseData['ios']['under_maintenance'];
    }

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String versionNumber = "";
    if (Platform.isAndroid) {
      versionNumber = packageInfo.buildNumber;
      if (underMaintenance) {
        //Show maintenance alert
        Utils.showDialog(
            "Alert", "App in under maintenance", "Ok", callbackStatus);
      } else if (forceUpdate == true) {
        // force update
        if (int.parse(versionNumber) < int.parse(serverAppLatestVersionCode)) {
          Utils.showDialog("Alert", "Force update", "Update", callbackStatus);
        } else {
          callbackStatus();
        }
      } else if (forceUpdate == false) {
        // normal update
        if (int.parse(versionNumber) < int.parse(serverAppLatestVersionCode)) {
          Utils.showDialog("Alert", "Normal update", "Ok", callbackStatus);
        } else {
          callbackStatus();
        }
      }
    } else if (Platform.isIOS) {
      versionNumber = packageInfo.version;
      if (underMaintenance) {
        //Show maintenance alert
        Utils.showDialog(
            "Alert", "App in under maintenance", "Ok", callbackStatus);
      } else if (forceUpdate == true) {
        // force update
        if (versionNumber.compareTo(serverAppLatestVersionCode) < 0) {
          Utils.showDialog("Alert", "Force update", "Update", callbackStatus);
        } else {
          callbackStatus();
        }
      } else if (forceUpdate == false) {
        // normal update
        if (versionNumber.compareTo(serverAppLatestVersionCode) < 0) {
          Utils.showDialog("Alert", "Normal update", "Ok", callbackStatus);
        } else {
          callbackStatus();
        }
      }
    }
  }
}
