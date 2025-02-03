import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexBottomNavbarProvider = StateProvider<int>((ref) {
  return 0;
});

final homePageItemsProvider = StateProvider<List>((ref) {
  Map<String, dynamic> data = {
    'data':[{
      'title': 'Health and Stats',
      'image': 'assets/images/3802286.jpg',
      'callback': 0
    },
    {
      'title': 'Analysis',
      'image': 'assets/images/73z_2202_w009_n001_113b_p14_113.jpg',
    },]
  };
  return data['data'];
});

final indexHabitsTabBarProvider = StateProvider<int>((ref) {
  return 1;
});