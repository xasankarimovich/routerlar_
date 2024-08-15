import 'package:go_router/go_router.dart';
import 'package:ui_router/ui/screens/cart_screen.dart';
import 'package:ui_router/ui/screens/details_screen.dart';
import 'package:ui_router/ui/screens/item_list_screen.dart';
import 'package:ui_router/ui/screens/main_screen.dart';

class AppRouter {
  static const mainScreen = '/mainScreen';
  static const itemList = 'itemList';
  static const detailScreen = 'detailScreen';
  static const cartScreen = 'cartScreen';

  static final config = GoRouter(
    initialLocation: mainScreen,
    routes: [
      GoRoute(
        path: mainScreen,
        builder: (context, state) => const MainScreen(),
        routes: [
          GoRoute(
            name: detailScreen,
            path: detailScreen,
            builder: (context, state) => const DetailsScreen(),
          ),
          GoRoute(
            name: itemList,
            path: itemList,
            builder: (context, state) => const ItemListScreen(),
          ),
          GoRoute(
            name: cartScreen,
            path: cartScreen,
            builder: (context, state) => const CartScreen(),
          )
        ],
      ),
    ],
  );
}
