import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:memoroutines/services/file_system/file_system_service.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/services/logger/dev_logger.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/theme/theme.dart';

class AdvancedSettingsLogs extends HookWidget {
  const AdvancedSettingsLogs({super.key});

  @override
  Widget build(BuildContext context) {
    final logsEnabled = useState(DevLogger.loggerEnabled);

    return Column(
      children: [
        ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: Spacing.xs),
          title: Text(
            LocaleKey.screensAdvancedSettingsLogsWriteLog.tr(),
            style: context.texts.bodySmall,
          ),
          trailing: Switch(
            value: logsEnabled.value,
            onChanged: (value) {
              logsEnabled.value = value;
              DevLogger.setLogEnabled(value);
            },
          ),
        ),
        const Divider(height: 1),
        ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: Spacing.xs),
          title: Text(
            LocaleKey.screensAdvancedSettingsLogsShareLog.tr(),
            style: context.texts.bodySmall,
          ),
          onTap: () async {
            final file = await DevLogger.getFile();
            return FileSystemService.shareFile(file);
          },
        ),
        const Divider(height: 1),
        ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: Spacing.xs),
          title: Text(
            LocaleKey.screensAdvancedSettingsLogsDeleteLog.tr(),
            style: context.texts.bodySmall,
          ),
          onTap: DevLogger.clearLogsFile,
        ),
      ],
    );
  }
}
