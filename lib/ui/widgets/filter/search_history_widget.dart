import 'package:flutter/material.dart';
import 'package:places/domain/history.dart';
import 'package:places/ui/res/styles.dart';
import 'package:places/ui/widgets/button/base_text_button.dart';
import 'package:places/ui/widgets/filter/search_history_empty_widget.dart';
import 'package:places/ui/widgets/filter/search_history_item_widget.dart';
import 'package:provider/provider.dart';

class SearchHistoryWidget extends StatelessWidget {

  static const String label = 'Вы искали';
  static const String clearBtnText = 'Очистить историю';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
        child: context.watch<History>().history.isEmpty ?
          SearchHistoryEmptyWidget() :
          ListView(
            physics: defaultScrollPhysics,
            children: [
              Text(
                label.toUpperCase(),
                style: baseLabelStyle
              ),
              Column(
                children: context.watch<History>().history
                  .map<Widget>((item) =>
                    SearchHistoryItemWidget(searchQuery: item),
                ).toList(),
              ),
              BaseTextButton(
                width: 140.0,
                text: clearBtnText,
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w700,
                action: () =>
                  context.read<History>()
                    .removeAllHistory(),
              ),
            ],
          ),
      ),
    );
  }
}
