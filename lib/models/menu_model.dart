import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String id;
  final String name;
  final int price;
  final String category;
  final double discount;
  final int quantity; // ⬅️ tambahan

  const Order({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    this.discount = 0.0,
    this.quantity = 1, // ⬅️ default quantity
  });

  Order copyWith({
    String? id,
    String? name,
    int? price,
    String? category,
    double? discount,
    int? quantity,
  }) {
    return Order(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      category: category ?? this.category,
      discount: discount ?? this.discount,
      quantity: quantity ?? this.quantity, // ⬅️ jangan lupa
    );
  }

  @override
  List<Object?> get props => [id, name, price, category, discount, quantity];

  int get discountedPrice {
    return (price - (price * discount)).toInt();
  }
}
