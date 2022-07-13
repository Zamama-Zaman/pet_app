// ignore_for_file: prefer_const_constructors

import 'package:fido_mingle/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class Reminder extends StatefulWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  final GlobalKey<FormState> _emailToVenderFormKey = GlobalKey();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyCustomAppBar(
        title: 'Reminder',
      ),
      body: Center(
        child: Text("Reminder Page"),
      ),
    );
  }
}
