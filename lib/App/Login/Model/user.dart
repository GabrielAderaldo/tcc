class User {

  final String? name;
  final String? email;
  final String? registry;
  final int? age;
  final String? type;
  final String? id;

  User({required this.name, required this.email, required this.registry, required this.age, required this.type, required this.id});


  factory User.fromJson(Map<String,dynamic> json){
    final user = json['user'];
    return User(name: user['admName'], email: user['admEmail'], registry: user['registry'], age: user['admAge'], type: user['admType'], id: user['id']);
  }

}