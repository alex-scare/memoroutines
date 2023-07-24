import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/theme/theme.dart';

class LocalesList extends StatelessWidget {
  const LocalesList({
    Key? key,
    required this.list,
    required this.onTap,
    required this.current,
  }) : super(key: key);

  final List<Locale> list;
  final Function(Locale) onTap;
  final Locale current;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: list.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (_, index) {
        final locale = list[index];
        return ListTile(
          title: Text(
            '${LocaleKey.modelsInterfaceLanguage}.${locale.languageCode}'.tr(),
          ),
          dense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: Spacing.xs),
          trailing: locale == current
              ? Icon(LineIcons.check, color: context.colors.secondary)
              : null,
          onTap: () => onTap(locale),
        );
      },
    );
  }
}
