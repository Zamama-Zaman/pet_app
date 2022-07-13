import 'package:fido_mingle/modules/activities/view.dart';
import 'package:fido_mingle/modules/cat_chat/view.dart';
import 'package:fido_mingle/modules/document_uploader_and_reminder/view.dart';
import 'package:fido_mingle/modules/document_uploader_and_reminder/view_add_new_document.dart';
import 'package:fido_mingle/modules/document_uploader_and_reminder/view_email_to_vender.dart';
import 'package:fido_mingle/modules/dog_blog/view.dart';
import 'package:fido_mingle/modules/exotic_talk/view.dart';
import 'package:fido_mingle/modules/home/view.dart';
import 'package:fido_mingle/modules/home/view_add_comment.dart';
import 'package:fido_mingle/modules/home/view_reply_comment.dart';
import 'package:fido_mingle/modules/home/view_show_comments.dart';
import 'package:fido_mingle/modules/locate_members/view.dart';
import 'package:fido_mingle/modules/locate_members/view_member_detail.dart';
import 'package:fido_mingle/modules/login/view.dart';
import 'package:fido_mingle/modules/messags/view.dart';
import 'package:fido_mingle/modules/messags/view_chat.dart';
import 'package:fido_mingle/modules/reminder/view.dart';
import 'package:fido_mingle/modules/settings/about/view.dart';
import 'package:fido_mingle/modules/settings/user_profile/view.dart';
import 'package:fido_mingle/modules/settings/view.dart';
import 'package:fido_mingle/modules/sign_up/view.dart';
import 'package:fido_mingle/modules/splash/view.dart';
import 'package:fido_mingle/modules/vet_clinic/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

routes() => [
      GetPage(name: "/splash", page: () => const SplashPage()),
      GetPage(name: "/login", page: () => const LoginPage()),
      GetPage(name: "/signUp", page: () => const SignUpPage()),
      GetPage(name: "/home", page: () => const HomePage()),
      GetPage(
          name: "/addComment",
          page: () {
            AddCommentView addCommentView = Get.arguments;
            return addCommentView;
          },
          transition: Transition.downToUp),
      GetPage(
          name: "/allComments",
          page: () {
            AllCommentsView _allCommentsView = Get.arguments;
            return _allCommentsView;
          },
          transition: Transition.downToUp),
      GetPage(
          name: "/replyComment",
          page: () => const ReplyToCommentView(),
          transition: Transition.downToUp),
      GetPage(
          name: "/activities",
          page: () => const ActivitiesPage(),
          transition: Transition.fadeIn),
      GetPage(
          name: "/dogBlog",
          page: () => const DogBlogView(),
          transition: Transition.fadeIn),
      GetPage(
          name: "/catChat",
          page: () => const CatChatView(),
          transition: Transition.fadeIn),
      GetPage(
          name: "/exoticTalk",
          page: () => const ExoticTalkView(),
          transition: Transition.fadeIn),
      GetPage(
          name: "/vetClinic",
          page: () => const VetClinicView(),
          transition: Transition.fadeIn),
      GetPage(
          name: "/messages",
          page: () => const MessagesView(),
          transition: Transition.downToUp),
      GetPage(
          name: "/chat",
          page: () => const ChatView(),
          transition: Transition.downToUp),
      GetPage(
          name: "/settings",
          page: () => const SettingView(),
          transition: Transition.fadeIn),
      GetPage(
          name: "/aboutUs",
          page: () => const AboutUsPage(),
          transition: Transition.fadeIn),
      GetPage(
          name: "/userProfile",
          page: () => const UserProfilePage(),
          transition: Transition.fadeIn),
      GetPage(
          name: "/locateMembers",
          page: () => const LocateMembersPage(),
          transition: Transition.fadeIn),
      GetPage(
          name: "/memberDetail",
          page: () => const MemberDetailView(),
          transition: Transition.fadeIn),
      GetPage(
          name: "/documentUploaderAndReminder",
          page: () => const DocumentUploaderAndReminderPage(),
          transition: Transition.fadeIn),
      GetPage(
          name: "/reminder",
          page: () => const Reminder(),
          transition: Transition.fadeIn),
      GetPage(
          name: "/emailToVender",
          page: () => const EmailToVenderView(),
          transition: Transition.fadeIn),
      GetPage(
          name: "/addNewDocument",
          page: () => const AddNewDocumentView(),
          transition: Transition.fadeIn),
    ];

class PageRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String home = '/home';
  static const String addComment = '/addComment';
  static const String allComments = '/allComments';
  static const String replyComment = '/replyComment';
  static const String activities = '/activities';
  static const String dogBlog = '/dogBlog';
  static const String catChat = '/catChat';
  static const String exoticTalk = '/exoticTalk';
  static const String vetClinic = '/vetClinic';
  static const String messages = '/messages';
  static const String chat = '/chat';
  static const String settings = '/settings';
  static const String aboutUs = '/aboutUs';
  static const String userProfile = '/userProfile';
  static const String locateMembers = '/locateMembers';
  static const String memberDetail = '/memberDetail';
  static const String documentUploaderAndReminder =
      '/documentUploaderAndReminder';
  static const String reminder = '/reminder';
  static const String emailToVender = '/emailToVender';
  static const String addNewDocument = '/addNewDocument';

  // Map<String, WidgetBuilder> routes() {
  //   return {
  //     splash: (context) => const SplashPage(),
  //     login: (context) => const LoginPage(),
  //     signUp: (context) => const SignUpPage(),
  //     home: (context) => const HomePage(),
  //     addComment: (context) => const AddCommentView(),
  //     allComments: (context) => AllCommentsView(),
  //     replyComment: (context) => const ReplyToCommentView(),
  //     activities: (context) => const ActivitiesPage(),
  //     dogBlog: (context) => const DogBlogView(),
  //     catChat: (context) => const CatChatView(),
  //     exoticTalk: (context) => const ExoticTalkView(),
  //     vetClinic: (context) => const VetClinicView(),
  //     messages: (context) => const MessagesView(),
  //     chat: (context) => const ChatView(),
  //     settings: (context) => const SettingView(),
  //     aboutUs: (context) => const AboutUsPage(),
  //     userProfile: (context) => const UserProfilePage(),
  //     locateMembers: (context) => const LocateMembersPage(),
  //     memberDetail: (context) => const MemberDetailView(),
  //     documentUploaderAndReminder: (context) =>
  //         const DocumentUploaderAndReminderPage(),
  //     emailToVender: (context) => const EmailToVenderView(),
  //     addNewDocument: (context) => const AddNewDocumentView(),
  //   };
  // }
}
