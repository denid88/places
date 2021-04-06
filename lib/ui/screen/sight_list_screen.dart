import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/widget/common/bottom_navigation_bar_widget.dart';
import 'package:places/ui/widget/common/sight_card.dart';


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
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: sightListScreenContainerPadding,
          child: Column(
            children: mocks.map<Widget>((s) => SightCard(sight: s)).toList(),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        activeIndex: widget.activeIndex,
        changeScreen: widget.changeScreen
      )
    );
  }
}
