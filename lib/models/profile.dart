extension StringExtension on String{
  String enumToString() {
    if (this.isEmpty) {
      return this;
    }
    String capatalized = this[0].toUpperCase() + this.substring(1);

    return capatalized.replaceAllMapped(RegExp(r'[A-Z]'), (match) {
      return ' ${match.group(0)}';
    });
  }
}

//enums
enum Hobby {
  reading,
  cooking,
  travelling,
  painting,
  photography,
  gardening,
  fitness,
  writing,
  gaming,
  calligraphy,
  crafts,
  sports
}

enum Trait {
  kind,
  ambitious,
  introverted,
  extroverted,
  religious,
  creative,
  hardworking,
  caring,
  funny,
  patient,
  familyOriented,
  traditional,
  educated,
  modern,
  humble,
  honest,
  strong,
  brave,
  charismatic,
}

enum FemaleMaritalStatus {
  virgin,
  divorcee,
  widowed,
  nonVirgin,
}

enum MaleMaritalStatus{
  neverMarried,
  previouslyMarried,
  secondMarriage,
  thirdMarriage,
  fourthMarriage
}

//models

class Profile {
   Profile({
    required this.id,
    required this.name,
    required this.age,
    required this.city,
    required this.hobbies,
    required this.traits,
    required this.description,
    required this.imageUrl,
    required this.contact,
    required this.status,
    required this.hasChildren,
    required this.isShortListed,
     this.occupation
  });

  final String id;
  final String name;
  final int age;
  final String city;
  final List<Hobby> hobbies;
  final List<Trait> traits;
  final String description;
  final String imageUrl;
  final String contact;
  final Enum status;
  final bool hasChildren;
  String? occupation; //only for male profiles
  bool isShortListed;
}