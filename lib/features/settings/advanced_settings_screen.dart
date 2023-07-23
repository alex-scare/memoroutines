import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memoroutines/features/settings/widgets/advances_settings_logs.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/components/custom_app_bar.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/theme.dart';

class AdvancedSettignsScreen extends StatelessWidget {
  const AdvancedSettignsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: LocaleKey.screensAdvancedSettingsTitle,
        showBackButton: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Spacing.md),
            Text(
              LocaleKey.screensAdvancedSettingsLogsTitle.tr(),
              style: context.texts.titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const AdvancedSettingsLogs(),
          ],
        ),
      ),
    );
  }
}
