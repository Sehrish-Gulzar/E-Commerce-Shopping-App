import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../authentication/models/address_model.dart';
import 'cart_item_model.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  OrderModel(
      {required this.id,
      this.userId = '',
      required this.status,
      required this.items,
      required this.totalAmount,
      required this.orderDate,
      this.paymentMethod = 'Paypal',
      this.address,
      this.deliveryDate});

  String get formattedOrderDate =>
      SgHelperFunctions.getFormattedDate(orderDate);

  String get formattedDeliveryDate =>
      SgHelperFunctions.getFormattedDate(deliveryDate!) ?? '';

  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipment on the way'
          : 'Processing';

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'UserId': userId,
      'Status': status.toString(), // Enum to string
      'TotalAmount': totalAmount,
      'OrderDate': orderDate,
      'PaymentMethod': paymentMethod,
      'Address': address?.toJson(), // convert address model to map
      'DeliveryDate': deliveryDate,
      'Items': items
          .map(
            (item) => item.toJson(),
          )
          .toList() // convert CartItemModel to map
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return OrderModel(
      id: data['Id'] as String,
      userId: data['UserId'] as String,
      status: OrderStatus.values.firstWhere(
        (element) => element.toString() == data['Status'],
      ),
      totalAmount: data['TotalAmount'] as double,
      orderDate: (data['OrderDate'] as Timestamp).toDate(),
      paymentMethod: data['PaymentMethod'] as String,
      address: AddressModel.fromMap(data['Address'] as Map<String, dynamic>),
      deliveryDate: data['DeliveryDate'] == null
          ? null
          : (data['DeliveryDate'] as Timestamp).toDate(),
      items: (data['Items'] as List<dynamic>)
          .map(
            (itemData) =>
                CartItemModel.fromJson(itemData as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}
