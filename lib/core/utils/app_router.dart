import 'package:go_router/go_router.dart';
import 'package:register_page/features/register/presentation/views/register_page.dart';

abstract class AppRouter {
  // static const kSignInView = '/signin';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => RegisterPage(),
      ),
    ],
  );
}
