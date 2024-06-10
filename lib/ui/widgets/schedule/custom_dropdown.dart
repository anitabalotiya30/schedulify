import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final List<String> list;
  final String label;
  final TextEditingController? c;
  final Function(String?)? onSelect;

  const CustomDropDown({
    super.key,
    required this.list,
    required this.label,
    this.c,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) => DropdownMenu<String>(
        controller: c,
        textStyle: const TextStyle(fontSize: 16),
        expandedInsets: const EdgeInsets.symmetric(horizontal: 0),
        trailingIcon: const Icon(Icons.keyboard_arrow_down_outlined, size: 28),
        label: Text(label),

        // Descriptions of the menu items
        dropdownMenuEntries: list
            .map<DropdownMenuEntry<String>>((String value) =>
                DropdownMenuEntry<String>(value: value, label: value))
            .toList(),

        //
        inputDecorationTheme: InputDecorationTheme(
          constraints: BoxConstraints.tight(const Size.fromHeight(45)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),

        // menu theme
        menuStyle: MenuStyle(
          shape: WidgetStateProperty.all<OutlinedBorder>(
              const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(12)))),

          //
          elevation: WidgetStateProperty.all<double>(.5),
          backgroundColor: WidgetStateProperty.all<Color>(
            const Color(0XFFf8f9fa),
          ),
        ),

        // This is called when the user selects an item.
        onSelected: onSelect,
      );
}
