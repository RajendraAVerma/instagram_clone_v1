class Following {
  final String id;
  final String date;

  Following({
    required this.id,
    required this.date,
  });

  factory Following.fromJson(Map<String, dynamic> data) {
    return Following(id: data['id'], date: data['date']);
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['date'] = date;
    return data;
  }
}
