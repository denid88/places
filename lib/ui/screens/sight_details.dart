import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/styles.dart';
import 'package:places/ui/widgets/button/base_elevated_button.dart';
import 'package:places/ui/widgets/button/base_text_button.dart';
import 'package:places/ui/widgets/common/base_image.dart';

class SightDetails extends StatefulWidget {

  final Sight sight;

  SightDetails({
    required this.sight
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

      if (_currentIndexIndicator < widget.sight.gallery.length - 1 && _scrollController.hasClients) {
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
                      child: widget.sight.gallery.isEmpty ?
                      BaseImage(url: widget.sight.url) :
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
                            itemCount: widget.sight.gallery.length,
                            itemBuilder: (BuildContext context, int index) {
                              return BaseImage(url: widget.sight.gallery[index]);
                            }
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 8.0,
                              child: Row(
                                children: List.generate(widget.sight.gallery.length,
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
                    widget.sight.name,
                    style: Theme.of(context).textTheme.headline2
                  ),
                  SizedBox(height: 2.0),
                  Row(
                    children: [
                      Text(
                        widget.sight.type,
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
                    widget.sight.details,
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
                          action: () { print('Добавлено в избранное'); },
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
