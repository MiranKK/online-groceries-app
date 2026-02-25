class CardModel {
  final String image;
  final String title;
  final double price;
  final String? productDetail;
  final String? review;
  int? quantity;

  CardModel({
    required this.image,
    required this.title,
    required this.price,
    this.productDetail,
    this.review,
    this.quantity,
  });

  num get totalPrice => (quantity ?? 0) * price;
}
