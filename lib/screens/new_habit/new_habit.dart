import 'package:flutter/material.dart';
import 'package:parking/model/vehicle_type.dart';
import 'package:parking/screens/shared/custom_appbar.dart';
import 'package:parking/screens/shared/custom_dropdown_menu.dart';
import 'package:parking/screens/new_habit/new_habit.dart';

class NewHabit extends StatelessWidget {
  NewHabit({super.key});
  final _listOfTypes = VehicleType.values.map((item) => item.name).toList();
  final _listOfVacancies = List.generate(10, (index) => "Vaga ${index + 1}");
  var _entryTimeController = TextEditingController(
    text: formatTime(TimeOfDay.now()),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Novo hábito'),
      backgroundColor: Colors.lightGreen.shade100,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'NOME DO HÁBITO',
              ),
              textCapitalization: TextCapitalization.characters,
              autofocus: true,
            ),
            CustomDropdownMenu(
              list: _listOfTypes,
            ),
            CustomDropdownMenu(
              list: _listOfVacancies,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'LEMBRETES',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.schedule),
                  onPressed: () async {
                    _entryTimeController.text =
                        await showCustomTimePicker(context);
                  },
                ),
              ),
              readOnly: true,
              controller: _entryTimeController,
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> showCustomTimePicker(BuildContext context) async {
  final selectTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (selectTime != null) {
    return formatTime(selectTime);
  }
  return formatTime(TimeOfDay.now());
}

String formatTime(TimeOfDay time) {
  return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
}
