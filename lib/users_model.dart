class UsersModel {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<Data>? data;
  final Support? support;

  UsersModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  UsersModel.fromJson(Map<String, dynamic> json)
      : page = json['page'] as int?,
        perPage = json['per_page'] as int?,
        total = json['total'] as int?,
        totalPages = json['total_pages'] as int?,
        data = (json['data'] as List?)
            ?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>))
            .toList(),
        support = (json['support'] as Map<String, dynamic>?) != null
            ? Support.fromJson(json['support'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
    'page': page,
    'per_page': perPage,
    'total': total,
    'total_pages': totalPages,
    'data': data?.map((e) => e.toJson()).toList(),
    'support': support?.toJson()
  };
}

class Data {
  final int? id;
  final String? title;
  final String? url;
  final String? image_url;
  final String? news_site;
  final String? summary;
  final String? published_at;
  final String? updated_at;

  Data({
    this.id,
    this.title,
    this.url,
    this.image_url,
    this.news_site,
    this.summary,
    this.published_at,
    this.updated_at,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        url = json['url'] as String?,
        image_url = json['image_url'] as String?,
        news_site = json['news_site'] as String?,
        summary = json['avatar'] as String?,
        published_at = json['published_at'] as String?,
        updated_at = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'url': url,
    'image_url': image_url,
    'news_site': news_site,
    'summary': summary,
    'published_at': published_at,
    'updated_at': updated_at
  };
}

class Support {
  final String? url;
  final String? text;

  Support({
    this.url,
    this.text,
  });

  Support.fromJson(Map<String, dynamic> json)
      : url = json['url'] as String?,
        text = json['text'] as String?;

  Map<String, dynamic> toJson() => {'url': url, 'text': text};
}