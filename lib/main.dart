import 'package:fido_mingle/api_services/logic.dart';
import 'package:fido_mingle/controller/general_controller.dart';
import 'package:fido_mingle/modules/document_uploader_and_reminder/view.dart';
import 'package:fido_mingle/route_generator.dart';
import 'package:fido_mingle/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  Get.put(GeneralController());
  Get.put(ApiLogic());
  runApp(const InitClass());
}

class InitClass extends StatefulWidget {
  const InitClass({Key? key}) : super(key: key);

  @override
  _InitClassState createState() => _InitClassState();
}

class _InitClassState extends State<InitClass> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // home: const DocumentUploaderAndReminderPage(),
      initialRoute: PageRoutes.splash,
      getPages: routes(),
      themeMode: ThemeMode.light,
      theme: lightTheme(),
    );
  }
}
