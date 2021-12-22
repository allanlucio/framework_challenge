import 'package:flutter/cupertino.dart';

import '../../../../../core/extensions/double_extensions.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);
  final double totalPrice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Total da compra: ${totalPrice.toBRLString()}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
