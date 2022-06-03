

class CharINFOluck{

  final String L10Skill;
  final String L30Skill;
  final String L50Skill;
  final String L75Skill;
  final String L99Skill;


  CharINFOluck(
      {required this.L10Skill, required  this.L30Skill, required this.L50Skill,required  this.L75Skill, required this.L99Skill,
      });

  factory CharINFOluck.fromJson(Map<dynamic, dynamic> parsedjson) {
    return CharINFOluck(
      L10Skill: parsedjson['L10 Skill']?? '0',
      L30Skill: parsedjson['L30 Skill']?? '0',
      L50Skill: parsedjson['L50 Skill']?? '0',
      L75Skill: parsedjson['L75 Skill']?? '0',
      L99Skill: parsedjson['L99 Skill']?? '0',


    );
  }
}
