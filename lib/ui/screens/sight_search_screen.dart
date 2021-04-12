import 'package:flutter/material.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/widgets/button/base_back_button.dart';
import 'package:places/ui/widgets/common/search_bar.dart';

class SightSearchScreen extends StatefulWidget {
  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {

  static const _title = 'Список интересных мест';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(sightListScreenAppBarWebH),
        child: AppBar(
          leading: BaseBackButton(
            background: Colors.transparent,
          ),
          title: Text(
            _title,
            style: Theme.of(context).textTheme.headline3,
          ),
          centerTitle: true,
        )
      ),
      body: Padding(
        padding: sightListScreenContainerPadding,
        child: Column(
          children: [
            SearchBar(
              disabled: false,
              suffixIcon: subtractIconURL,
              suffixIconColor: darkGrey,
              suffixIconAction: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}
