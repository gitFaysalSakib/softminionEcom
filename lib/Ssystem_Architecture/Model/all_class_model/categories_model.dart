import 'package:get/get.dart';

class CategoriesModelData {
  RxInt id;
  RxString name;
  RxString slug;
  RxInt parent;
  RxString description;
  RxString display;
  Rx<Image?> image;
  RxInt menuOrder;
  RxInt count;
  Rx<Links?> lLinks;

  CategoriesModelData({
    int? id,
    String? name,
    String? slug,
    int? parent,
    String? description,
    String? display,
    Image? image,
    int? menuOrder,
    int? count,
    Links? lLinks,
  })  : id = RxInt(id ?? 0),
        name = RxString(name ?? ''),
        slug = RxString(slug ?? ''),
        parent = RxInt(parent ?? 0),
        description = RxString(description ?? ''),
        display = RxString(display ?? ''),
        image = Rx<Image?>(image),
        menuOrder = RxInt(menuOrder ?? 0),
        count = RxInt(count ?? 0),
        lLinks = Rx<Links?>(lLinks);

  CategoriesModelData.fromJson(Map<String, dynamic> json)
      : id = RxInt(json['id'] ?? 0),
        name = RxString(json['name'] ?? ''),
        slug = RxString(json['slug'] ?? ''),
        parent = RxInt(json['parent'] ?? 0),
        description = RxString(json['description'] ?? ''),
        display = RxString(json['display'] ?? ''),
        image = json['image'] != null
            ? Rx<Image?>(Image.fromJson(json['image']))
            : Rx<Image?>(null),
        menuOrder = RxInt(json['menu_order'] ?? 0),
        count = RxInt(json['count'] ?? 0),
        lLinks = json['_links'] != null
            ? Rx<Links?>(Links.fromJson(json['_links']))
            : Rx<Links?>(null);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.value;
    data['name'] = name.value;
    data['slug'] = slug.value;
    data['parent'] = parent.value;
    data['description'] = description.value;
    data['display'] = display.value;
    if (image.value != null) {
      data['image'] = image.value?.toJson();
    }
    data['menu_order'] = menuOrder.value;
    data['count'] = count.value;
    if (lLinks.value != null) {
      data['_links'] = lLinks.value?.toJson();
    }
    return data;
  }
}

class Image {
  RxInt id;
  RxString src;
  RxString name;
  RxString alt;

  Image({
    int? id,
    String? src,
    String? name,
    String? alt,
  })  : id = RxInt(id ?? 0),
        src = RxString(src ?? ''),
        name = RxString(name ?? ''),
        alt = RxString(alt ?? '');

  Image.fromJson(Map<String, dynamic> json)
      : id = RxInt(json['id'] ?? 0),
        src = RxString(json['src'] ?? ''),
        name = RxString(json['name'] ?? ''),
        alt = RxString(json['alt'] ?? '');

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.value;
    data['src'] = src.value;
    data['name'] = name.value;
    data['alt'] = alt.value;
    return data;
  }
}

class Links {
  RxList<LinkSelf> self;
  RxList<LinkCollection> collection;

  Links({List<LinkSelf>? self, List<LinkCollection>? collection})
      : self = RxList(self ?? []),
        collection = RxList(collection ?? []);

  Links.fromJson(Map<String, dynamic> json)
      : self = RxList((json['self'] as List<dynamic>)
            .map((e) => LinkSelf.fromJson(e as Map<String, dynamic>))
            .toList()),
        collection = RxList((json['collection'] as List<dynamic>)
            .map((e) => LinkCollection.fromJson(e as Map<String, dynamic>))
            .toList());

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['self'] = self.map((v) => v.toJson()).toList();
    data['collection'] = collection.map((v) => v.toJson()).toList();
    return data;
  }
}

class LinkSelf {
  RxString href;

  LinkSelf({String? href}) : href = RxString(href ?? '');

  LinkSelf.fromJson(Map<String, dynamic> json)
      : href = RxString(json['href'] ?? '');

  Map<String, dynamic> toJson() {
    return {'href': href.value};
  }
}

class LinkCollection {
  RxString href;

  LinkCollection({String? href}) : href = RxString(href ?? '');

  LinkCollection.fromJson(Map<String, dynamic> json)
      : href = RxString(json['href'] ?? '');

  Map<String, dynamic> toJson() {
    return {'href': href.value};
  }
}
