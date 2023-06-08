import 'package:flutter/material.dart';

class ExpandButton extends StatelessWidget {
  const ExpandButton({
    super.key,
    required this.action,
    required this.expand,
  });

  final bool expand;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: action,
          child: Row(
            children: [
              expand
                  ? Container()
                  : Text(
                      'Ver mais',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
              expand == true
                  ? Icon(
                      Icons.expand_less,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : Icon(
                      Icons.expand_more,
                      color: Theme.of(context).colorScheme.primary,
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
