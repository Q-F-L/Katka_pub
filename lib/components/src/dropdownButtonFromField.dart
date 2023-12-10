import 'package:flutter/material.dart';

class DdBFFC extends StatefulWidget {
  const DdBFFC({super.key});

  @override
  State<DdBFFC> createState() => _DdBFFCState();
}

class _DdBFFCState extends State<DdBFFC> {
  List<String> _list = ['Список', 'Список1', 'Список2', 'Список3'];
  String _selectedItem = 'Список';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 41, 42, 44),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField(
        menuMaxHeight: 10,
        elevation: 0,
        borderRadius: BorderRadius.circular(8),
        dropdownColor: Color.fromARGB(255, 41, 42, 44),
        hint: Text(
          'list',
          style: TextStyle(
            color: Color.fromARGB(255, 164, 165, 167),
            fontFamily: "Inter",
            fontSize: 16,
          ),
        ),
        onChanged: (data) {
          print(data);
          setState(() {
            _selectedItem = data!;
          });
        },
        decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 41, 42, 44),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
        ),
        items: _list.map((list) {
          return DropdownMenuItem(
            child: Text(
              list,
              style: TextStyle(
                color: Color.fromARGB(255, 164, 165, 167),
                fontFamily: "Inter",
                fontSize: 16,
              ),
            ),
            value: list,
          );
        }).toList(),
        value: _selectedItem,
      ),
    );
  }
}
