class RecipeModel {
  String label;
  String image;
  String source;
  String url;

  RecipeModel(
      {this.url = "", this.image = "", this.source = "", this.label = ""});

  factory RecipeModel.fromMap(Map<String, dynamic> parsedJson) {
    return RecipeModel(
        url: parsedJson["url"],
        image: parsedJson["image"],
        source: parsedJson["source"],
        label: parsedJson["label"]);
  }
}
