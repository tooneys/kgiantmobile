import 'package:cloud_firestore/cloud_firestore.dart';

class MonthlySummaryModel {
  String month;
  String product;
  int qty;
  int amount;

  MonthlySummaryModel({
    required this.month,
    required this.product,
    required this.qty,
    required this.amount,
  });

  static MonthlySummaryModel empty() => MonthlySummaryModel(month: '', product: '', qty: 0, amount: 0);

  /// Convert Model to Json Structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Month': month,
      'Product': product,
      'Qty': qty,
      'Amount': amount,
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory MonthlySummaryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return MonthlySummaryModel(
        month: data['Month'] ?? '',
        product: data['Product'] ?? '',
        qty: data['Qty'] ?? 0,
        amount: data['Amount'] ?? 0,
      );
    } else {
      return MonthlySummaryModel.empty();
    }
  }
}
