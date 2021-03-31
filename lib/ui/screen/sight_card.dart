import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/screen/sight_details.dart';

class SightCard extends StatelessWidget {
  final Sight sight;
  const SightCard({
    @required this.sight
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
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 96.0,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16.0),
                          topLeft: Radius.circular(16.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(sight.url),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            sight.type,
                            style: TextStyle(color: white),
                          ),
                          Container(
                            width: 20.0,
                            height: 20.0,
                            child: Icon(Icons.favorite, color: white),
                          )
                        ],
                      )
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: cardBackground,
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
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width / 2
                        ),
                        child: Text(
                          sight.details,
                          style: Theme.of(context).textTheme.bodyText2,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
