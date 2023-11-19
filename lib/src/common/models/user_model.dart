class UserModel {
  final Address address;
  final int id;
  final String email;
  final String username;
  final String password;
  final Name name;
  final String phone;

  const UserModel({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
  });

  Map<String, Object?> toMap() {
    return {
      'address': address.toMap(),
      'id': id,
      'email': email,
      'username': username,
      'password': password,
      'name': name.toMap(),
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, Object?> map) {
    return UserModel(
      address: Address.fromMap((map['address'] as Map).cast<String, Object?>()),
      id: map['id'] as int,
      email: map['email'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      name: Name.fromMap((map['name'] as Map).cast<String, Object?>()),
      phone: map['phone'] as String,
    );
  }

  static List<UserModel> fromDynamicToList(dynamic data) {
    return (data as List)
        .cast<Map>()
        .map((e) => UserModel.fromMap(e.cast<String, Object?>()))
        .toList();
  }

  @override
  String toString() {
    return 'UserModel{address: ${address.toString()}, id: $id, email: $email, '
        'username: $username, password: $password, name: ${name.toString()}, '
        'phone: $phone}';
  }
}

class Name {
  final String firstName;
  final String lastName;

  const Name({
    required this.firstName,
    required this.lastName,
  });

  Map<String, Object?> toMap() {
    return {
      'firstname': firstName,
      'lastname': lastName,
    };
  }

  factory Name.fromMap(Map<String, Object?> map) {
    return Name(
      firstName: map['firstname'] as String,
      lastName: map['lastname'] as String,
    );
  }

  @override
  String toString() => 'Name{firstName: $firstName, lastName: $lastName}';
}

class Address {
  final Geolocation geolocation;
  final String city;
  final String street;
  final int number;
  final String zipcode;

  const Address({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  Map<String, Object?> toMap() {
    return {
      'geolocation': geolocation.toMap(),
      'city': city,
      'street': street,
      'number': number,
      'zipcode': zipcode,
    };
  }

  factory Address.fromMap(Map<String, Object?> map) {
    return Address(
      geolocation: Geolocation.fromMap(
          (map['geolocation'] as Map).cast<String, Object?>()),
      city: map['city'] as String,
      street: map['street'] as String,
      number: map['number'] as int,
      zipcode: map['zipcode'] as String,
    );
  }

  @override
  String toString() {
    return 'Address{geolocation: $geolocation, city: $city, street: $street, '
        'number: $number, zipcode: $zipcode}';
  }
}

class Geolocation {
  final String lat;
  final String long;

  const Geolocation({
    required this.lat,
    required this.long,
  });

  Map<String, Object?> toMap() {
    return {
      'lat': lat,
      'long': long,
    };
  }

  factory Geolocation.fromMap(Map<String, Object?> map) {
    return Geolocation(
      lat: map['lat'] as String,
      long: map['long'] as String,
    );
  }

  @override
  String toString() => 'Geolocation{lat: $lat, long: $long}';
}
