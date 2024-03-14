import 'package:flutter/material.dart';

class SchedulesMenuButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final List<String> menuItems;
  final void Function(int value) onSelectedChanged;

  const SchedulesMenuButton({
    required this.icon,
    required this.label,
    required this.menuItems,
    required this.onSelectedChanged,
    super.key,
  });

  @override
  State<SchedulesMenuButton> createState() => _SchedulesMenuButtonState();
}

class _SchedulesMenuButtonState extends State<SchedulesMenuButton> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return SubmenuButton(
      menuChildren: List<Widget>.from(
        widget.menuItems.map(
          (String item) {
            return RadioListTile(
              title: MenuAcceleratorLabel(item),
              groupValue: _selected,
              value: widget.menuItems.indexOf(item),
              onChanged: (int? value) {
                setState(() {
                  _selected = value ?? 0;
                });
                widget.onSelectedChanged(_selected);
              },
            );
          },
        ),
      ),
      child: Row(
        children: [
          Icon(widget.icon),
          MenuAcceleratorLabel(widget.label),
        ],
      ),
    );
  }
}
