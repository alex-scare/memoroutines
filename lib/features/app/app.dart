import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:memoroutines/features/app/global_error_handler.dart';
import 'package:memoroutines/services/logger/dev_logger.dart';
import 'package:memoroutines/shared/navigation/navigation.dart';
import 'package:memoroutines/shared/theme.dart';

class App extends HookWidget {
  const App({super.key});
  static final log = DevLogger('root');

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        FlutterNativeSplash.remove();
        log.infoWithDelimiters('app started. splash removed');
        return null;
      },
      [],
    );

    return GlobalErrorHandler(
      router: AppNavigation().router,
      child: MaterialApp.router(
        title: 'Memoroutines',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        // darkTheme: AppTheme.dark,
        themeMode: ThemeMode.light,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        routeInformationProvider:
            AppNavigation().router.routeInformationProvider,
        routerDelegate: AppNavigation().router.routerDelegate,
        routeInformationParser: AppNavigation().router.routeInformationParser,
      ),
    );
  }
}
