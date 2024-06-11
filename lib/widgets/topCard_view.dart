import 'package:flutter/material.dart';

import '../style/style.dart';

class TopCardView extends StatelessWidget {
  const TopCardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        alignment: Alignment.center,
        height: 80,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorGreen,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('09'), Text('New Task')],
        ),
      ),
    );
  }
}
