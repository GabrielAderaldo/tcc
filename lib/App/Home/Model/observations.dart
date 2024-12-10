class Observation {
  final String? observation;
  final String? whoIsObservingId;
  final String? id;

  Observation({required this.observation,required this.whoIsObservingId,required this.id});

  factory Observation.fromJson(Map<String,dynamic> json){
    return Observation(observation: json['observation'], whoIsObservingId: json['whoIsObservingId'], id: json['_id']);
  }
}