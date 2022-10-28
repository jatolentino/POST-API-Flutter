import 'dart:convert'; 
 
DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str)); 
 
String dataModelToJson(DataModel data) => json.encode(data.toJson()); 
 
class DataModel { 
  String? name; 
  String? job; 
  String? id; 
  DateTime? createdAt; 
 
  DataModel({ 
    this.name, 
    this.job, 
    this.id, 
    this.createdAt, 
  }); 
 
  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel( 
        name: json["name"], 
        job: json["job"], 
        id: json["id"], 
        createdAt: DateTime.parse(json["createdAt"]), //DateTime.parse(json["createdAt"]), //json["createdAt"], 
      ); 
 
  Map<String, dynamic> toJson() => { 
        "name": name, 
        "job": job, 
        "id": id, 
        "createdAt": createdAt, 
      }; 
}
