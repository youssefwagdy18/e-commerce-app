import 'package:flutter/material.dart';

class CustomizedRowBar extends StatelessWidget {
  final String name;
  const CustomizedRowBar({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextButton(
            onPressed: () {
              //todo is to view all categories
            },
            child: Text(
              'view all',
              style: Theme.of(context).textTheme.bodySmall,
            ))
      ],
    );
  }
}
