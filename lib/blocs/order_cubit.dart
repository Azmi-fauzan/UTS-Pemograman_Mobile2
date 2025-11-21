import 'package:bloc/bloc.dart';
import '../models/menu_model.dart';

class OrderCubit extends Cubit<List<Order>> {
  OrderCubit() : super([]);

  // ============================================================
  // ADD ORDER
  // ============================================================
void addOrder(
  String name,
  int price,
  String category,
  double discount,       // ⬅️ tambahkan ini
  {int quantity = 1}
) {
  final newOrder = Order(
    id: DateTime.now().millisecondsSinceEpoch.toString(),
    name: name,
    price: price,
    category: category,
    discount: discount,  // ⬅️ isi nilai diskon ke model
    quantity: quantity,
  );

  emit([...state, newOrder]);
}


  // ============================================================
  // REMOVE ORDER
  // ============================================================
  void removeOrder(String id) {
    emit(state.where((order) => order.id != id).toList());
  }

  // ============================================================
  // UPDATE QUANTITY
  // ============================================================
  void updateQuantity(String id, int newQuantity) {
    final updatedList = state.map((order) {
      if (order.id == id) {
        return order.copyWith(quantity: newQuantity);
      }
      return order;
    }).toList();

    emit(updatedList);
  }

  // ============================================================
  // CLEAR ALL ORDERS
  // ============================================================
  void clearOrders() {
    emit([]);
  }

  // ============================================================
  // GET TOTAL PRICE
  // ============================================================
  int getTotalPrice() {
    int total = 0;

    for (var order in state) {
      total += (order.discountedPrice * order.quantity);
    }

    return total;
  }
}
