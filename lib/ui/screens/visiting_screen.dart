import 'package:flutter/material.dart';
import 'package:places/domain/data.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/enums.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/styles.dart';
import 'package:places/ui/widgets/common/bottom_navigation_bar_widget.dart';
import 'package:places/ui/widgets/common/draggable_card.dart';
import 'package:places/ui/widgets/visiting/empty_visiting_widget.dart';
import 'package:provider/provider.dart';

class VisitingScreen extends StatefulWidget {

  static const routeName = 'visitingScreen';

  static const String _title = 'Избранное';
  static const List<String> _tabs = ['Хочу посетить', 'Посетил'];

  final int activeIndex;

  const VisitingScreen({
    required this.activeIndex
  });

  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {

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
                tabs: List<Tab>.from(VisitingScreen._tabs.map((t) =>
                  Tab(child: Text(t))))
              ),
            ),
            Expanded(
              child: Container(
                padding: visitingScreenContainerPadding,
                child: TabBarView(
                  children: [
                    context.watch<Data>().favorites.isNotEmpty ?
                      ListView.builder(
                        physics: defaultScrollPhysics,
                        itemCount: context.watch<Data>()
                          .favorites.length,
                        itemBuilder: (BuildContext context, int index) {
                          return DraggableCard(
                            sight: context.watch<Data>()
                              .favorites[index],
                            type: SightType.plan,
                            dismissibleEnable: true
                          );
                        }
                      ) : EmptyVisitingWidget(
                        emptyImage: emptyVisitingWantURL,
                        emptyText: 'Отмечайте понравившиеся места и они появиятся здесь.',
                      ),
                    context.watch<Data>().visited.isNotEmpty ?
                      ListView.builder(
                        physics: defaultScrollPhysics,
                        itemCount: context.watch<Data>()
                          .visited.length,
                        itemBuilder: (BuildContext context, int index) {
                          return DraggableCard(
                            sight: context.watch<Data>()
                              .visited[index],
                            type: SightType.visited,
                            dismissibleEnable: true
                          );
                        }
                      ) : EmptyVisitingWidget(
                        emptyImage: emptyVisitingURL,
                        emptyText: 'Завершите маршрут, чтобы место попало сюда.',
                      )
                  ]
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBarWidget(
          activeIndex: widget.activeIndex
        ),
      ),
    );
  }
}
