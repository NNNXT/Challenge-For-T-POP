// Flutter Modules
import 'package:challenge_for_t_pop/base/base_widget.dart';
import 'package:flutter/material.dart';

// Internal Modules
import 'package:challenge_for_t_pop/base/base_extension.dart';
import 'package:challenge_for_t_pop/src/features/main_navagation/viewmodel.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<MainNavigationViewModel>(
      model: MainNavigationViewModel(context: context),
      onModelReady: (model) async {
        await model.fetchSeating();
      },
      builder: (_, model, __) => Scaffold(
        appBar: AppBar(title: Text(model.seating?.venue.name ?? '')),
        body: Wrap(
          children: List.generate(
            (model.seating?.seatLayout.seats ?? []).length,
            (index) => Icon(Icons.chair, size: context.media.size.width / (model.seating?.seatLayout.columns ?? 0)),
          ),
        ),
      ),
    );
  }
}
