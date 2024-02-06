class ProductContent {
  String? sku;
  String? productName;
  String? productImage;
  int? productRating;
  String? actualPrice;
  String? offerPrice;
  String? discount;

  ProductContent(
      {this.sku,
      this.productName,
      this.productImage,
      this.productRating,
      this.actualPrice,
      this.offerPrice,
      this.discount});

  ProductContent.fromJson(Map<String, dynamic> json) {
    sku = json['sku'];
    productName = json['product_name'];
    productImage = json['product_image'];
    productRating = json['product_rating'];
    actualPrice = json['actual_price'];
    offerPrice = json['offer_price'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sku'] = this.sku;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    data['product_rating'] = this.productRating;
    data['actual_price'] = this.actualPrice;
    data['offer_price'] = this.offerPrice;
    data['discount'] = this.discount;
    return data;
  }
}
