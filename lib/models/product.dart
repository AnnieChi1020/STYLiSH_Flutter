class Product {
  final int id;
  final String category;
  final String title;
  final String description;
  final int price;
  final String texture;
  final String wash;
  final String place;
  final String note;
  final String story;
  final List<Color> colors;
  final List<String> sizes;
  final List<Variant> variants;
  final String mainImage;
  final List<String> images;

  Product({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    required this.texture,
    required this.wash,
    required this.place,
    required this.note,
    required this.story,
    required this.colors,
    required this.sizes,
    required this.variants,
    required this.mainImage,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final List<Color> colors = (json['colors'] as List)
        .map((colorJson) => Color.fromJson(colorJson))
        .toList();

    final List<Variant> variants = (json['variants'] as List)
        .map((variantJson) => Variant.fromJson(variantJson))
        .toList();

    return Product(
      id: json['id'],
      category: json['category'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      texture: json['texture'],
      wash: json['wash'],
      place: json['place'],
      note: json['note'],
      story: json['story'],
      colors: colors,
      sizes: List<String>.from(json['sizes']),
      variants: variants,
      mainImage: json['main_image'],
      images: List<String>.from(json['images']),
    );
  }
}

class Color {
  final String code;
  final String name;

  Color({required this.code, required this.name});

  factory Color.fromJson(Map<String, dynamic> json) {
    return Color(code: json['code'], name: json['name']);
  }
}

class Variant {
  final String colorCode;
  final String size;
  final int stock;

  Variant({required this.colorCode, required this.size, required this.stock});

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      colorCode: json['color_code'],
      size: json['size'],
      stock: json['stock'],
    );
  }
}
