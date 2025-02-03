import 'package:femi/chat_screen.dart';
import 'package:femi/home_screen.dart';
import 'package:femi/provider.dart';
import 'package:femi/save_screen.dart';
import 'package:femi/search_screen.dart';
import 'package:femi/settings_screen.dart';
import 'package:femi/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);
    Widget childWidget;
    switch (indexBottomNavbar) {
      case 0:
        childWidget = HomeScreen();
        break;
      case 1:
        childWidget = SearchScreen();
        break;
      case 2:
        childWidget = ChatScreen();
        break;
      case 3:
        childWidget = SaveScreen();
        break;
      case 4:
        childWidget = SettingsScreen();
        break;
      default:
        childWidget = Center(child: Text('Indexs: $indexBottomNavbar not found'));
        break;
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
            child: childWidget,
          ),
      ),
      bottomNavigationBar: SafeArea(child: DockingBar(
        onIndexChanged: (value) {
          return ref.read(indexBottomNavbarProvider.notifier).update((state) => value);
        },
      )),
    );
  }
}
