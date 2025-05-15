class DetailDataModel {
  final String name;
  final String title;
  final String text;
  final String img;
  final String time;
  final int prize;

  DetailDataModel({
    required this.name,
    required this.title,
    required this.text,
    required this.img,
    required this.time,
    required this.prize,
  });

  factory DetailDataModel.fromJson(Map<String, dynamic> json) {
    return DetailDataModel(
      name: json['name'] as String,
      title: json['title'] as String,
      text: json['text'] as String,
      img: json['img'] as String,
      time: json['time'] as String,
      prize: int.tryParse(json['prize'].toString()) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'text': text,
      'img': img,
      'time': time,
      'prize': prize,
    };
  }
}
