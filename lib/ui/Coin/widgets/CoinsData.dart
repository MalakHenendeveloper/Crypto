import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';

class CoinsData extends StatelessWidget {
  final HomeResponseEntity view;

  const CoinsData({Key? key, required this.view}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow("🏆 ATH:", "\$${view.ath?.toStringAsFixed(2)}", Colors.orange),
          _buildDetailRow("📉 ATH Change:", "${view.athChangePercentage?.toStringAsFixed(2)}%", Colors.red),
          _buildDetailRow("🔄 Circulating Supply:", view.circulatingSupply?.toStringAsFixed(0) ?? "--", Colors.blue),
          _buildDetailRow("💰 Total Supply:", view.totalSupply?.toStringAsFixed(0) ?? "--", Colors.green),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String title, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }
}

