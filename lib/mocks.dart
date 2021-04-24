import 'package:places/domain/sight.dart';

final List<Sight> mocks = [
  Sight(
    name: 'Святогорская лавра',
    lat: 49.0281534,
    lng: 37.5653275,
    url: 'https://etnosvit.com/wp-content/uploads/2019/03/Svyatogorskaya-lavra.jpg',
    gallery: [
      'https://spzh.news/mediafiles/cDR1tr/thumbs/AD3BsY_5dcac72cce7df5_06944182-tmb-720x411xfill.jpg',
      'https://photographers.ua/thumbnails/pictures/43848/800x_dsc80671.jpg',
      'https://3.bp.blogspot.com/-WVKyypRiHxY/VBh6yS4su7I/AAAAAAAAED0/5N11j8nkofw/s1600/SAM_5364.JPG'
    ],
    details: 'Свято-Успенская Святогорская лавра является значительным духовным центром православной паствы всего востока современной Украины. В 1787 году по указу российской императрицы Екатерины II Святогорский монастырь был упразднён, а принадлежавшие ему деревни, земли и угодья отобраны в казну.\n\n В 1790 году новым владельцем Святогорья стал князь Потемкин-Таврический. По указу Святейшего Синода монастырские храмы Успения Божией Матери и святителя Николая на скале обращены в приходские, а прочие разобраны и увезены. В упразднённом состоянии обитель находилась почти 57 лет. Земли оставались в роду Потёмкиных.\n\nСвятогорская обитель была вновь открыта в 1992 году. Первыми насельниками были монах, священник (в будущем архимандрит) Серафим и четверо молодых послушников из Донецка. В том году монастырю отдали разграбленный и осквернённый, превращённый в кинотеатр Свято-Успенский собор, в боковых приделах которого были устроены общественные туалеты, сам собор был разделён железобетонным перекрытием на два этажа.',
    type: 'монастырь',
    date: '12 окт 2021'
  ),
  Sight(
    name: 'Соленое озеро Вейсовое',
    lat: 48.8685977,
    lng: 37.6258993,
    url: 'https://v-variant.com.ua/uploads/posts/2020-06/1591623783_102301981_139771491044028_7830165588986036224_o.jpg',
    gallery: [],
    details: 'Пляж после реконструкции стал прекрасный. Отличное место для отдыха. Подходит и семьям с детками и людям пожилого возраста.',
    type: 'озеро',
    date: '01 апр 2021',
    isVisited: true
  ),
  Sight(
    name: 'Карачун',
    lat: 48.8685977,
    lng: 37.6258993,
    url: 'https://i.imgur.com/LhaD237.jpg',
    gallery: [],
    details: 'Название горы переводится с тюркского как «чёрная смерть». Это название, предположительно, связано с тем, что из-за своего господствующего положения гора помогала первым поселенцам защищаться от набегов половцев. Позднее на горе располагались казацкие дозоры',
    type: 'гора',
    date: '01 янв 2021',
    isVisited: true
  ),
  Sight(
    name: 'Парк Горького',
    lat: 49.429308,
    lng: 36.3611331,
    url: 'https://kharkov.comments.ua/img/publications/880x586/5p55UCiT4-yshJYtej-hnYx_L-wiJvve.jpg',
    gallery: [],
    details: 'Харьковский парк культуры и отдыха им. Горького стал лидером поисковых запросов среди всех городских парков и развлекательных зон страны',
    type: 'парк',
    date: '01 сен 2021',
  ),
  Sight(
    name: 'Флореста',
    lat: 49.0443997,
    lng: 37.5398955,
    url: 'https://newimg.otpusk.com/2/800x600/00/00/76/38/763872.jpg',
    gallery: [],
    details: 'Гостиница расположена в сосновом лесу, рядом с национальным парком «Святые горы».',
    type: 'отель',
    date: '01 июль 2021',
  ),
  Sight(
    name: 'Париж',
    lat: 50.0043836,
    lng: 36.2433882,
    url: 'https://paris.kharkov.ua/public/images/galleries/9/7GTCgboftLvEL5z.jpg',
    gallery: [],
    details: 'Гостиница расположена в сосновом лесу, рядом с национальным парком «Святые горы».',
    type: 'ресторан',
    date: '01 авг 2021',
  ),
  Sight(
    name: 'Киево-Печерская лавра',
    lat: 50.4346409,
    lng: 30.5550671,
    url: 'https://www.interfax.ru/ftproot/textphotos/2018/11/29/lavra700.jpg',
    gallery: [],
    details: 'Печерский монастырь был основан в 1051 году при Ярославе Мудром монахом Антонием, родом из Любеча, и его учеником Феодосием. Князь Святослав II Ярославич подарил монастырю плато над пещерами (откуда, собственно, и произошло название монастыря), где позже выросли прекрасные каменные храмы, украшенные живописью, кельи, крепостные башни и другие строения. ',
    type: 'монастырь',
    date: '01 авг 2021',
  ),
  Sight(
    name: 'Манго',
    lat: 48.8514469,
    lng: 37.5618774,
    url: 'https://images.alphacoders.com/608/thumb-1920-608245.jpg',
    gallery: [],
    details: 'Площадь настолько большая, что там можно легко затеряться. Затеряться со своими комплексами, и сосредоточиться только на себе - своих лишних кг и "проблемных" местах. Еще один плюс просторного зала - много-много свежего воздуха: нет скученности, тесноты (чем страдают обычные спортивные комплексы.',
    type: 'спорт',
    date: '01 май 2021',
  ),
  Sight(
    name: 'Aroma Kava',
    lat: 48.8551696,
    lng: 37.5596802,
    url: 'https://rau.ua/wp-content/uploads/2018/12/0x800.jpg.pagespeed.ce_.3Ugkezts-s-800x433.jpg',
    gallery: [],
    details: 'Еще несколько лет назад бренд Aroma Kava был малознакомым кофеманам. Теперь эта сеть считается украинским аналогом Starbucks – ее точки можно встретить практически на каждом углу столицы и в более чем 20-ти городах Украины',
    type: 'кафе',
    date: '01 июнь 2021',
  ),
  Sight(
    name: 'Ultra',
    lat: 48.857559,
    lng: 37.5714591,
    url: 'https://s.6262.com.ua/section/catalogunitedintext/upload/images/catalog/intext/000/050/269/img5478_5c24d56e5d524.jpg',
    gallery: [],
    details: 'Комплекс «Ультра» открыл два совершенно новых и не похожих заведения – ресторан Sunshine и G бар. Основой концепции заведений являются пожелания гостей.',
    type: 'ресторан',
    date: '01 август 2021',
  )
];