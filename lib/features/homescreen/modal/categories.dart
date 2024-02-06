class Categories {
  String? type;
  String? title;
  List<Contents>? contents;
  String? id;

  Categories({this.type, this.title, this.contents, this.id});

  Categories.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    if (json['contents'] != null) {
      contents = <Contents>[];
      json['contents'].forEach((v) {
        contents!.add(new Contents.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['title'] = this.title;
    if (this.contents != null) {
      data['contents'] = this.contents!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

class Contents {
  String? title;
  String? imageUrl;

  Contents({this.title, this.imageUrl});

  Contents.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
