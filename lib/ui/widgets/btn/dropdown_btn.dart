
// class CustomDropdown extends StatelessWidget {
//   final Function(DropDownItems?)? onSelected;
//   final DropDownItems initialSelection;
//   final List<DropDownItems> items;

//   const CustomDropdown(
//       {super.key,
//       required this.onSelected,
//       required this.items,
//       required this.initialSelection});

//   @override
//   Widget build(BuildContext context) {
//     return DropdownMenu<DropDownItems>(
//         onSelected: onSelected,
//         trailingIcon: const Icon(CupertinoIcons.chevron_down, size: 18),
//         initialSelection: initialSelection,
//         expandedInsets: const EdgeInsets.only(right: 0),
//         selectedTrailingIcon: const Icon(CupertinoIcons.chevron_up, size: 18),

//         //
//         inputDecorationTheme: const InputDecorationTheme(
//             isDense: true,
//             filled: true,

//             //
//             enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: borderColor),
//                 borderRadius: BorderRadius.all(Radius.circular(10)))),

//         //
//         menuStyle: MenuStyle(
//             //
//             shape: WidgetStateProperty.all<OutlinedBorder>(
//                 const RoundedRectangleBorder(
//                     side: BorderSide(color: Colors.black12),
//                     borderRadius: BorderRadius.all(Radius.circular(12)))),

//             //
//             surfaceTintColor:
//                 WidgetStateProperty.all<Color>(Colors.transparent),

//             //
//             elevation: WidgetStateProperty.all<double>(0),
//             // backgroundColor: WidgetStateProperty.all<Color>(cardColor)),

//         //
//         dropdownMenuEntries: items.map<DropdownMenuEntry<DropDownItems>>((e) {
//           return DropdownMenuEntry<DropDownItems>(value: e, label: e.title);
//         }).toList()));
//   }
// }