// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';

// Internal Modules
import 'package:challenge_for_t_pop/base/base_extension.dart';
import 'package:challenge_for_t_pop/base/base_widget.dart';
import 'package:challenge_for_t_pop/model/seat.dart';
import 'package:challenge_for_t_pop/model/seat_layout.dart';
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
      builder: (_, model, __) {
        double width = context.media.size.width - 16;
        SeatLayout? seatLayout = model.seating?.seatLayout;
        List<Seat> listSeatsBook = seatLayout?.seats.where((e) => e.status == SeatStatus.book).toList() ?? [];
        int userCanSelect = model.userCanSelect;
        return Scaffold(
          appBar: AppBar(title: Text(model.seating?.venue.name ?? '')),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Wrap(
                    children: seatLayout?.seats.mapIndexed(
                          (index, seat) {
                            return IconButton(
                              padding: EdgeInsets.zero,
                              iconSize: width / (seatLayout.columns),
                              onPressed: () {
                                if (seat.status == SeatStatus.unavailable) {
                                  return;
                                }

                                if (seat.status == SeatStatus.book) {
                                  model.selectSeat(index: index);
                                  return;
                                }

                                if (listSeatsBook.length < userCanSelect) {
                                  model.selectSeat(index: index);
                                  return;
                                }

                                context.showToast(
                                  msg: userCanSelect == 1
                                      ? 'can_select.one'.tr(args: [userCanSelect.toString()])
                                      : 'can_select.many'.tr(args: [userCanSelect.toString()]),
                                );
                              },
                              icon: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.chair,
                                    color: seat.status.toSeatColor,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadiusDirectional.circular(24),
                                    ),
                                    padding: const EdgeInsets.all(4),
                                    child: Text(
                                      seat.seatNumber,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ).toList() ??
                        [],
                  ),
                ),
                SafeArea(
                  child: SizedBox(
                    height: 32,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        String seatNumber = listSeatsBook[index].seatNumber;
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 16),
                              Text(seatNumber),
                              IconButton(
                                onPressed: () {
                                  int? index = seatLayout?.seats.indexWhere(
                                    (element) => element.seatNumber == seatNumber,
                                  );
                                  if (index != null) {
                                    model.selectSeat(index: index);
                                  }
                                },
                                icon: const Icon(Icons.delete),
                                padding: EdgeInsets.zero,
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(width: 4),
                      itemCount: listSeatsBook.length,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
