import 'package:flutter/material.dart';
import 'package:schedules/schedules_menu_button.dart';

class SchedulesMenuBar extends StatefulWidget {
  final void Function(int value) onSelectedFilterChanged;
  final void Function(int value) onSelectedSortChanged;

  const SchedulesMenuBar({
    super.key,
    required this.onSelectedFilterChanged,
    required this.onSelectedSortChanged,
  });

  @override
  State<StatefulWidget> createState() => _SchedulesMenuBar();
}

class _SchedulesMenuBar extends State<SchedulesMenuBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Spacer(),
        SchedulesMenuButton(
          icon: Icons.filter_alt_outlined,
          label: '&Filter',
          menuItems: const <String>[
            'A&ll',
            '&Pending',
            '&In Progress',
            '&Completed',
            'Cancelle&d',
            'Fail&ed',
          ],
           onSelectedChanged: widget.onSelectedFilterChanged,
        ),
        const SizedBox(width: 10),
        SchedulesMenuButton(
          icon: Icons.sort_outlined,
          label: '&Sort',
          menuItems: const [
            '&New to Old',
            '&Old to New',
            '&A to Z',
            '&Z to A',
          ],
          onSelectedChanged: widget.onSelectedSortChanged,
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
