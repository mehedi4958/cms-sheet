class Product {
  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.description,
  });

  final String id;
  final String name;
  final double price;
  final String category;
  final String description;

  /// Creates a Product from a sheet row
  /// A row is a List<dynamic> where each index maps to a column of the row
  factory Product.fromSheetRow(List<dynamic> row) {
    return Product(
      id: row[0].toString(),
      name: row[1].toString(),
      price: double.parse(row[2].toString()),
      category: row[3].toString(),
      description: row[4].toString(),
    );
  }

  /// Converts a Product to a row of the sheet for writing
  List<dynamic> toSheet() {
    return [id, name, price.toString(), category, description];
  }

  @override
  String toString() => 'Product(id: $id, name: $name, price: $price)';
}
