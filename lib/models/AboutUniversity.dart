class AboutUniversity {

  final int id;
  final String image;
  final String mot;

  AboutUniversity({this.id, this.image, this.mot});

  factory AboutUniversity.fromJson(Map<String, dynamic> json) {
    return AboutUniversity(
      id: json['id'],
      image: json['image'],
      mot: json['mot'],
    );
  }
}