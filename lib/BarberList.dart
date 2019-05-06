class BarberOwn{
  final String name;
  final String address;

  BarberOwn({this.name, this.address});

  factory BarberOwn.fromJson(Map<String, dynamic> json)
  {
    return BarberOwn(
        name : json['name'] as String,
        address: json['address'] as String
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'name' : name,
        'address' : address,
      };
}


class BarberListOwn {
  final List<BarberOwn> barbers;
  BarberListOwn({
  this.barbers});

  factory BarberListOwn.fromJson(Map<String, dynamic> parsedJson){
    var barbersFromJson = parsedJson['barbers'] as List;
    List<BarberOwn> barbersList = barbersFromJson.map((i) =>BarberOwn.fromJson(i)).toList();
    return new BarberListOwn(
      barbers: barbersList
    );
  }

  //Map<String, dynamic> toJson() =>
      //_$BarberListToJson(this);

}