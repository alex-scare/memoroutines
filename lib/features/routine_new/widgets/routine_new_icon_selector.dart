import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_pod.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/helpers/routine_icon.dart';
import 'package:memoroutines/shared/navigation/navigation.dart';
import 'package:memoroutines/shared/theme/theme.dart';

class RoutineNewIconSelector extends HookConsumerWidget {
  const RoutineNewIconSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formPod = ref.watch(routineNewPod(null));
    final formPodNotifier = ref.read(routineNewPod(null).notifier);

    final iconsController = usePageController(
      initialPage: formPod.iconIndex,
      viewportFraction: 1 / 6,
    );

    useEffect(
      () {
        if (iconsController.hasClients) {
          iconsController.jumpToPage(formPod.iconIndex);
        }

        void listener() {
          final index = iconsController.page!.round();
          formPodNotifier.setIcon(RoutineIcon.values[index], index);
        }

        iconsController.addListener(listener);
        return () {
          iconsController.removeListener(listener);
          iconsController.dispose;
        };
      },
      const [],
    );

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          int currentPage = iconsController.page!.round();
          if (currentPage != formPod.iconIndex) {
            iconsController.jumpToPage(formPod.iconIndex);
          }
        });
        return null;
      },
      [formPod.iconIndex],
    );

    return Column(
      children: [
        Flexible(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.colors.primaryContainer,
                  ),
                ),
              ),
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[
                      Colors.white,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.white,
                    ],
                    stops: [0.0, 0.05, 0.95, 1.0],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstOut,
                child: PageView.builder(
                  controller: iconsController,
                  itemCount: RoutineIcon.values.length,
                  physics: const CustomScrollPhysics(),
                  pageSnapping: true,
                  itemBuilder: (context, index) {
                    final isCurrent = formPod.iconIndex == index;

                    return Center(
                      child: Icon(
                        RoutineIcon.values[index].icon,
                        size: isCurrent ? 40.0 : 20.0,
                        color: isCurrent
                            ? context.colors.onPrimaryContainer
                            : context.colors.primaryContainer,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () => _showIconGrid(context, ref),
            style: TextButton.styleFrom(foregroundColor: Colors.transparent),
            child: Text(
              LocaleKey.screensNewRoutineMainInfoIconsShowMore.tr(),
              style: context.texts.labelMedium!
                  .copyWith(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
    );
  }

  void _showIconGrid(BuildContext context, WidgetRef ref) {
    final formPod = ref.watch(routineNewPod(null));
    final formPodNotifier = ref.read(routineNewPod(null).notifier);

    AppNavigation().showModal(
      context,
      (_) {
        return GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: RoutineIcon.values.length,
          itemBuilder: (ctx, index) {
            final isSelected = formPod.iconIndex == index;

            return GestureDetector(
              onTap: () {
                formPodNotifier.setIcon(RoutineIcon.values[index], index);
                Navigator.of(context).pop();
              },
              child: isSelected
                  ? CircleAvatar(
                      backgroundColor: context.colors.primaryContainer,
                      child: Icon(
                        RoutineIcon.values[index].icon,
                        size: 32.0,
                        color: context.colors.onPrimaryContainer,
                      ),
                    )
                  : Icon(RoutineIcon.values[index].icon, size: 32.0),
            );
          },
        );
      },
    );
  }
}

class CustomScrollPhysics extends ScrollPhysics {
  const CustomScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    /// scroll speed multiplier
    return super.applyPhysicsToUserOffset(position, offset) * 5.0;
  }
}
