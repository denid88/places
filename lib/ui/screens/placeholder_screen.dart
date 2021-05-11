import 'package:flutter/material.dart';
import 'package:places/ui/widgets/common/bottom_navigation_bar_widget.dart';

class PlaceHolderScreen extends StatelessWidget {
  static const routeName = 'placeholderScreen';

  final int activeIndex;

  const PlaceHolderScreen({
    required this.activeIndex
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Экран заглушка'),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        activeIndex: activeIndex
      ),
    );
  }
}