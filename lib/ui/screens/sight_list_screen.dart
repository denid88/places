import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:places/domain/data.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/styles.dart';
import 'package:places/ui/screens/add_sight_screen.dart';
import 'package:places/ui/widgets/button/base_elevated_button.dart';
import 'package:places/ui/widgets/common/bottom_navigation_bar_widget.dart';
import 'package:places/ui/widgets/common/search_bar.dart';
import 'package:places/ui/widgets/common/sight_card.dart';
import 'package:provider/provider.dart';

class SightListScreen extends StatefulWidget {

  static const routeName = 'sightList';

  final int activeIndex;

  const SightListScreen({
    required this.activeIndex
  });

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {

  static const _title = 'Список интересных мест';

  ScrollController _scrollController = ScrollController();

  bool changeToMinHeader = false;

  double _preferredOffsetToAppBarChange = 60.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollHeaderListener);
  }

  void _scrollHeaderListener() {
    _scrollController.offset > _preferredOffsetToAppBarChange ?
      setState(() {
        changeToMinHeader = true;
      }) :
      setState(() {
        changeToMinHeader = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 136.0,
              floating: true,
              pinned: true,
              elevation: noElevation,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.all(16.0),
                centerTitle: changeToMinHeader ? true : false,
                title: changeToMinHeader ? Text(
                  _title,
                  style: Theme.of(context).textTheme.headline3,
                ) : Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Список\nинтересных мест',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 24.0
                    ),
                    textAlign: TextAlign.left,
                  ),
                )
              ),
            ),
            SliverPadding(
              padding: sightListScreenContainerPadding,
              sliver: SliverToBoxAdapter(
                child: SearchBar(
                  disabled: true,
                  subtractEnabled: true,
                  suffixIcon: filterIconURL,
                  suffixIconColor: Theme.of(context).accentColor
                ),
              ),
            ),
          ];
        },
        body: Container(
          padding: sightListScreenContainerPadding,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ListView.builder(
                physics: defaultScrollPhysics,
                itemCount: context.watch<Data>().data.length,
                itemBuilder: (BuildContext context, int index) {
                  return SightCard(sight: context.watch<Data>().data[index]);
                }
              ),
              Positioned(
                bottom: 16.0,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: BaseElevatedButton(
                    action: () async {
                      final newSight = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddSightScreen(),
                        ),
                      );
                      if (newSight != null) {
                        context.read<Data>().add(newSight);
                      }
                    },
                    text: 'новое место',
                    textIsUppercase: true,
                    icon: plusIconURL,
                    iconSize: 16.0,
                    width: 177.0,
                    height: 48.0,
                    borderRadius: 24.0,
                    gradientEnable: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        activeIndex: widget.activeIndex
      ),
    );
  }
}
