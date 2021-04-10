import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/screens/sight_details.dart';
import 'package:places/ui/widgets/button/base_action_button.dart';

enum SightType { basic, plan, visited }

class SightCard extends StatelessWidget {

  static const String planCardText = 'Запланировано на';
  static const String visitedCardText = 'Цель достигнута';

  final Sight sight;
  final SightType type;

  const SightCard({
    required this.sight,
    this.type = SightType.basic
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SightDetails(
            sight: sight,
          )),
        );
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 768.0,
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 96.0,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16.0),
                          topLeft: Radius.circular(16.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          child: Image.network(
                            sight.url,
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null ?
                                  loadingProgress.cumulativeBytesLoaded / num.parse('${loadingProgress.expectedTotalBytes}')
                                      : null,
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) =>
                              Center(
                                child: Text('Some errors occurred!')
                              ),
                          ),
                        )
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            sight.type,
                            style: TextStyle(color: white),
                          ),
                          type == SightType.basic ?
                            BaseActionButton(
                              icon: favoriteIconURL,
                              action: () { print('Добавлено в избранное'); }
                            ) : type == SightType.plan ? Row(
                            children: [
                              BaseActionButton(
                                icon: calendarIconURL,
                                action: () { print('Добавлено в календарь'); }
                              ),
                              SizedBox(width: 20.0),
                              BaseActionButton(
                                icon: removeIconURL,
                                action: () { print('Удалить'); }
                              ),
                            ],
                          ) : type == SightType.visited ? Row(
                            children: [
                              BaseActionButton(
                                icon: shareIconURL,
                                action: () { print('Поделиться'); }
                              ),
                              SizedBox(width: 20.0),
                              BaseActionButton(
                                icon: removeIconURL,
                                action: () { print('Удалить'); }
                              ),
                            ],
                          ) : SizedBox.shrink()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardTheme.color,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16.0),
                    bottomLeft: Radius.circular(16.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: Text(
                        sight.name,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.subtitle1
                      ),
                    ),
                    type == SightType.plan && sight.date.isNotEmpty  ?
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          '$planCardText ${sight.date}',
                          style: Theme.of(context).
                            textTheme.bodyText2!.copyWith(color: green),
                        ),
                      ) : type == SightType.visited && sight.date.isNotEmpty ?
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          '$visitedCardText ${sight.date}',
                          style: Theme.of(context).
                            textTheme.bodyText2,
                        ),
                      ) : SizedBox.shrink(),
                    Text(
                      sight.details,
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
    );
  }
}
