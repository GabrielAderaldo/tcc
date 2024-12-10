class Rg {
  final String? issueDate;
  final String? issuingBody;
  final String? number;
  final String? uf;
  final String? id;

  Rg({required this.issueDate, required this.issuingBody,required this.number,required this.uf,required this.id});

  factory Rg.fromJson(Map<String,dynamic> json){
    return Rg(issueDate: json['issueDate'], issuingBody: json['issuingBody'], number: json['number'], uf: json['uf'], id: json['_id']);
  }
  
}