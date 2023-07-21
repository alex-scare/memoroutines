import 'package:flutter/material.dart';
import 'package:memoroutines/features/home/widgets/repetitions_list.dart';
import 'package:memoroutines/shared/components/custom_app_bar.dart';
import 'package:memoroutines/shared/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleWidget: Text(
          'Today',
          style: context.texts.titleLarge!
              .copyWith(fontFamily: context.alterFont.fontFamily),
        ),
      ),
      body: const Column(
        children: [RepetitionsList()],
      ),
    );
  }
}
