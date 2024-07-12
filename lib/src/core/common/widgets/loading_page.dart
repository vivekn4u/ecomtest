import 'package:flutter/material.dart';

///Indicator to display loading progress.
///
class ProgressIndicatorWidget extends StatelessWidget {
  ///Creates a progress indicator.
  ///
  const ProgressIndicatorWidget({super.key, this.progressWidget});

  final Widget? progressWidget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 24,
        height: 24,
        padding: const EdgeInsets.all(2.0),
        child: progressWidget ??
            const CircularProgressIndicator(
              color: Colors.black,
              // strokeWidth: 3,
            ),
      ),
    );
  }
}
