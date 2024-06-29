import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskForm extends StatefulWidget {
  final void Function(String, DateTime) onSubmit;

  const TaskForm(this.onSubmit, {super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;

    // ignore: unnecessary_null_comparison
    if (title.isEmpty || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Card(
      elevation: 5,
      // ignore: prefer_const_constructors
      child: Padding(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              onSubmitted: (_) => _submitForm(),
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            const SizedBox(height: 20),
            // ignore: sized_box_for_whitespace
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      // ignore: unnecessary_null_comparison
                      _selectedDate == null
                          ? 'Nenhuma data de entrega selecionada!'
                          : 'Data de entrega selecionada: ${DateFormat('dd/MM/y').format((_selectedDate))}',
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all<Color>(
                          Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: _showDatePicker,
                    // ignore: prefer_const_constructors
                    child: Text(
                      'Selecionar data',
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // ignore: sized_box_for_whitespace
            Container(
              height: 60,
              width: 60,
              child: IconButton(
                onPressed: () => _submitForm(),
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        Theme.of(context).colorScheme.primary)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
