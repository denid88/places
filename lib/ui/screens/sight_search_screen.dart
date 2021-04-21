import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:places/ui/screens/sight_details.dart';
import 'package:places/ui/widgets/filter/search_history_empty_widget.dart';
import 'package:provider/provider.dart';
import 'package:places/domain/data.dart';
import 'package:places/domain/history.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screens/filter_screen.dart';
import 'package:places/ui/widgets/button/base_back_button.dart';
import 'package:places/ui/widgets/common/search_bar.dart';
import 'package:places/ui/widgets/filter/search_history_not_found_widget.dart';
import 'package:places/ui/widgets/filter/search_history_suggestion_widget.dart';
import 'package:places/ui/widgets/filter/search_history_widget.dart';


class SightSearchScreen extends StatefulWidget {
  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {

  static const _title = 'Список интересных мест';

  FocusNode _focusNode = FocusNode();
  TextEditingController _searchController = TextEditingController();

  List<Sight> _filteredList = [];
  List<Sight> _suggestionList = [];

  bool subtractEnabled = false;
  bool suffixFilterEnabled = true;
  bool _showNotFound = false;
  bool _showSuggestion = false;
  bool _showEmpty = true;
  bool _showHistory = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(focusNodeHandler);
    _filteredList = context.read<Data>().data;
    context.read<History>().history.isEmpty ?
      setState(() {
        _showEmpty = true;
      }) : setState(() {
        _showHistory = true;
      });
  }

  void focusNodeHandler() {
    if (!_focusNode.hasFocus) {
      setState(() {
        subtractEnabled = false;
        suffixFilterEnabled = true;
      });
    } else if (_focusNode.hasFocus && _searchController.text.isEmpty) {
      setState(() {
        subtractEnabled = false;
        suffixFilterEnabled = true;
      });
    } else if (_focusNode.hasFocus && _searchController.text.isNotEmpty) {
      setState(() {
        subtractEnabled = true;
        suffixFilterEnabled = false;
      });
    }
  }

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
              onChangedHandler: (value) {
                focusNodeHandler();
                setState(() {
                  _showSuggestion = true;
                  _showEmpty = false;
                  _showNotFound = false;
                  _showHistory = false;
                  if (_searchController.text.isNotEmpty) {
                    _suggestionList = _filteredList.where((element) =>
                        element.name.toLowerCase().contains(_searchController.text.toLowerCase())
                    ).toList();
                  } else {
                    _suggestionList = [];
                  }
                });
              },
              onEditingCompleteHandler: () {
                final foundSight = _filteredList.singleWhereOrNull((element) =>
                  element.name.toLowerCase().contains(_searchController.text.toLowerCase())
                );

                if (foundSight != null) {
                  context.read<History>()
                    .addHistoryItem(foundSight.name);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SightDetails(sight: foundSight),
                    ),
                  );
                  setState(() {
                    _showNotFound = false;
                    _showSuggestion = false;
                  });
                  context.read<History>().history.isEmpty ?
                    setState(() {
                      _showEmpty = true;
                    }) : setState(() {
                      _showHistory = true;
                    });
                } else {
                  setState(() {
                    _showNotFound = true;
                    _showSuggestion = false;
                    _showEmpty = false;
                    _showHistory = false;
                  });
                }
                setState(() {
                  _suggestionList = [];
                });
              },
              suffixIcon: suffixFilterEnabled ?
                filterIconURL : subtractIconURL,
              suffixIconColor: suffixFilterEnabled ?
                Theme.of(context).accentColor : darkGrey,
              suffixIconAction: suffixFilterEnabled ?
                () async {
                  print('Переход в фильтр');
                  final data = context.read<Data>().data;
                  final appliedFilterList = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FilterScreen(list: data),
                    ),
                  );

                  if (appliedFilterList != null) {
                    _filteredList = appliedFilterList;
                  } else {
                    _filteredList = context.read<Data>().data;
                  }
                  setState(() {
                    _showSuggestion = false;
                    _showNotFound = false;
                  });
                  context.read<History>().history.isEmpty ?
                  setState(() {
                    _showEmpty = true;
                  }) : setState(() {
                    _showHistory = true;
                  });
                  _focusNode.unfocus();
                } :
                () {
                _searchController.clear();
                setState(() {
                  _showSuggestion = false;
                  _showNotFound = false;
                });
                context.read<History>().history.isEmpty ?
                setState(() {
                  _showEmpty = true;
                }) : setState(() {
                  _showHistory = true;
                });
              },
              focusNode: _focusNode,
              textEditingController: _searchController,
              subtractEnabled: subtractEnabled,
            ),
            _showEmpty ? SearchHistoryEmptyWidget() : Container(),
            _showSuggestion ? SearchHistorySuggestionWidget(
              list: _suggestionList
             ) : Container(),
            _showNotFound ? SearchHistoryNotFoundWidget() : Container(),
            _showHistory ? SearchHistoryWidget() : Container(),
          ],
        ),
      ),
    );
  }
}
