class Task {
  int? id;
   String? title;
  int? isDone;

  Task({
    this.id,
     this.title,
    this.isDone,
  });

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isDone = json['isDone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['isDone'] = isDone;
    return data;
  }
}
