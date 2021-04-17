import 'package:flutter/material.dart';

class BaseImage extends StatelessWidget {
  final String url;

  const BaseImage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
        ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null ?
              loadingProgress.cumulativeBytesLoaded /
              loadingProgress.expectedTotalBytes! : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) =>
        Center(
          child: Text('Some errors occurred!'),
        ),
    );
  }
}
