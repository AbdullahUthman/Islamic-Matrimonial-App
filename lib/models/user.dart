enum Genders{
  male,
  female
}

class User{
   final Genders gender;
  const User({required this.gender});
}