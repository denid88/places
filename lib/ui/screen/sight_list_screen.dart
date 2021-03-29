import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/screen/sight_card.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: kIsWeb ?
          const Size.fromHeight(130.0) : const Size.fromHeight(112.0),
        child: Container(
          color: Theme.of(context).backgroundColor,
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0, bottom: 16.0),
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
                      text: 'Список ${kIsWeb  ? '' : '\n'}',
                    ),
                    TextSpan(
                      text: 'интересных мест',
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: mocks.map((s) => SightCard(sight: s)).toList(),
          ),
        ),
      ),
    );
  }
}
