import 'package:flutter/material.dart';

class GovLogo extends StatelessWidget {
  const GovLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Image.asset(
        'assets/imgs/logo_gov.png',
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : null,
      ),
    );
  }
}
