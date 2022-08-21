class CartItem {
  int id = DateTime.now().microsecondsSinceEpoch;
  String item;
  int price;
  bool selected;

  CartItem({required this.item, required this.price, required this.selected});
}
