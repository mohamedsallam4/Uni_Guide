// lib/data/models/university_model.dart

class University {
  final String name;
  final String country;
  final List<String> webPages;
  final String? domain; // ممكن يكون null لو مفيش دومين

  University({
    required this.name,
    required this.country,
    required this.webPages,
    this.domain,
  });

  // factory من JSON — بنستخدمها لتحويل الرد من الـ API لموديل
  factory University.fromJson(Map<String, dynamic> json) {
    // API بترجع "domains" كقائمة و "web_pages" كقائمة
    final domains = (json['domains'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList();
    final webPages = (json['web_pages'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        <String>[];

    return University(
      name: (json['name'] as String?) ?? '',
      country: (json['country'] as String?) ?? '',
      webPages: webPages,
      domain: (domains != null && domains.isNotEmpty) ? domains.first : null,
    );
  }
}
