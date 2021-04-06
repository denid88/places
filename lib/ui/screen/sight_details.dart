import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: white,
                      ),
                      width: 32.0,
                      height: 32.0,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Icon(Icons.arrow_back_ios, size: 14.0)
                      ),
                    ),
                  ),
                ],
              ),
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
                style: Theme.of(context).textTheme.bodyText1?.copyWith(color: grey)
              ),
              SizedBox(height: 24.0),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 48.0,
                    maxWidth: 360.0,
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: green,
                    ),
                    child: Center(
                      child: Text(
                        'построить маршрут'.toUpperCase(),
                        style: TextStyle(color: white)
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 24.0, bottom: 8.0),
                width: double.infinity,
                height: 1.0,
                color: hr
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_today, color: cardDescription),
                        SizedBox(width: 8.0),
                        Text('Запланировать')
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite),
                        SizedBox(width: 8.0),
                        Text('В Избранное', style: TextStyle(color: grey))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
