import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/services/file_system/file_system_service.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/services/logger/dev_logger.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/pubs/global_state_pub.dart';
import 'package:memoroutines/shared/theme.dart';

class AdvancedSettingsLogs extends HookConsumerWidget {
  const AdvancedSettingsLogs({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final logsEnabled = ref.watch(
      globalStatePub.select((value) => value.isLoggerEnabled ?? false),
    );

    return Column(
      children: [
        ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: Spacing.xxs),
          title: Text(
            LocaleKey.screensAdvancedSettingsLogsWriteLog.tr(),
            style: context.texts.bodyLarge,
          ),
          trailing: Switch(
            value: logsEnabled,
            onChanged: ref.read(globalStatePub.notifier).setLoggerEnabled,
          ),
        ),
        const Divider(height: 1),
        ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: Spacing.xxs),
          title: Text(
            LocaleKey.screensAdvancedSettingsLogsShareLog.tr(),
            style: context.texts.bodyLarge,
          ),
          onTap: () async {
            final file = await DevLogger.getFile();
            return FileSystemService.shareFile(file);
          },
        ),
        const Divider(height: 1),
        ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: Spacing.xxs),
          title: Text(
            LocaleKey.screensAdvancedSettingsLogsDeleteLog.tr(),
            style: context.texts.bodyLarge,
          ),
          onTap: DevLogger.clearLogsFile,
        ),
      ],
    );
  }
}
