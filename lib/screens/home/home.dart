import 'package:flutter/material.dart';
import 'package:parking/model/habit.dart';
import 'package:parking/model/vacancy.dart';
import 'package:parking/model/vehicle.dart';
import 'package:parking/model/vehicle_type.dart';
import 'package:parking/screens/home/components/habit_card.dart';
import 'package:parking/screens/shared/custom_appbar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    var corvette = Vehicle(
      licensePlate: 'JUE-0593',
      brand: 'Chevrolet',
      model: 'Corvette',
      vehicleType: VehicleType.meditacao, // Corrigido para VehicleType.car (suponho que seja um tipo válido)
    );
    var vacancy = Vacancy(
      number: 1,
      description: '0001',
      vehicleType: VehicleType.respiracao, // Corrigido para VehicleType.car
    );
    var habit = Habit(
      number: 1,
      vacancy: vacancy,
      vehicle: corvette,
      entryTime: TimeOfDay.now(),
    );

    return Scaffold(
      appBar: customAppBar('Caminho Sereno'),
      backgroundColor: Color.fromARGB(255, 224, 241, 205),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'new_habit');
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '16',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      'Pesquisa',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '4',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      'Lembretes',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) => HabitCard(habit: habit), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
