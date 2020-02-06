/*
TODO: Remove side padding for body of listViewEventCategory
TODO: Reduce space between carousel event cards by half
TODO: extract constants from carousel and page title implementations
TODO: Test different screen sizes
*/

const double smallCardWidth = 300.0;
const double smallCardHeight = 225.0;
const double largeCardHeight = 275.0;

//class DiscoverPage extends StatelessWidget {
//  static String url =
//      'https://arbordayblog.org/wp-content/uploads/2018/06/oak-tree-sunset-iStock-477164218-1080x608.jpg';
//  final List<Event> events = [
//    Event(
//        title: 'My Event 1', venue: 'SAE', date: DateTime.now(), imageUrl: url),
//    Event(
//        title: 'My Event 2',
//        venue: 'Kappa Alpha',
//        date: DateTime.now(),
//        imageUrl: url),
//    Event(
//        title: 'My Event 3',
//        venue: 'PiKapp',
//        date: DateTime.now(),
//        imageUrl: url),
//    Event(
//        title: 'My Event 4',
//        venue: 'PIKE',
//        date: DateTime.now(),
//        imageUrl: url),
//    Event(
//        title: 'My Event 5',
//        venue: 'ADPi',
//        date: DateTime.now(),
//        imageUrl: url),
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Color(0xFF12121212),
//      body: SafeArea(
//        child: ListView(
//          children: <Widget>[
//            SizedBox(height: 40.0),
//            discoverPageHeader('Discover'),
//            SizedBox(height: 30.0),
//            CarouselSliderEventCategory(
//              title: 'Featured',
//              events: events,
//              cardHeight: largeCardHeight,
//            ),
//            SizedBox(height: 10.0),
//            ListViewEventCategory(
//              title: 'Popular',
//              events: events,
//              cardHeight: smallCardHeight,
//              cardExtent: smallCardWidth,
//            ),
//            SizedBox(height: 25.0),
//            ListViewEventCategory(
//              title: 'Upcoming',
//              events: events,
//              cardHeight: smallCardHeight,
//              cardExtent: smallCardWidth,
//            ),
//            SizedBox(height: 25.0),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//Widget discoverPageHeader(String title) {
//  return Padding(
//    padding: const EdgeInsets.only(
//      left: eventCategoryTitlePadding,
//    ),
//    child: Row(
//      children: <Widget>[
//        Expanded(
//          flex: 2,
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            children: <Widget>[
//              FittedBox(
//                fit: BoxFit.cover,
//                child: Text(
//                  title,
//                  style: TextStyle(
//                      fontFamily: 'Raleway',
//                      fontWeight: FontWeight.bold,
//                      color: Color(0xFFFFFFFF)),
//                ),
//              ),
//              SizedBox(
//                height: 3.0,
//                child: DecoratedBox(
//                  decoration: BoxDecoration(
//                    gradient: LinearGradient(
//                      begin: Alignment.bottomLeft,
//                      end: Alignment.topRight,
//                      colors: [
//                        Color(0xFFFF6C1A),
//                        Color(0xFFF01844),
//                        Color(0xFF7E0BC9),
//                      ],
//                      stops: [
//                        0.0,
//                        .528,
//                        1.0,
//                      ],
//                    ),
//                  ),
//                ),
//              )
//            ],
//          ),
//        ),
//        Expanded(
//          flex: 3,
//          child: Container(),
//        ),
//      ],
//    ),
//  );
//}
