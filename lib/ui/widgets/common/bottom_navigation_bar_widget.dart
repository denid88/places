import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screens/placeholder_screen.dart';
import 'package:places/ui/screens/settings_screen.dart';
import 'package:places/ui/screens/sight_list_screen.dart';
import 'package:places/ui/screens/visiting_screen.dart';

const List<Map<String, dynamic>> _bottomNavigationBarItems = [
  {'icon': listDarkIconURL, 'tooltip': 'List', 'label': ''},
  {'icon': mapDarkIconURL, 'tooltip': 'Map', 'label': ''},
  {'icon': favoriteDarkIconURL, 'tooltip': 'Favorite', 'label': ''},
  {'icon': settingsDarkIconURL, 'tooltip': 'Settings', 'label': ''}
];

class BottomNavigationBarWidget extends StatefulWidget {
  final int activeIndex;

  const BottomNavigationBarWidget({
    required this.activeIndex
  });

  @override
  _BottomNavigationBarWidgetState createState() =>
    _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  late int _selectedIndex;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedIndex = widget.activeIndex;
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: bottomNavigationBarMinHeight),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: bottomNavigationBarBorderWidth,
              color: Theme.of(context).dividerColor
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: List<BottomNavigationBarItem>.from(
            _bottomNavigationBarItems.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, dynamic> value = entry.value;
            return BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  value['icon'],
                  color: index == _selectedIndex ?
                    Theme.of(context).bottomNavigationBarTheme.selectedItemColor :
                    Theme.of(context).bottomNavigationBarTheme.unselectedItemColor
                ),
                tooltip: value['tooltip'],
                label: value['label']
              );
            }),
          ),
          onTap: (int index) {
            if (index == 0) {
              Navigator.of(context).pushReplacementNamed(SightListScreen.routeName);
            } else if (index == 1) {
              Navigator.of(context).pushReplacementNamed(PlaceHolderScreen.routeName);
            } else if (index == 2) {
              Navigator.of(context).pushReplacementNamed(VisitingScreen.routeName);
            } else if (index == 3) {
              Navigator.of(context).pushReplacementNamed(SettingsScreen.routeName);
            }
          }
        ),
      ),
    );
  }
}
