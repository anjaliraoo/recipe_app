class RecipeModel {
  String label;
  String image;
  String source;
  String url;

  RecipeModel(
      {required this.url,
      required this.image,
      required this.source,
      required this.label});

  // factory RecipeModel.fromMap()
}
