class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final String lat;
  final String lng;
  final String phone;
  final String website;
  final String companyName;
  final String catchPhrase;
  final String bs;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.lat,
    required this.lng,
    required this.phone,
    required this.website,
    required this.companyName,
    required this.catchPhrase,
    required this.bs,
  });

  // Factory method to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      street: json['address']['street'],
      suite: json['address']['suite'],
      city: json['address']['city'],
      zipcode: json['address']['zipcode'],
      lat: json['address']['geo']['lat'],
      lng: json['address']['geo']['lng'],
      phone: json['phone'],
      website: json['website'],
      companyName: json['company']['name'],
      catchPhrase: json['company']['catchPhrase'],
      bs: json['company']['bs'],
    );
  }

  // Method to convert a User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': {
        'street': street,
        'suite': suite,
        'city': city,
        'zipcode': zipcode,
        'geo': {
          'lat': lat,
          'lng': lng,
        }
      },
      'phone': phone,
      'website': website,
      'company': {
        'name': companyName,
        'catchPhrase': catchPhrase,
        'bs': bs,
      },
    };
  }
}
