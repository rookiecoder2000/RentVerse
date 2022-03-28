class UnbordingContent {
  String image;
  String title;
  String description;

  UnbordingContent(
      {required this.image, required this.title, required this.description});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Rent A Cozy Place',
      image: 'assets/images/Sweethome.svg',
      description:
          "Find a boarding house of your choice from verified Landlords"),
  UnbordingContent(
      title: 'Place yours for Rent',
      image: 'assets/images/Sweethome.svg',
      description:
          "Offer your boarding house units for rent to verified individuals "),
  UnbordingContent(
      title: 'One-stop Renting Application',
      image: 'assets/images/Sweethome.svg',
      description: "Manage your units efficiently."
          "Set reminders for your due bills"),
];
