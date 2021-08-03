import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/screens/sight_details.dart';

class CardDetailsDialog extends StatelessWidget {
  final Place place;

  const CardDetailsDialog({
    required this.place
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height - 64.0,
          child: DraggableScrollableSheet(
            expand: true,
            initialChildSize: 1,
            minChildSize: 1,
            builder: (context, scrollController) {
              return ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.0),
                  topLeft: Radius.circular(16.0),
                ),
                child: SightDetails(
                  place: place,
                ),
              );
            }
          ),
        ),
        Positioned(
          top: 12.0,
          child: Container(
            width: 40.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(8.0)
            ),
          ),
        ),
        Positioned(
          top: 16.0,
          right: 16.0,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: white,
                shape: BoxShape.circle
              ),
              child: Icon(
                Icons.clear,
                color: lightGrey2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
