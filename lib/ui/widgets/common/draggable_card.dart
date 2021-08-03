import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/domain/state/data.dart';
import 'package:places/ui/res/enums.dart';
import 'package:places/ui/widgets/common/sight_card.dart';
import 'package:provider/provider.dart';

class DraggableCard extends StatefulWidget {

  final Place place;
  final SightType type;
  final bool dismissibleEnable;

  const DraggableCard({
    required this.place,
    required this.type,
    this.dismissibleEnable = false
  });

  @override
  _DraggableCardState createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard> {

  bool _isDrag = false;
  double _startPosition = 0.0;
  double _cardPosition = 0.0;
  CardDirection _cardDirection = CardDirection.none;
  String? _selectedCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) {
        _startPosition = details.globalPosition.dy;
      },
      child: LongPressDraggable(
        key: ValueKey(widget.place.name),
        data: widget.place.name,
        onDragStarted: () {
          setState(() {
            _cardDirection = CardDirection.none;
            _selectedCard = widget.place.name;
            _isDrag = true;
          });
        },
        onDragEnd: (details) {
          setState(() {
            _cardPosition = details.offset.dy;
          });

          if (_startPosition < _cardPosition) {
            setState(() {
              _cardDirection = CardDirection.down;
            });
          } else if (_startPosition > _cardPosition) {
            setState(() {
              _cardDirection = CardDirection.up;
            });
          }

          if (_cardDirection != CardDirection.none) {
            widget.type == SightType.plan ?
              context.read<Data>()
                .orderSightFavorite(_selectedCard!, _cardDirection) :
              context.read<Data>()
                .orderSightVisited(_selectedCard!, _cardDirection);
          }

          setState(() {
            _isDrag = false;
          });
        },
        feedback: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width
          ),
          child: SightCard(
            place: widget.place,
            type: widget.type,
          ),
        ),
        child: _isDrag ?
        SizedBox.shrink() : SightCard(
          place: widget.place,
          type: widget.type,
          dismissibleEnable: widget.dismissibleEnable,
        ),
      )
    );
  }
}
