import 'package:femi/provider.dart';
import 'package:femi/statistics.dart';
import 'package:femi/widgets/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HabitsAndStats extends ConsumerWidget {
  const HabitsAndStats({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int tabindex = ref.watch(indexHabitsTabBarProvider);
    Widget childWidget;
    if (tabindex == 1) {
      childWidget = StatisticsScreen();
    } else {
      childWidget = Container();
    }
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Habits & Stats',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              ),
              SizedBox(
                height: 20,
              ),
              AnimatedRoundedTabbarFilled(
                onTabChange: (value) {
                  return ref.read(indexHabitsTabBarProvider.notifier).update((state) => value);
                },
              ),
              SizedBox(
                height: 20,
              ),
              childWidget
            ],
          ),
        ),
      ),
    );
  }
}
