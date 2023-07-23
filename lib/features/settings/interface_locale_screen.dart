import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/settings/widgets/locale_list.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/components/custom_app_bar.dart';
import 'package:styled_widget/styled_widget.dart';

class InterfaceLocaleScreen extends HookConsumerWidget {
  const InterfaceLocaleScreen({super.key});

  @override
  Scaffold build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: LocaleKey.screensInterfaceLanguageTitle,
        showBackButton: true,
      ),
      body: SafeArea(
        child: LocalesList(
          list: context.supportedLocales,
          onTap: (lang) => context.setLocale(lang),
          current: context.locale,
        ),
      ).padding(horizontal: 16),
    );
  }
}
