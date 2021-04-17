import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  final int activeIndex;
  final Function changeScreen;

  const SightListScreen(
      {required this.activeIndex, required this.changeScreen});

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  static const _title = 'Список интересных мест';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: kIsWeb ?
          const Size.fromHeight(sightListScreenAppBarWebH) :
          const Size.fromHeight(sightListScreenAppBarMobileH),
        child: AppBar(
          title: Text(
            _title,
            style: Theme.of(context).textTheme.headline3,
          ),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: sightListScreenContainerPadding,
        child: Column(
          children: [
            SearchBar(
              disabled: true,
              subtractEnabled: true,
              suffixIcon: filterIconURL,
              suffixIconColor: Theme.of(context).accentColor
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    physics: defaultScrollPhysics,
                    itemCount: Provider.of<Data>(context, listen: true).data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SightCard(sight: Provider.of<Data>(context, listen: true).data[index]);
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
                            Provider.of<Data>(context, listen: false)
                              .add(newSight);
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        activeIndex: widget.activeIndex,
        changeScreen: widget.changeScreen
      ),
    );
  }
}
