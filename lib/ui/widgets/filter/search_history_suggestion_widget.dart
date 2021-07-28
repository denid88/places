import 'package:flutter/material.dart';
import 'package:places/domain/state/sight.dart';
import 'package:places/ui/widgets/filter/search_history_suggestion_item_widget.dart';

class SearchHistorySuggestionWidget extends StatelessWidget {

  final List<Sight> list;

  const SearchHistorySuggestionWidget({
    required this.list
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 40.0),
        child: SingleChildScrollView(
          child: Column(
            children: list.map<Widget>((item) =>
              SearchHistorySuggestionItemWidget(item: item)).toList()
          ),
        ),
      )
    );
  }
}
