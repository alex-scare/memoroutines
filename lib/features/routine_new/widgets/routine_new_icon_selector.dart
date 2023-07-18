import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_pod.dart';
import 'package:memoroutines/shared/navigation/navigation.dart';
import 'package:memoroutines/shared/theme.dart';

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

        iconsController.addListener(() {
          final index = iconsController.page!.round();
          formPodNotifier.setIcon(iconList[index], index);
        });
        return iconsController.dispose;
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
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.colors.primary,
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
                  itemCount: iconList.length,
                  physics: const CustomScrollPhysics(),
                  pageSnapping: true,
                  itemBuilder: (context, index) {
                    final isCurrent = formPod.iconIndex == index;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Center(
                        child: Icon(
                          iconList[index],
                          size: isCurrent ? 48.0 : 20.0,
                          color: isCurrent
                              ? context.colors.onPrimary
                              : context.colors.primary,
                        ),
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
              'tap to see more icons',
              style: context.texts.bodyMedium!
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
          itemCount: iconList.length,
          itemBuilder: (ctx, index) {
            final isSelected = formPod.iconIndex == index;

            return GestureDetector(
              onTap: () {
                formPodNotifier.setIcon(iconList[index], index);
                Navigator.of(context).pop();
              },
              child: isSelected
                  ? CircleAvatar(
                      backgroundColor: context.colors.primaryContainer,
                      child: Icon(
                        iconList[index],
                        size: 32.0,
                        color: Colors.white,
                      ),
                    )
                  : Icon(iconList[index], size: 32.0),
            );
          },
        );
      },
    );
  }
}

// prepare icon pack
final iconList = LineIcons.values.values.toList();

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
