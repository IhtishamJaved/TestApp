class HomeModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  HomeModel({this.userId, this.id, this.title, this.body});

  HomeModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}
