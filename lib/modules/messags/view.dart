import 'package:fido_mingle/route_generator.dart';
import 'package:fido_mingle/utils/colors.dart';
import 'package:fido_mingle/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import 'logic.dart';
import 'state.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({Key? key}) : super(key: key);

  @override
  _MessagesViewState createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  final MessagsLogic logic = Get.put(MessagsLogic());
  final MessagsState state = Get.find<MessagsLogic>().state;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessagsLogic>(
      builder: (_messagesLogic) => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: const MyCustomAppBar(
            title: 'Messages',
          ),
          body: Constant.isUseWebside
              ? const Center(
                  child: Text(
                    "For this function use website",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: List.generate(12, (index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(15, 18, 15, 0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: customGreyColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                              child: ListTile(
                                onTap: () {
                                  Get.toNamed(PageRoutes.chat);
                                },
                                contentPadding:
                                    const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                leading: const CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 30,
                                ),
                                title: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Lisa Minnick',
                                        maxLines: 1,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: state.titleTextStyle,
                                      ),
                                    ),
                                    Text(
                                      '25 Oct 2021  5:44 pm',
                                      maxLines: 1,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: state.dateTimeTextStyle,
                                    ),
                                  ],
                                ),
                                subtitle: Row(
                                  children: [
                                    Text(
                                      'Fidomingle is a group...',
                                      maxLines: 1,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: state.subTitleTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      );
                    }),
                  )),
        ),
      ),
    );
  }
}
