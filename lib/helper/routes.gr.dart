// // **************************************************************************
// // AutoRouteGenerator
// // **************************************************************************

// // GENERATED CODE - DO NOT MODIFY BY HAND

// // **************************************************************************
// // AutoRouteGenerator
// // **************************************************************************

// part of 'routes.dart';

// class _$AppRouter extends RootStackRouter {
//   _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

//   @override
//   final Map<String, PageFactory> pagesMap = {
//     WrapperScreenRoute.name: (routeData) {
//       return MaterialPageX<dynamic>(
//           routeData: routeData, child: const WrapperScreen());
//     },
//     CharacterPage.name: (routeData) {
//       final args = routeData.argsAs<CharacterPageArgs>();
//       return MaterialPageX<dynamic>(
//           routeData: routeData,
//           child: CharacterDetailScreen(
//               key: args.key, postsModel: args.postsModel));
//     }
//   };

//   @override
//   List<RouteConfig> get routes => [
//         RouteConfig(WrapperScreenRoute.name, path: '/'),
//         RouteConfig(CharacterPage.name, path: '/characterDetail')
//       ];
// }

// /// generated route for
// /// [WrapperScreen]
// class WrapperScreenRoute extends PageRouteInfo<void> {
//   const WrapperScreenRoute() : super(WrapperScreenRoute.name, path: '/');

//   static const String name = 'WrapperScreenRoute';
// }

// /// generated route for
// /// [CharacterDetailScreen]
// class CharacterPage extends PageRouteInfo<CharacterPageArgs> {
//   CharacterPage({Key? key, required PostModel postsModel})
//       : super(CharacterPage.name,
//             path: '/characterDetail',
//             args: CharacterPageArgs(key: key, postsModel: postsModel));

//   static const String name = 'CharacterPage';
// }

// class CharacterPageArgs {
//   const CharacterPageArgs({this.key, required this.postsModel});

//   final Key? key;

//   final PostModel postsModel;

//   @override
//   String toString() {
//     return 'CharacterPageArgs{key: $key, postsModel: $postsModel}';
//   }
// }
