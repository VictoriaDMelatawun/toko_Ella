class Order {
  final String id;
  final DateTime orderDate;
  final List<Map<String, dynamic>> items;
  final double totalAmount;
  final String status;

  Order({
    required this.id,
    required this.orderDate,
    required this.items,
    required this.totalAmount,
    this.status = 'Pending',
  });
}
