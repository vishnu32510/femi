import 'package:femi/core/utils/extentions/app_media_query_extensions.dart';
import 'package:femi/screens/habit_and_stats.dart';
import 'package:femi/providers/provider.dart';
import 'package:femi/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List itemList = ref.watch(homePageItemsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        height: context.height,
        width: context.width,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: itemList.length,
          itemBuilder: (context, index) => TourismCard(
            title: itemList[index]['title'],
            image: itemList[index]['image'],
            callback: () {
              ref.read(indexHabitsTabBarProvider.notifier).update((state) => 1);
              if (itemList[index]['callback'] == 0) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HabitsAndStats()));
              }
            },
          ),
        ),
      ),
    );
  }
}
