import 'package:dw_barbershop/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class WeekdaysPanel extends StatelessWidget {
  final ValueChanged<String> onDayPressed;
  final List<String>? enabledDays;

  const WeekdaysPanel({
    super.key,
    required this.onDayPressed,
    this.enabledDays,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Selecione os dias da semana',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ButtonDay(
                label: 'Seg',
                enabledDays: enabledDays,
                onDayPressed: onDayPressed,
              ),
              ButtonDay(
                label: 'Ter',
                enabledDays: enabledDays,
                onDayPressed: onDayPressed,
              ),
              ButtonDay(
                label: 'Qua',
                enabledDays: enabledDays,
                onDayPressed: onDayPressed,
              ),
              ButtonDay(
                label: 'Qui',
                enabledDays: enabledDays,
                onDayPressed: onDayPressed,
              ),
              ButtonDay(
                label: 'Sex',
                enabledDays: enabledDays,
                onDayPressed: onDayPressed,
              ),
              ButtonDay(
                label: 'Sab',
                enabledDays: enabledDays,
                onDayPressed: onDayPressed,
              ),
              ButtonDay(
                label: 'Dom',
                enabledDays: enabledDays,
                onDayPressed: onDayPressed,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ButtonDay extends StatefulWidget {
  const ButtonDay({
    super.key,
    required this.label,
    required this.onDayPressed,
    this.enabledDays,
  });
  final String label;
  final ValueChanged<String> onDayPressed;
  final List<String>? enabledDays;

  @override
  State<ButtonDay> createState() => _ButtonDayState();
}

class _ButtonDayState extends State<ButtonDay> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    final textColor = selected ? Colors.white : ColorsConstants.grey;
    var buttonColor = selected ? ColorsConstants.brow : Colors.white;
    final buttonBorderColor =
        selected ? ColorsConstants.brow : ColorsConstants.grey;

    final ButtonDay(:enabledDays, :label) = widget;

    final disableDay = enabledDays != null && !enabledDays.contains(label);

    if (disableDay) {
      buttonColor = Colors.grey[400]!;
    }

    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: disableDay
            ? null
            : () {
                widget.onDayPressed(label);
                setState(() {
                  selected = !selected;
                });
              },
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Container(
          width: 40,
          height: 56,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: buttonColor,
              border: Border.all(color: buttonBorderColor)),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 12, color: textColor, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
