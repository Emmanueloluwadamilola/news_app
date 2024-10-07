
import 'package:flutter/material.dart';

class ModalCenterDrag extends StatelessWidget {
  const ModalCenterDrag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context);
    return Center(
      child: Container(
        height: 8,
        width: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0XFFE3E6E9),),
      ),
    );
  }
}