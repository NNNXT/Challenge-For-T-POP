// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// Internal Modules
import 'package:challenge_for_t_pop/navigator_route.dart';
import 'package:challenge_for_t_pop/network/repository/seating.dart';
import 'package:challenge_for_t_pop/provider/main_navigation_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<SingleChildWidget> repositories = [
      Provider.value(value: SeatingRepository()),
    ];
    return MultiProvider(
      providers: [
        ...repositories,
        ChangeNotifierProvider<MainNavigationProvider>(
          create: (_) => MainNavigationProvider(),
        ),
      ],
      child: materialApp(context),
    );
  }
}
