class Task {
  int? id;
   String? title;
  int? isDone;

  Task({
    this.id,
     this.title,
    this.isDone,
  });

  // Task.fromJson(Map<String, dynamic> json):
  //       id = json['id'],
  //       title = json['title'],
  //       isDone = json['isDone'];

  /*Below is an implementation of an static method That can convert JSON  data to map data. */
  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isDone = json['isDone'];
  }



  /*Below is an implementation of factory method to convert Json format data of a data model to map data type(model class)*/
  // factory Task.fromJson(Map<String, dynamic> json) {
  //   return Task(
  //     id: json['id'],
  //     title: json['title'],
  //     isDone: json['isDone'],
  //   );
  // }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['isDone'] = isDone;
    return data;
  }
}
