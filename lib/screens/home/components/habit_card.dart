import 'package:flutter/material.dart';
import 'package:parking/model/habit.dart';


class HabitCard extends StatelessWidget {
  final Habit habit;

  const HabitCard({
    required this.habit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Badge(
                label: Text(
                  habit.number.toString(),
                ),
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/${habit.vehicle.vehicleType.name}.png',
                  width: 64,
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/meditacao.jpg',
                    width: 48,
                  ),
                  Text(
                    habit.vacancy.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/plate.png',
                    width: 48,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    habit.vehicle.licensePlate,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
