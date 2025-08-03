import 'package:flutter/material.dart';

class AppPopupMenuButton extends StatelessWidget {
  final List<OptionModel> options;
  final ValueChanged<String> onSelected;

  const AppPopupMenuButton({
    super.key,
    required this.options,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onSelected,
      itemBuilder:
          (BuildContext context) =>
              options
                  .map(
                    (option) => PopupMenuItem<String>(
                      value: option.name,
                      child: ListTile(
                        leading: Icon(option.icon),
                        title: Text(option.name),
                      ),
                    ),
                  )
                  .toList(),
    );
  }
}

class OptionModel {
  final String name;
  final IconData? icon;

  OptionModel({required this.name, this.icon});
}
