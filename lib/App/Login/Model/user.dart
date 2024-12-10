class User {

  final int? id;
  final String? fullName;
  final String? email;
  final String? crm;
  final String? role;
  final bool? isActive;

  User({required this.id,required this.fullName,required this.email,required this.crm,required this.role, required this.isActive});


  factory User.fromJson(Map<String,dynamic> json){
   
    if(json['crm'] == null){
      return User(id: json['id'], fullName: json['fullName'], email: json['email'], crm: "null", role: json['role'], isActive: json['isActive']);
    }
    return User(id: json['id'], fullName: json['fullName'], email: json['email'], crm: json['crm'], role: json['role'], isActive: json['isActive']);
  }

}