import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/data.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/enums.dart';
import 'package:places/ui/res/styles.dart';
import 'package:places/ui/widgets/button/base_action_button.dart';
import 'package:places/ui/widgets/card/card_details_dialog.dart';
import 'package:places/ui/widgets/common/dissmisibble_card.dart';
import 'package:provider/provider.dart';
import 'package:places/ui/widgets/common/base_image.dart';


class SightCard extends StatefulWidget {

  static const String planCardText = 'Запланировано на';
  static const String visitedCardText = 'Цель достигнута';

  final Sight sight;
  final SightType type;
  final Function? remove;
  final dismissibleEnable;

  const SightCard({
    required this.sight,
    this.type = SightType.basic,
    this.remove,
    this.dismissibleEnable = false
  });

  @override
  _SightCardState createState() => _SightCardState();
}

class _SightCardState extends State<SightCard> {

  final DateTime _now = DateTime.now();
  final DateTime _max = DateTime(2050);
  
  late DateTime? _selectedMaterialDate;
  late TimeOfDay? _selectedMaterialTime;
  late DateTime? _selectedCupertinoDateTime;

  void _showModalBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.0),
          topLeft: Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext context) {
        return CardDetailsDialog(sight: widget.sight);
      }
    );
  }

  void _showDateMaterialPicker() async {
    final picked = await showDatePicker(
      initialDatePickerMode: DatePickerMode.day,
      context: context,
      initialDate: _now,
      firstDate: _now,
      lastDate: _max,
    ).whenComplete(() => _showTimeMaterialPicker());
    setState(() {
      _selectedMaterialDate = picked;
    });
  }

  void _showDateCupertinoPicker() async {
    await showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
      height: 240.0,
      color: Color.fromARGB(255, 255, 255, 255),
      child:
        CupertinoDatePicker(
          onDateTimeChanged: (DateTime value) {
            setState(() {
              _selectedCupertinoDateTime = value;
            });
          },
        )
      )
    );
  }
  
  void _showTimeMaterialPicker() async {
    final timePicked = await showTimePicker(
      initialTime: TimeOfDay.fromDateTime(_now),
      context: context         
    );
    setState(() {
      _selectedMaterialTime = timePicked;
    });
  }

  @override
  Widget build(BuildContext context) {

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 768.0,
      ),
      child: Card(
        margin: const EdgeInsets.only(bottom: 16.0),
        child: InkWell(
          borderRadius: cardBorderRadius,
          splashColor: splashCard,
          onTap: () => _showModalBottomSheet(),
          child: DismissibleCard(
            sight: widget.sight,
            type: widget.type,
            enabled: widget.dismissibleEnable,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: 96.0,
                        ),
                        width: double.infinity,
                        child: BaseImage(url: widget.sight.url)
                      ),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.sight.type,
                              style: TextStyle(color: white),
                            ),
                            widget.type == SightType.basic ?
                            BaseActionButton(
                              icon: widget.sight.isFavorite ?
                              favoriteDarkIconURL : favoriteIconURL,
                              action: () {
                                if (!widget.sight.isFavorite) {
                                  context.read<Data>()
                                    .addToWishes(widget.sight);
                                }
                              }
                            ) : widget.type == SightType.plan ? Row(
                              children: [
                                BaseActionButton(
                                  icon: calendarIconURL,
                                  action: () => Platform.isIOS ?
                                    _showDateCupertinoPicker() :
                                    _showDateMaterialPicker()
                                ),
                                SizedBox(width: 20.0),
                                BaseActionButton(
                                  icon: removeIconURL,
                                  action: () {
                                    context.read<Data>()
                                      .removeFromListWishes(widget.sight.name);
                                  }
                                ),
                              ],
                            ) : widget.type == SightType.visited ? Row(
                              children: [
                                BaseActionButton(
                                  icon: shareIconURL,
                                  action: () { print('Поделиться'); }
                                ),
                                SizedBox(width: 20.0),
                                BaseActionButton(
                                  icon: removeIconURL,
                                  action: () {
                                    context.read<Data>()
                                      .removeFromListVisited(widget.sight.name);
                                  }
                                ),
                              ],
                            ) : SizedBox.shrink()
                          ],
                        ),
                      ),
                    ]
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16.0),
                        bottomLeft: Radius.circular(16.0),
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: Text(
                            widget.sight.name,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.subtitle1
                          ),
                        ),
                        widget.type == SightType.plan && widget.sight.date.isNotEmpty  ?
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            '${SightCard.planCardText} ${widget.sight.date}',
                            style: Theme.of(context).
                            textTheme.bodyText2!.copyWith(color: green),
                          ),
                        ) : widget.type == SightType.visited && widget.sight.date.isNotEmpty ?
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            '${SightCard.visitedCardText} ${widget.sight.date}',
                            style: Theme.of(context).
                            textTheme.bodyText2,
                          ),
                        ) : SizedBox.shrink(),
                        Text(
                          widget.sight.details,
                          style: Theme.of(context).textTheme.bodyText2,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
