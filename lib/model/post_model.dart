class Post {
  final int id;
  final String title;
  final String des;

  Post({
    required this.id,
    required this.title,
    required this.des,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      des: json['des'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'des': des,
    };
  }
}
