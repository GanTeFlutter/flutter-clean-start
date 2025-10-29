part of '../../main.dart';

final GoRouter _router = GoRouter(
  navigatorKey: AppKeys.navigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashView();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          name: AppRoutes.homeView,
          builder: (BuildContext context, GoRouterState state) {
            return const HomeView();
          },
        ),
        GoRoute(
          path: 'versionUpdateView',
          name: AppRoutes.versionUpdateView,
          builder: (BuildContext context, GoRouterState state) {
            return const VersionUpdateView();
          },
        ),
      ],
    ),
  ],
);

/*
kullanımı:
context.goNamed(AppRoutes.homeView);
context.goNamed(AppRoutes.versionUpdate);




ana rotada path: '/' kullanılır.Kullanılmassa hata fırlatıyor.
ana rota altındaki rotalarda path: 'home' gibi kullanılır.

*/
