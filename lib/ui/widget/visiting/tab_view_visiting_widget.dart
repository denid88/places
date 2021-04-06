import 'package:flutter/material.dart';
import 'package:places/ui/widget/common/sight_card.dart';
import 'package:places/ui/widget/visiting/empty_visiting_widget.dart';

class TabViewVisitingWidget extends StatelessWidget {

  final String emptyImage;
  final String emptyText;
  final List<SightCard> sightList;

  const TabViewVisitingWidget({
    required this.emptyImage,
    required this.emptyText,
    required this.sightList
  });

  @override
  Widget build(BuildContext context) {
    return sightList.isNotEmpty ? SingleChildScrollView(
      child: Column(
        children: sightList
      ),
    ) : EmptyVisitingWidget(
      emptyImage: emptyImage,
      emptyText: emptyText,
    );
  }
}
