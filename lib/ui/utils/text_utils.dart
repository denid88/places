import 'package:places/ui/res/enums.dart';

String capitalizeFirst(String s) => s[0].toUpperCase() + s.substring(1);

String convertEnumCategoriesToString(Categories category) {
  if (category == Categories.lake) return 'Озеро';
  if (category == Categories.church) return 'Монастырь';
  if (category == Categories.mountain) return 'Гора';
  if (category == Categories.restaurant) return 'Ресторан';
  if (category == Categories.hotel) return 'Отель';
  if (category == Categories.park) return 'Парк';
  if (category == Categories.cafe) return 'Кафе';

  return 'Не выбрано';
}