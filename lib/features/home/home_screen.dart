import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Text(LocaleKey.screensHomeTitle.tr()),
      ),
    );
  }
}
