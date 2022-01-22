class Followers {
  final String id;
  final String date;

  Followers({
    required this.id,
    required this.date,
  });

  factory Followers.fromJson(Map<String, dynamic> data) {
    return Followers(id: data['id'], date: data['date']);
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['date'] = date;
    return data;
  }
}
