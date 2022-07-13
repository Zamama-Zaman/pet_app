import 'package:fido_mingle/api_services/logic.dart';
import 'package:fido_mingle/route_generator.dart';
import 'package:fido_mingle/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  final SettingsLogic logic = Get.put(SettingsLogic());
  final SettingsState state = Get.find<SettingsLogic>().state;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsLogic>(
      builder: (_settingsLogic) => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: const MyCustomAppBar(
            title: 'Settings',
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(PageRoutes.userProfile);
                  },
                  title: Text(
                    'User Profile',
                    style: state.titleTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Divider(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(PageRoutes.aboutUs);
                  },
                  title: Text(
                    'About',
                    style: state.titleTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Divider(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                ListTile(
                  onTap: () {
                    // Get.back();
                    Get.find<ApiLogic>().storageBox.erase();
                    Get.toNamed(PageRoutes.login);
                  },
                  title: Text(
                    'Logout',
                    style: state.titleTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
