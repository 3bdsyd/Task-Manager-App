import 'package:flutter/material.dart';
import 'package:todo_app/core/gen/fonts.gen.dart';
import 'package:todo_app/core/helper/shared_preferences.dart';
import 'package:todo_app/core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize PreferenceUtils instance.
  await SharedPref.init();
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});
  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();

    return MaterialApp.router(
      theme: ThemeData(fontFamily: FontFamily.notoSans),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    );
  }
}
