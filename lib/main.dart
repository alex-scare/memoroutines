import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/app/app.dart';
import 'package:memoroutines/services/i18n/global_i18n_handler.dart';
import 'package:memoroutines/services/logger/dev_logger.dart';
import 'package:memoroutines/shared/theme/theme.dart';

final log = DevLogger('root');

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  log.empty();
  log.infoWithDelimiters('app starting');

  SystemChrome.setSystemUIOverlayStyle(AppTheme.overlayStyleLight);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await EasyLocalization.ensureInitialized();

  runApp(const ProviderScope(child: GlobalI18nHandler(child: App())));
}
