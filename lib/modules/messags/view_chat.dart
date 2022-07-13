import 'package:bubble/bubble.dart';
import 'package:fido_mingle/modules/messags/logic.dart';
import 'package:fido_mingle/modules/messags/state.dart';
import 'package:fido_mingle/utils/colors.dart';
import 'package:fido_mingle/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final MessagsState state = Get.find<MessagsLogic>().state;
  TextEditingController sendMessageController = TextEditingController();
  final scrollController = ScrollController();

  bool showSender = false;
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
            title: 'Lisa Minnick',
          ),
          body: Stack(
            children: [
              ///---chat-area
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 80),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Wrap(
                    children: List.generate(20, (index) {
                      return index % 2 == 0
                          ? Bubble(
                              alignment: Alignment.centerLeft,
                              margin: const BubbleEdges.only(top: 19),
                              color: customPostBackgroundColor,
                              nip: BubbleNip.leftBottom,
                              radius: const Radius.circular(8),
                              child: Text(
                                'This is me, making my lemonade. $index',
                                style: state.messageTextTextStyle!
                                    .copyWith(color: Colors.black),
                              ),
                            )
                          : Bubble(
                              alignment: Alignment.centerRight,
                              margin: const BubbleEdges.only(top: 19),
                              color: customDrawerYellowColor,
                              nip: BubbleNip.rightBottom,
                              radius: const Radius.circular(8),
                              child: Text(
                                  'This is me, making my lemonade. $index',
                                  style: state.messageTextTextStyle),
                            );
                    }),
                  ),
                ),
              ),

              ///---typing-field
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                  child: TextFormField(
                    onTap: () {
                      scrollController.animateTo(
                        scrollController.position.maxScrollExtent,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 50),
                      );
                    },
                    style:
                        GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                    controller: sendMessageController,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 25),
                        fillColor: customPostBackgroundColor,
                        filled: true,
                        hintText: 'Write Message',
                        hintStyle: GoogleFonts.jost(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.2),
                            fontWeight: FontWeight.w400),
                        suffixIcon: showSender
                            ? const SizedBox()
                            : InkWell(
                                onTap: () async {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                      'assets/sendingIcon.svg'),
                                )),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                              color: customPostBackgroundColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                              color: customPostBackgroundColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                              color: customPostBackgroundColor),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
