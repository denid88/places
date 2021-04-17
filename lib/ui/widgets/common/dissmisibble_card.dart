import 'package:flutter/material.dart';
import 'package:places/domain/data.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/enums.dart';
import 'package:places/ui/widgets/common/sight_card_dismissible_background.dart';
import 'package:places/ui/widgets/common/sight_card_dismissible_sec_background.dart';
import 'package:provider/provider.dart';

class DismissibleCard extends StatefulWidget {

  final Widget child;
  final bool enabled;
  final Sight sight;
  final SightType type;

  const DismissibleCard({
    required this.child,
    required this.sight,
    this.type = SightType.basic,
    this.enabled = false
  });

  @override
  _DismissibleCardState createState() => _DismissibleCardState();
}

class _DismissibleCardState extends State<DismissibleCard> {
  @override
  Widget build(BuildContext context) {
    return widget.enabled ? Dismissible(
      key: ValueKey(widget.sight.name),
      direction: widget.type == SightType.basic ?
        DismissDirection.none : DismissDirection.endToStart,
      background: SightCardDismissibleBackground(),
      secondaryBackground: SightCardDismissibleSecBackground(),
      dismissThresholds: {
        DismissDirection.endToStart: 0.2,
      },
      onDismissed: widget.type == SightType.basic ? null : (DismissDirection direction) {
        if (direction == DismissDirection.endToStart) {

          if (widget.type == SightType.plan) {
            Provider.of<Data>(context, listen: false)
              .removeFromListWishes(widget.sight.name);
          } else if (widget.type == SightType.visited) {
            Provider.of<Data>(context, listen: false)
              .removeFromListVisited(widget.sight.name);
          }
        }
      },
      confirmDismiss: (DismissDirection direction) async {
        return  direction == DismissDirection.endToStart;
      },
      child: widget.child,
    ) : widget.child;
  }
}
