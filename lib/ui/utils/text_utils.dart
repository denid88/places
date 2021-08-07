import 'package:places/ui/res/enums.dart';

String capitalizeFirst(String s) => s[0].toUpperCase() + s.substring(1);

String convertEnumCategoriesToString(Categories category) {
  if (category == Categories.temple) return 'Храм';
  if (category == Categories.monument) return 'Монумент';
  if (category == Categories.park) return 'Парк';
  if (category == Categories.theatre) return 'Театр';
  if (category == Categories.museum) return 'Музей';
  if (category == Categories.hotel) return 'Отель';
  if (category == Categories.restaurant) return 'Ресторан';
  if (category == Categories.cafe) return 'Кафе';
  if (category == Categories.other) return 'Другое';

  return 'Не выбрано';
}

String convertToRequestValue(String value) {
  if (value == 'храм') return 'temple';
  if (value == 'монумент') return 'monument';
  if (value == 'парк') return 'park';
  if (value == 'театр') return 'theatre';
  if (value == 'музей') return 'museum';
  if (value == 'отель') return 'hotel';
  if (value == 'ресторан') return 'restaurant';
  if (value == 'кафе') return 'cafe';
  if (value == 'другое') return 'other';

  return 'unknown';
}

String convertToResponseValue(String value) {
  if (value == 'temple') return 'Храм';
  if (value == 'monument') return 'Монумент';
  if (value == 'park') return 'Парк';
  if (value == 'theatre') return 'Театр';
  if (value == 'museum') return 'Музей';
  if (value == 'hotel') return 'Отель';
  if (value == 'restaurant') return 'Ресторан';
  if (value == 'cafe') return 'Кафе';
  if (value == 'other') return 'Другое';

  return 'Не указано';
}