import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/theme.dart';

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
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) {
        final locale = list[index];
        return ListTile(
          title: Text(
            '${LocaleKey.modelsInterfaceLanguage}.${locale.languageCode}'.tr(),
          ),
          dense: true,
          trailing: locale == current
              ? Icon(LineIcons.check, color: context.colors.secondary)
              : null,
          onTap: () => onTap(locale),
        );
      },
    );
  }
}
