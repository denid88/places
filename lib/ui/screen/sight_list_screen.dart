import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';

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
        preferredSize: const Size.fromHeight(112.0),
        child: Container(
          color: Theme.of(context).backgroundColor,
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline1,
                  children: [
                    TextSpan(
                      text: 'С',
                      style: Theme.of(context).textTheme.headline1.copyWith(
                        color: green
                      ),
                    ),
                    TextSpan(
                      text: 'писок \n',
                    ),
                    TextSpan(
                      text: 'и',
                      style: Theme.of(context).textTheme.headline1.copyWith(
                        color: yellow
                      ),
                    ),
                    TextSpan(
                      text: 'нтересных мест',
                    )
                  ]
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
