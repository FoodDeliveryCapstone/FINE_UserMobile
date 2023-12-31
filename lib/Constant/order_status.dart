import 'package:fine/Model/DTO/OrderDTO.dart';

class OrderStatus {
  int? statusCode;
  int? code;
  String? message;
  OrderDTO? order;

  OrderStatus({
    this.statusCode,
    this.code,
    this.message,
    this.order,
  });
}

enum OrderFilter { NEW, ORDERING, DONE }
