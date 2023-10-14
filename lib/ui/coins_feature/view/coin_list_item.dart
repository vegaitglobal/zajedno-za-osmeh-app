import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gu_mobile/domain/coins_feature/model/coin_model.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class CoinListItem extends StatelessWidget {
  final CoinModel coin;

  const CoinListItem({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(coin.image),
      title: Text(coin.name),
      subtitle:
          Text('${coin.symbol} - \$${coin.currentPrice.toStringAsFixed(2)}'),
      onTap: () {
        // Handle tap on the list item
      },
    );
  }
}

class CoinListItemWithBorder extends StatelessWidget {
  final CoinModel coin;

  const CoinListItemWithBorder({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8), // Optional margin for spacing
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16), // Set border radius
        border: Border.all(color: Colors.grey), // Set border color
        boxShadow: const [
          BoxShadow(
            color: Colors.white, // Set shadow color
            spreadRadius: 2, // Set spread radius
            blurRadius: 5, // Set blur radius
            offset: Offset(0, 2), // Set shadow offset
          ),
        ],
      ),
      child: ListTile(
        leading: Image.network(coin.image),
        title: Text(coin.name),
        subtitle:
            Text('${coin.symbol} - \$${coin.currentPrice.toStringAsFixed(2)}'),
        trailing: kIsWeb
            ? const Icon(Icons.arrow_forward_ios) // Arrow icon for web
            : const Icon(Icons.arrow_forward), // Default arrow icon for mobile
        // Add other content for your list item here
      ),
    );
  }
}
