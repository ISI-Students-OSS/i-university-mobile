class MotPresident {

  final int id;
  final String image;
  final String mot;

  MotPresident({this.id, this.image, this.mot});

  factory MotPresident.fromJson(Map<String, dynamic> json) {
    return MotPresident(
      id: json['id'],
      image: json['image'],
      mot: json['mot'],
    );
  }
}