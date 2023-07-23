import 'package:flutter/material.dart';
import 'package:memoroutines/shared/components/custom_app_bar.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:styled_widget/styled_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Settings'),
      body: const Center(
        child: Text(
          'There will be your profile, \nyour data management \nand more soon',
          textAlign: TextAlign.center,
        ),
      ).padding(horizontal: Spacing.md),
    );
  }
}
