import 'package:flutter/material.dart';
import 'package:places/domain/onboard.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screens/sight_list_screen.dart';
import 'package:places/ui/widgets/button/base_elevated_button.dart';
import 'package:places/ui/widgets/button/base_text_button.dart';
import 'package:places/ui/widgets/onboarding/onboarding_indicator.dart';
import 'package:places/ui/widgets/onboarding/onboarding_step.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  static const routeName = 'onBoardScreen';
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  int _currentPage = 0;

  List<Widget> _onBoardingWidgetList = [
    OnBoardingStep(
      image: routerIconURL,
      title: 'Добро пожаловать \nв Путеводитель',
      description: 'Ищи новые локации и сохраняй самые любимые.',
    ),
    OnBoardingStep(
      image: bagIconURL,
      title: 'Построй маршрут \nи отправляйся в путь',
      description: 'Достигай цели максимально быстро и комфортно.',
    ),
    OnBoardingStep(
      image: touchIconURL,
      title: 'Добавляй места, \nкоторые нашёл сам',
      description: 'Делись самыми интересными и помоги нам стать лучше!',
    )
  ];

  void skipOnBoardScreen() {
    context.read<OnBoard>()
      .changeOnBoardState(false);
    Navigator.of(context)
      .pushReplacementNamed(SightListScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _currentPage != _onBoardingWidgetList.length - 1 ? Container(
              width: MediaQuery.of(context).size.width,
              height: appBarH,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: BaseTextButton(
                  width: 94.0,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w500,
                  action: skipOnBoardScreen,
                  text: 'Пропустить',
                ),
              ),
            ) : SizedBox.shrink(),
            Expanded(
              child: Stack(
                children: [
                  PageView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemCount: _onBoardingWidgetList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _onBoardingWidgetList[index];
                    }
                  ),
                  OnBoardingIndicator(active: _currentPage),
                  _currentPage == _onBoardingWidgetList.length - 1 ?
                  Positioned(
                      bottom: 8.0,
                      left: 16.0,
                      right: 16.0,
                      child: Center(
                        child: BaseElevatedButton(
                          textIsUppercase: true,
                          textFontWeight: FontWeight.w700,
                          text: 'На старт',
                          action: skipOnBoardScreen
                        ),
                      )
                  ) : SizedBox.shrink()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


