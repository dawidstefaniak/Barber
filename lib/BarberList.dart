class Barber{
  final String name;
  final String address;

  Barber({this.name, this.address});

  factory Barber.fromJson(Map<String, dynamic> json)
  {
    return Barber(
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

class BarberList {
  final List<Barber> barbers;
  BarberList({
  this.barbers});

  factory BarberList.fromJson(Map<String, dynamic> parsedJson){
    var barbersFromJson = parsedJson['barbers'] as List;
    List<Barber> barbersList = barbersFromJson.map((i) =>Barber.fromJson(i)).toList();
    return new BarberList(
      barbers: barbersList
    );
  }
}