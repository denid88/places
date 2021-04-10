import 'package:flutter/material.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/widgets/common/bottom_navigation_bar_widget.dart';
import 'package:places/ui/widgets/common/sight_card.dart';
import 'package:places/ui/widgets/visiting/tab_view_visiting_widget.dart';

class VisitingScreen extends StatelessWidget {

  static const String _title = 'Избранное';
  static const List<String> _tabs = ['Хочу посетить', 'Посетил'];
  static final List<Widget> _tabsView = [
    TabViewVisitingWidget(
      emptyImage: emptyVisitingWantURL,
      emptyText: 'Отмечайте понравившиеся места и они появиятся здесь.',
      sightList: [SightCard(sight: mocks.first, type: SightType.plan)],
    ),
    TabViewVisitingWidget(
      emptyImage: emptyVisitingURL,
      emptyText: 'Завершите маршрут, чтобы место попало сюда.',
      sightList: [SightCard(sight: mocks.last, type: SightType.visited)],
    )
  ];

  final int activeIndex;
  final Function changeScreen;

  const VisitingScreen({
    required this.activeIndex,
    required this.changeScreen
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(visitingScreenAppBarH),
          child: AppBar(
            title: Text(
              _title,
              style: Theme.of(context).textTheme.headline3,
            ),
            centerTitle: true,
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: visitingScreenMarginTabs,
              width: double.infinity,
              height: visitingScreenTabsH,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light ?
                  ltTabBarBackgroundColor :
                  dtTabBarBackgroundColor,
                borderRadius: BorderRadius.circular(
                  visitingScreenTabsBorderRadius
                ),
              ),
              child: TabBar(
                tabs: List<Tab>.from(_tabs.map((t) => Tab(child: Text(t))))
              ),
            ),
            Expanded(
              child: Container(
                padding: visitingScreenContainerPadding,
                child: TabBarView(children: _tabsView)
              )
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBarWidget(
          activeIndex: activeIndex,
          changeScreen: changeScreen,
        ),
      ),
    );
  }
}
