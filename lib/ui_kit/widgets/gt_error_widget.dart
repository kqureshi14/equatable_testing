import 'package:flutter/material.dart';

class GTErrorWidget extends StatelessWidget {
  const GTErrorWidget({
    required this.errorMessage,
    this.onReload,
    Key? key,
  }) : super(key: key);

  final String errorMessage;
  final VoidCallback? onReload;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        child: Row(
          children: [
            Flexible(
              child: Text(errorMessage),
            ),
            IconButton(
              onPressed: onReload,
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}
