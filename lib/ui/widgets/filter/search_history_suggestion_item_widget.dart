import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/screens/sight_details.dart';
import 'package:places/ui/utils/text_utils.dart';

class SearchHistorySuggestionItemWidget extends StatelessWidget {

  final Sight item;

  const SearchHistorySuggestionItemWidget({
    required this.item
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SightDetails(
            sight: item,
          )),
        );
      },
      child: Container(
        child: Row(
          children: [
            Container(
              width: 56.0,
              height: 56.0,
              margin: const EdgeInsets.only(right: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: NetworkImage(
                    item.url
                  ),
                  fit: BoxFit.cover
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: lowBlack
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    capitalizeFirst(item.type),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: lightGrey2
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    width: MediaQuery.of(context).size.width,
                    height: 1.0,
                    color: Theme.of(context).dividerColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
