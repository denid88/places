import 'package:flutter/material.dart';
import 'package:places/domain/data.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/enums.dart';
import 'package:places/ui/widgets/common/sight_card.dart';
import 'package:provider/provider.dart';

class DraggableCard extends StatefulWidget {

  final Sight sight;
  final SightType type;

  const DraggableCard({
    required this.sight,
    required this.type
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
      onVerticalDragDown: (DragDownDetails details) {
        setState(() {
          _startPosition = details.globalPosition.dy;
        });
      },
      child: Draggable(
        affinity: Axis.vertical,
        key: ValueKey(widget.sight.name),
        data: widget.sight.name,
        onDragStarted: () {
          setState(() {
            _cardDirection = CardDirection.none;
            _selectedCard = widget.sight.name;
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
            sight: widget.sight,
            type: widget.type
          ),
        ),
        child: _isDrag ?
        SizedBox.shrink() : SightCard(
          sight: widget.sight,
          type: widget.type
        ),
      )
    );
  }
}
