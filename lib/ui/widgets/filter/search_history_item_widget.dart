import 'package:flutter/material.dart';
import 'package:places/domain/history.dart';
import 'package:places/ui/res/colors.dart';
import 'package:provider/provider.dart';

class SearchHistoryItemWidget extends StatelessWidget {

  final String searchQuery;

  const SearchHistoryItemWidget({
    required this.searchQuery
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('hello');
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: Theme.of(context).dividerColor
            )
          )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              searchQuery,
              style: TextStyle(
                fontSize: 16.0,
                color: lightGrey2
              ),
            ),
            IconButton(
              icon: Icon(Icons.clear),
              iconSize: 16.0,
              color: lightGrey2,
              onPressed: () =>
                context.read<History>()
                  .removeHistoryItem(searchQuery),
            )
          ],
        ),
      ),
    );
  }
}
