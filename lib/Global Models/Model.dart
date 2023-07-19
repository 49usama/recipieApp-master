class recipesDB {
  var name;
  var url;
  var description;
  var author;
  List<String>? ingredients;
  List<String>? method;

  recipesDB(
      {this.name,
        this.url,
        this.description,
        this.author,
        this.ingredients,
        this.method});

  recipesDB.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    url = json['url'];
    description = json['Description'];
    author = json['Author'];
    ingredients = json['Ingredients'].cast<String>();
    method = json['Method'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['url'] = this.url;
    data['Description'] = this.description;
    data['Author'] = this.author;
    data['Ingredients'] = this.ingredients;
    data['Method'] = this.method;
    return data;
  }
}
