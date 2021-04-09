import 'package:places/ui/res/assets.dart';

String getIconFromType (String type) {
  switch(type) {
    case 'монастырь':
      return churchIconURL;
    case 'озеро':
      return lakeIconURL;
    case 'гора':
      return mountainsIconURL;
    case 'кафе':
      return cafeIconURL;
    case 'отель':
      return hotelIconURL;
    case 'парк':
      return parkIconURL;
    case 'музей':
      return museumIconURL;
    case 'спорт':
      return sportIconURL;
    case 'ресторан':
      return restaurantIconURL;
    case 'другое':
      return wonderIconURL;
    default:
      return wonderIconURL;
  }
}