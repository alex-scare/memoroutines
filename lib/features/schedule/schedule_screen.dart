import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:memoroutines/features/schedule/widgets/schedule_app_bar.dart';
import 'package:memoroutines/features/schedule/widgets/schedule_repetitions_list.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/extensions/date_time.dart';
import 'package:memoroutines/shared/extensions/duration.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';

class ScheduleScreen extends HookWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final pageController = usePageController(initialPage: 500);
    final currentPage = useState(pageController.initialPage);

    useEffect(
      () {
        void listener() {
          currentPage.value = pageController.page?.round() ?? 0;
        }

        pageController.addListener(listener);
        return () => pageController.removeListener(listener);
      },
      [],
    );

    return Scaffold(
      appBar: ScheduleAppBar(
        currentDate: _getStringDateForPage(currentPage.value),
        goToToday: () {
          pageController.jumpToPage(todayPageIndex);
        },
        goToPrevPage: () => pageController.previousPage(
          duration: 200.milliseconds,
          curve: Curves.easeInOut,
        ),
        goToNextPage: () => pageController.nextPage(
          duration: 200.milliseconds,
          curve: Curves.easeInOut,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
        child: PageView.builder(
          controller: pageController,
          itemBuilder: (_, index) {
            final date = _getDateForPage(currentPage.value);
            return ScheduleRepetitionsList(date: date);
          },
        ),
      ),
    );
  }

  static const todayPageIndex = 500;

  DateTime _getDateForPage(int page) {
    final today = DateTime.now().clearTime();
    const todayIndex = todayPageIndex;

    if (page == todayIndex) {
      return today;
    }

    final daysDiff = page - todayIndex;
    return today.add(Duration(days: daysDiff));
  }

  String _getStringDateForPage(int page) {
    final date = _getDateForPage(page);
    final daysDiff = date.difference(DateTime.now().clearTime()).inDays;
    return switch (daysDiff) {
      0 => LocaleKey.durationNamesToday.tr(),
      1 => LocaleKey.durationNamesTomorrow.tr(),
      -1 => LocaleKey.durationNamesYesterday.tr(),
      _ => date.toDateShortString(),
    };
  }
}
