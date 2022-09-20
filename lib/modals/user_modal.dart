class User {
  final String title;
  final String firstName;
  final String lastName;
  final String gender;
  final String address;
  final String email;
  final String userName;
  final String image;
  final int age;
  final String phone;

  User({
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.address,
    required this.email,
    required this.userName,
    required this.image,
    required this.age,
    required this.phone,
  });

  factory User.fromJSON({required Map<String, dynamic> json}) {
    return User(
      title: json["results"][0]["name"]["title"],
      firstName: json["results"][0]["name"]["first"],
      lastName: json["results"][0]["name"]["last"],
      gender: json["results"][0]["gender"],
      address:
          "${json["results"][0]["location"]["street"]["number"]}, ${json["results"][0]["location"]["street"]["name"]}, ${json["results"][0]["location"]["city"]}, ${json["results"][0]["location"]["state"]}, ${json["results"][0]["location"]["country"]} - ${json["results"][0]["location"]["postcode"]}",
      email: json["results"][0]["email"],
      userName: json["results"][0]["login"]["username"],
      image: json["results"][0]["picture"]["large"],
      age: json["results"][0]["dob"]["age"],
      phone: json["results"][0]["phone"],
    );
  }
}

var a = {
  "resultss": [
    {
      "gender": "female",
      "name": {"title": "Ms", "first": "Filippa", "last": "Petersen"},
      "location": {
        "street": {"number": 2197, "name": "Park Alle"},
        "city": "Kvistgaard",
        "state": "Hovedstaden",
        "country": "Denmark",
        "postcode": 81208,
        "coordinates": {"latitude": "-46.1694", "longitude": "23.2246"},
        "timezone": {
          "offset": "+3:00",
          "description": "Baghdad, Riyadh, Moscow, St. Petersburg"
        }
      },
      "email": "filippa.petersen@example.com",
      "login": {
        "uuid": "4cd93964-c631-49f2-b112-3f9870a80645",
        "username": "blackduck971",
        "password": "altoids",
        "salt": "zmfM0koh",
        "md5": "a3cff28b7edd75a3e3d2dae4fa53e9a2",
        "sha1": "e8309176052cf3ba98be1eea27a4d0f40046333f",
        "sha256":
            "6244118fc42c99373a1bb43c78c905349a4e4973cb1e7141c763b56e6827b751"
      },
      "dob": {"date": "1979-01-16T05:17:01.426Z", "age": 43},
      "registered": {"date": "2013-06-17T22:03:19.723Z", "age": 9},
      "phone": "06504232",
      "cell": "45913187",
      "id": {"name": "CPR", "value": "150179-4263"},
      "picture": {
        "large": "https://randomuser.me/api/portraits/women/44.jpg",
        "medium": "https://randomuser.me/api/portraits/med/women/44.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/women/44.jpg"
      },
      "nat": "DK"
    }
  ],
  "info": {
    "seed": "2df092899942bb0c",
    "resultss": 1,
    "page": 1,
    "version": "1.4"
  }
};
