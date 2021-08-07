import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/domain/state/data.dart';
import 'package:places/ui/utils/text_utils.dart';
import 'package:provider/provider.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/styles.dart';
import 'package:places/ui/widgets/button/base_elevated_button.dart';
import 'package:places/ui/widgets/button/base_text_button.dart';
import 'package:places/ui/widgets/common/base_image.dart';
import 'package:collection/collection.dart';

class SightDetails extends StatefulWidget {

  final Place place;

  SightDetails({
    required this.place
  });

  @override
  _SightDetailsState createState() => _SightDetailsState();
}

class _SightDetailsState extends State<SightDetails> {

  int _currentIndexIndicator = 0;

  PageController _pageController = PageController();

  ScrollController _scrollController = ScrollController();

  void _initAutoPageChange() {
    Timer.periodic(Duration(seconds: 5), (timer) {

      if (_currentIndexIndicator < widget.place.urls.length - 1 && _scrollController.hasClients) {
        _pageController.nextPage(
          duration: defaultDuration, curve: Curves.ease
        );
      } else {
        _currentIndexIndicator = 0;
        if (_scrollController.hasClients) {
          _pageController.animateToPage(
            0,
            duration: defaultDuration,
            curve: Curves.ease
          );
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _initAutoPageChange();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          floating: true,
          expandedHeight: 364.0,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
            background: PreferredSize(
              preferredSize: Size.fromHeight(364.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 364.0
                    ),
                    child: Container(
                      width: double.infinity,
                      child: widget.place.urls.isEmpty ?
                      BaseImage(url: widget.place.urls.first) :
                      Stack(
                        children: [
                          PageView.builder(
                            controller: _pageController,
                            onPageChanged: (int value) {
                              setState(() {
                                _currentIndexIndicator = value;
                              });
                            },
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: widget.place.urls.length,
                            itemBuilder: (BuildContext context, int index) {
                              return BaseImage(url: widget.place.urls[index]);
                            }
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 8.0,
                              child: Row(
                                children: List.generate(widget.place.urls.length,
                                    (index) => Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        _pageController.animateToPage(
                                          index,
                                          duration: defaultDuration,
                                          curve: Curves.ease
                                        );
                                      },
                                      child: Container(
                                        height: 8.0,
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: _currentIndexIndicator == index ?
                                          lowBlack : Colors.transparent,
                                          borderRadius: BorderRadius.circular(8.0)
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.place.name,
                    style: Theme.of(context).textTheme.headline2
                  ),
                  SizedBox(height: 2.0),
                  Row(
                    children: [
                      Text(
                        convertToResponseValue(widget.place.placeType),
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(width: 16.0),
                      Text(
                        'закрыто до 9:00',
                        style: Theme.of(context).textTheme.bodyText2
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    widget.place.description,
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
                        ),
                      ),
                      Expanded(
                        child: BaseTextButton(
                          disabled: context.watch<Data>()
                            .isFavorite(widget.place),
                          action: () => context.read<Data>()
                            .addToWishes(widget.place),
                          text: 'В Избранное',
                          icon: favoriteIconURL,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
