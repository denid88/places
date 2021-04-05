import 'package:flutter/material.dart';
import 'package:places/ui/widget/common/bottom_navigation_bar_widget.dart';

class PlaceHolderScreen extends StatelessWidget {
  final int activeIndex;
  final Function changeScreen;

  const PlaceHolderScreen({
    @required this.activeIndex,
    @required this.changeScreen
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Экран заглушка'),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        activeIndex: activeIndex,
        changeScreen: changeScreen,
      ),
    );
  }
}