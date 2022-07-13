import 'package:fido_mingle/modules/home/logic.dart';
import 'package:fido_mingle/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCustomDrawer extends StatefulWidget {
  const MyCustomDrawer({Key? key}) : super(key: key);

  @override
  _MyCustomDrawerState createState() => _MyCustomDrawerState();
}

class _MyCustomDrawerState extends State<MyCustomDrawer> {
  final state = Get.find<HomeLogic>().state;

  @override
  void initState() {
    super.initState();
    // Add code after super
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(
      builder: (_homeLogic) => SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          child: Drawer(
            child: Material(
              color: customThemeColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration:
                        const BoxDecoration(color: customDrawerYellowColor),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Menu',
                            style: state.drawerHeadingTextStyle,
                            // style: _homeLogic.state.drawerHeadingTextStyle,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView(
                      children:
                          List.generate(_homeLogic.drawerList.length, (index) {
                        return InkWell(
                          onTap: () {
                            _homeLogic.drawerNavigation(index, context);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  '${_homeLogic.drawerList[index]}',
                                  style: state.drawerTitleTextStyle,
                                ),
                              ),
                              index == _homeLogic.drawerList.length - 1
                                  ? const SizedBox(
                                      height: 10,
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 0, 15, 0),
                                      child: Container(
                                        height: .5,
                                        width: double.infinity,
                                        color: Colors.white38,
                                      ),
                                    )
                            ],
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
