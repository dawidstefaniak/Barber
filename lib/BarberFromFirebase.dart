import 'package:cloud_firestore/cloud_firestore.dart';

class Barber extends Object {
  final String name;
  final String address;
  final String icon;
  final String phone;
  final DocumentReference reference;
  final List<String> images; 

  Barber.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['address'] != null),
        assert(map['icon'] != null),
        assert(map['phone'] != null),
        assert(map['images'] != null),
        name = map['name'],
        address = map['address'],
        icon = map['icon'],
        phone = map['phone'],
        images = map['images'].cast<String>();
        

  Barber.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

}

class BarberImage extends Object {
  final String link;

  BarberImage(this.link);
}
