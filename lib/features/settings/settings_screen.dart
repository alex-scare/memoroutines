import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/components/custom_app_bar.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/navigation/navigation.dart';
import 'package:memoroutines/shared/theme/theme.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:styled_widget/styled_widget.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: LocaleKey.screensSettingsTitle),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: Spacing.md),
          ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: Spacing.xs),
            title: Text(
              LocaleKey.screensSettingsLanguageLink.tr(),
              style: context.texts.bodySmall,
            ),
            horizontalTitleGap: 0,
            onTap: () => context.pushNamed(RouteName.interfaceLocale.name),
          ),
          const Divider(height: 1),
          ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: Spacing.xs),
            title: Text(
              LocaleKey.screensSettingsAdvancedSettingsLink.tr(),
              style: context.texts.bodySmall,
            ),
            horizontalTitleGap: 0,
            onTap: () => context.pushNamed(RouteName.advancedSettings.name),
          ),
          const Spacer(),
          FutureBuilder(
            future: ref.read(packageInfo.future),
            builder: (_, snapshot) => Text(
              LocaleKey.screensSettingsVersion.tr(
                namedArgs: {
                  'version': snapshot.data?.version ?? '',
                  'build': snapshot.data?.buildNumber ?? '',
                },
              ),
              style: context.texts.labelSmall!.copyWith(
                color: context.colors.onBackground.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ).width(double.infinity),
          ),
          const SizedBox(height: Spacing.xs),
        ],
      ).padding(horizontal: Spacing.md),
    );
  }
}

final packageInfo = FutureProvider((ref) async {
  return await PackageInfo.fromPlatform();
});
