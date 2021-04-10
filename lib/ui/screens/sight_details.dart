import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/widgets/button/base_back_button.dart';
import 'package:places/ui/widgets/button/base_elevated_button.dart';
import 'package:places/ui/widgets/button/base_text_button.dart';

class SightDetails extends StatelessWidget {
  final Sight sight;
  SightDetails({
    required this.sight
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(364.0),
        child: Stack(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 390.0
              ),
              child: Container(
                width: double.infinity,
                child: Image.network(
                  sight.url,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) { return child; }

                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null ?
                        loadingProgress.cumulativeBytesLoaded / num.parse('${loadingProgress.expectedTotalBytes}') : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) =>
                    Center(
                      child: Text('Some errors occurred!')
                    ),
                )
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0),
              child: BaseBackButton(
                background: Theme.of(context).backgroundColor
              )
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sight.name,
                style: Theme.of(context).textTheme.headline2
              ),
              SizedBox(height: 2.0),
              Row(
                children: [
                  Text(
                    sight.type,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    'закрыто до 9:00',
                    style: Theme.of(context).textTheme.bodyText2
                  )
                ],
              ),
              SizedBox(height: 24.0),
              Text(
                sight.details,
                style: Theme.of(context).textTheme.bodyText1
              ),
              BaseElevatedButton(
                action: () { print('Маршрут построен!'); },
                text: 'Построить маршрут',
                textIsUppercase: true,
                icon: emptyVisitingURL,
                topOffset: 24.0
              ),
              Container(
                margin: const EdgeInsets.only(top: 24.0, bottom: 8.0),
                width: double.infinity,
                height: 1.0,
                color: Theme.of(context).dividerColor
              ),
              Row(
                children: [
                  Expanded(
                    child: BaseTextButton(
                      action: () { print('Запланировано что то'); },
                      text: 'Запланировать',
                      disabled: true,
                      icon: calendarIconURL,
                    )
                  ),
                  Expanded(
                    child: BaseTextButton(
                      action: () { print('Добавлено в избранное'); },
                      text: 'В Избранное',
                      icon: favoriteIconURL,
                    )
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
