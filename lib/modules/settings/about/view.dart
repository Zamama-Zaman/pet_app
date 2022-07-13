import 'package:fido_mingle/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  final AboutLogic logic = Get.put(AboutLogic());
  final AboutState state = Get.find<AboutLogic>().state;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutLogic>(
      builder: (_aboutUsLogic) => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: const MyCustomAppBar(
            title: 'About',
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView(children: [
                  Text(
                    'Fidomingle is a group based out of\nthe San Diego area.',
                    textAlign: TextAlign.center,
                    style: state.titleTextStyle,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Fall is here!\nAnd all through October you’re seeing pumpkins.'
                    '\n\nWhile throwing together some of those favorite pumpkin pie recipes, or making plans for your pumpkin carving,  here’s some food for thought….'
                    '\n\nPumpkins are not just for carving, they are said to be a kind of superfood with great health benefits.'
                    '\n\nGreat health benefits for both you and your pet.'
                    '\n\nYes, pumpkin is very safe for pets.  Although whenever adding anything new to your pets diet it is always best to introduce it in small amounts.'
                    '\n\nTo also check with your veterinarian as to how much would be good for your pet, and if it’s beneficial with any condition your pet may currently have. A good balanced diet is key to good health, too much of anything is never good.'
                    '\n** NEVER give Halloween pumpkin that was left out as it may contain mold and or bacteria.'
                    '\n** Always give fresh cooked pumpkin or canned organic (with no sugar, spice, or additives) Canned is always easier with less mess, but not canned pumpkin pie filling as it may have added sweeteners.',
                    textAlign: TextAlign.start,
                    style: state.valueTextStyle,
                  ),
                ])),
          ),
        ),
      ),
    );
  }
}
