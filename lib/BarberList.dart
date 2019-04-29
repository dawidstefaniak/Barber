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