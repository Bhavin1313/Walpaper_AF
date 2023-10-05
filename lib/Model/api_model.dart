class ApiModel {
  int id;
  int userId;
  String body;
  String title;

  ApiModel({
    required this.title,
    required this.body,
    required this.id,
    required this.userId,
  });

  factory ApiModel.formJSON({required Map data}) {
    return ApiModel(
      title: data['title'],
      body: data['body'],
      id: data['id'],
      userId: data['userId'],
    );
  }
}
