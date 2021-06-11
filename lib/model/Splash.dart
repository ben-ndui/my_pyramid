class Splash{
  int? id;
  String? name, description;

  Splash({
    this.name,
    this.id,
    this.description,
  });
}

List<Splash> splashList = [
  Splash(
    id: 0,
    name: "home",
    description: "Home",
  ),

  Splash(
    id: 1,
    name: "first",
    description: "first",
  ),

  Splash(
    id: 2,
    name: "second",
    description: "SecondScreen",
  ),

  Splash(
    id: 3,
    name: "third",
    description: "third",
  ),
];