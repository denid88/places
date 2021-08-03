import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/domain/entities/coords.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/utils/geo_utils.dart';
import 'package:places/ui/utils/sizes_utils.dart';
import 'package:places/ui/widgets/button/base_back_button.dart';
import 'package:places/ui/widgets/button/base_elevated_button.dart';
import 'package:places/ui/widgets/button/base_filter_button.dart';
import 'package:places/ui/widgets/button/base_text_button.dart';

class FilterScreen extends StatefulWidget {
  final List<Place> list;
  const FilterScreen({
    required this.list
  });

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  late List<Place> _filteredList;
  late List<Map<String, dynamic>> _defaultList;
  late RangeValues _currentRangeValues;
  final Coords currentGeo = Coords(
    lat: 48.8478039,
    lng: 37.5525647
  );

  @override
  void initState() {
    super.initState();
    _filteredList = [];
    _currentRangeValues = const RangeValues(100, 5000);
    final sortedList = widget.list.where((e) {
      final checkPoint = Coords(lat: e.lat, lng: e.lng);
      print(arePointsNear(checkPoint, currentGeo, _currentRangeValues.end));
      return arePointsNear(checkPoint, currentGeo, _currentRangeValues.end);
    }).toList();
    // _defaultList = sortedList
    //   .map<String>((s) => s.type).toSet().toList()
    //   .map<Map<String, dynamic>>((e) => {
    //     'type': e,
    //     'status': false
    //   }).toList();
  }

  void filterChange(args) {
    setState(() {
      _defaultList.map((e) {
        if (e['type'] == args['type']) { e['status'] = args['status'];}
        return e;
      }).toList();
    });

    if (args['status']) {
      // setState(() {
      //   _filteredList.removeWhere((s) => s.type == args['type']);
      //   _filteredList.addAll(widget.list.where((s) => s.type == args['type']));
      // });
    } else {
      // setState(() {
      //   _filteredList.removeWhere((s) => s.type == args['type']);
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(filterScreenAppBarH),
        child: AppBar(
          leading: BaseBackButton(
            background: Colors.transparent,
          ),
          actions: [
            BaseTextButton(
              action: () {
                setState(() {
                  _filteredList = [];
                  _currentRangeValues = const RangeValues(100, 5000);
                  final sortedList = widget.list.where((e) {
                    final checkPoint = Coords(lat: e.lat, lng: e.lng);
                    return arePointsNear(checkPoint, currentGeo, _currentRangeValues.end);
                  }).toList();
                  // _defaultList = sortedList
                  //     .map<String>((s) => s.type).toSet().toList()
                  //     .map<Map<String, dynamic>>((e) => {
                  //   'type': e,
                  //   'status': false
                  // }).toList();
                });
              },
              text: 'Очистить',
              width: 100.0,
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 24.0),
                      child: Text(
                        'Категории'.toUpperCase(),
                        style: TextStyle(
                          color: Theme.of(context).dividerColor
                        )
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isScreenSmall(MediaQuery.of(context).size) ?
                          0.0 : 24.0
                      ),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.start,
                        children: _defaultList.map<Widget>((e) =>
                          BaseFilterButton(
                            type: e['type'],
                            status: e['status'],
                            action: filterChange
                          )
                        ).toList()
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 24.0, top: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Расстояние',
                            style: TextStyle(
                              color: Theme.of(context).brightness == Brightness.light ?
                                lowBlack : white
                            )
                          ),
                          Text(
                            'от 100м до 10 км',
                            style: TextStyle(
                              color: ltDistance
                            ),
                          )
                        ],
                      )
                    ),
                    Container(
                      width: double.infinity,
                      child: RangeSlider(
                        values: _currentRangeValues,
                        min: 100,
                        max: 10000,
                        labels: RangeLabels(
                          _currentRangeValues.start.round().toString(),
                          _currentRangeValues.end.round().toString(),
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _filteredList = [];
                            _currentRangeValues = values;
                            final sortedList = widget.list.where((e) {
                              final checkPoint = Coords(lat: e.lat, lng: e.lng);
                              return arePointsNear(checkPoint, currentGeo, _currentRangeValues.end);
                            }).toList();

                            // _defaultList = sortedList
                            //     .map<String>((s) => s.type).toSet().toList()
                            //     .map<Map<String, dynamic>>((e) => {
                            //   'type': e,
                            //   'status': false
                            // }).toList();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            BaseElevatedButton(
              topOffset: 8.0,
              bottomOffset: 8.0,
              action: () {
                Navigator.of(context).pop(_filteredList);
              },
              text: _filteredList.isNotEmpty ?
                'показать (${_filteredList.length})' : 'показать',
              textIsUppercase: true,
              height: 48.0,
            )
          ],
        ),
      ),
    );
  }
}
