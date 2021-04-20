import 'package:flutter/material.dart';
import 'package:places/domain/data.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/enums.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/widgets/common/bottom_navigation_bar_widget.dart';
import 'package:places/ui/widgets/common/draggable_card.dart';
import 'package:places/ui/widgets/common/sight_card.dart';
import 'package:places/ui/widgets/visiting/tab_view_visiting_widget.dart';
import 'package:provider/provider.dart';

class VisitingScreen extends StatefulWidget {

  static const String _title = 'Избранное';
  static const List<String> _tabs = ['Хочу посетить', 'Посетил'];

  final int activeIndex;
  final Function changeScreen;

  const VisitingScreen({
    required this.activeIndex,
    required this.changeScreen
  });

  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {

  bool isDragWishes = false;
  CardDirection _acceptDirection = CardDirection.none;
  String _cardName = '';

  void _draggableResponse (String name, CardDirection direction) {
    setState(() {
      _acceptDirection = direction;
      _cardName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: VisitingScreen._tabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(visitingScreenAppBarH),
          child: AppBar(
            title: Text(
              VisitingScreen._title,
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
                tabs: List<Tab>.from(VisitingScreen._tabs.map((t) => Tab(child: Text(t))))
              ),
            ),
            Expanded(
              child: Container(
                padding: visitingScreenContainerPadding,
                child: TabBarView(children: [
                  TabViewVisitingWidget(
                    emptyImage: emptyVisitingWantURL,
                    emptyText: 'Отмечайте понравившиеся места и они появиятся здесь.',
                    sightList: context.watch<Data>()
                      .favorites.map<Widget>((s) =>
                        DraggableCard(sight: s, type: SightType.plan)
                    ).toList()
                  ),
                  TabViewVisitingWidget(
                    emptyImage: emptyVisitingURL,
                    emptyText: 'Завершите маршрут, чтобы место попало сюда.',
                    sightList: context.watch<Data>()
                      .visited.map<Widget>((s) =>
                        DraggableCard(sight: s, type: SightType.visited)
                    ).toList(),
                  )
                ])
              )
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBarWidget(
          activeIndex: widget.activeIndex,
          changeScreen: widget.changeScreen,
        ),
      ),
    );
  }
}
