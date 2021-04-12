import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/styles.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screens/add_sight_screen.dart';
import 'package:places/ui/screens/filter_screen.dart';
import 'package:places/ui/widgets/button/base_elevated_button.dart';
import 'package:places/ui/widgets/common/bottom_navigation_bar_widget.dart';
import 'package:places/ui/widgets/common/sight_card.dart';


class SightListScreen extends StatefulWidget {
  static const firstLineTitle = 'Список ${kIsWeb  ? '' : '\n'}';
  static const secondLineTitle = 'интересных мест';

  final int activeIndex;
  final Function changeScreen;

  const SightListScreen({
    required this.activeIndex,
    required this.changeScreen
  });
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {

  late List<Sight> _filteredList;

  @override
  void initState() {
    super.initState();
    _filteredList = mocks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: kIsWeb ?
          const Size.fromHeight(sightListScreenAppBarWebH) :
          const Size.fromHeight(sightListScreenAppBarMobileH),
        child: Container(
          color: Theme.of(context).backgroundColor,
          padding: sightListScreenAppBarPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: kIsWeb ?
              CrossAxisAlignment.center :
              CrossAxisAlignment.start,
            children: [
              RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline1,
                  children: [
                    TextSpan(
                      text: SightListScreen.firstLineTitle,
                    ),
                    TextSpan(
                      text: SightListScreen.secondLineTitle,
                    ),
                  ]
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 24.0, bottom: 18.0),
                height: 40.0,
                constraints: BoxConstraints(
                  maxWidth: 768.0,
                ),
                width: double.infinity,
                child: TextField(
                  style: ltTextRegular16,
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 14.0),
                      child: SvgPicture.asset(
                        searchIconURL,
                        width: 20.0,
                        color: lightGreyWithOpacity56,
                      ),
                    ),
                    suffixIcon: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FilterScreen(
                            list: mocks
                          )),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 15.0),
                        child: SvgPicture.asset(
                          filterIconURL,
                          width: 18.0,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    suffixIconConstraints: BoxConstraints(
                      minWidth: 20.0
                    ),
                    contentPadding: EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      left: 48.0,
                      right: 30.0
                    ),
                    disabledBorder: defaultBorderStyle,
                    enabledBorder: defaultBorderStyle,
                    border: defaultBorderStyle,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                      ),
                      borderRadius: BorderRadius.circular(12.0)
                    ),
                    filled: true,
                    fillColor: Theme.of(context).cardTheme.color,
                    focusColor: lightGrey,
                    hintText: 'Поиск',
                    hintStyle: TextStyle(
                      color: lightGreyWithOpacity56
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: sightListScreenContainerPadding,
              child: Column(
                children: _filteredList.map<Widget>((s) =>
                    SightCard(sight: s)).toList(),
              ),
            ),
          ),
          Positioned(
            bottom: 16.0,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: BaseElevatedButton(
                action: () async {
                  final newSight = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddSightScreen()),
                  );
                  if (newSight != null) {
                    setState(() {
                      _filteredList.add(newSight);
                    });
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
            )
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        activeIndex: widget.activeIndex,
        changeScreen: widget.changeScreen
      )
    );
  }
}
