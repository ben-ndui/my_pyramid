class Question {
  int? id;
  String? title;
  String? description;

  Question({
    this.id,
    this.title,
    this.description,
  });
}

List<Question> questionList = [
  Question(
    id: 1,
    title: "Je n'ai jamais",
    description:
        "Tu dis ce qu'il n'a jamais fais, les personnes l'ayant deja fait distribuent 3 gorgée(s), sinon il(elle) les distribue(s)!",
  ),
  Question(
    id: 2,
    title: "Bobard",
    description:
        "A tour de rôle, racontez une verité ou un mensonge, aux autres joueurs de deviner si c'est vrai ou faux, \n Tu commences. \n Ceux qui ont fait donne sinon boit 2 gorgées",
  ),
  Question(
    id: 3,
    title: "Les ancheres",
    description:
        "Donne un chiffre entre 0 et x et une lettre puis, donne autant de titre de musique ou album commençant par cette lettre, sinon tu bois brothaaa (sistaaa) !!",
  ),
  Question(
    id: 4,
    title: "Le juste prix",
    description:
        "Tu prend un produit que tu veux et tu fais deviner le prix aux autres joueurs ! \n Celui ou celle qui trouve distribue 4 gorgées sinon, boit les 4",
  ),
  Question(
    id: 5,
    title: "Action ou vérité ?",
    description:
        "Choisis actiion ou vérité, au joueur suivant de te dire quoi faire !",
  ),
];
