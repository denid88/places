import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/sizes.dart';

const List<Map<String, dynamic>> _bottomNavigationBarItems = [
  {'icon': listDarkIconURL, 'tooltip': 'List', 'label': ''},
  {'icon': mapDarkIconURL, 'tooltip': 'Map', 'label': ''},
  {'icon': favoriteDarkIconURL, 'tooltip': 'Favorite', 'label': ''},
  {'icon': settingsDarkIconURL, 'tooltip': 'Settings', 'label': ''}
];

class BottomNavigationBarWidget extends StatefulWidget {
  final int activeIndex;
  final Function changeScreen;

  const BottomNavigationBarWidget({
    required this.activeIndex,
    required this.changeScreen
  });

  @override
  _BottomNavigationBarWidgetState createState() =>
    _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.activeIndex;
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: bottomNavigationBarMinHeight),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: bottomNavigationBarBorderWidth,
              color: bottomNavigationBarBorderColor
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: List<BottomNavigationBarItem>.from(
            _bottomNavigationBarItems.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, dynamic> value = entry.value;
            return BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  value['icon'],
                  color: index == _selectedIndex ? darkGrey : grey,
                ),
                tooltip: value['tooltip'],
                label: value['label']
              );
            }),
          ),
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
              widget.changeScreen(index);
            });
          }
        ),
      ),
    );
  }
}
