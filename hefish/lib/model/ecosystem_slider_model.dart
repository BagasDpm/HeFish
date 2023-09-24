class EcosystemSliderModel {
  final String image;
  final String ecoType;

  EcosystemSliderModel({
    required this.image,
    required this.ecoType,
  });
}

List<EcosystemSliderModel> listEcoType = [
  EcosystemSliderModel(
    image: 'assets/images/eco0.png',
    ecoType: 'Salt Water',
  ),
  EcosystemSliderModel(
    image: 'assets/images/eco1.png',
    ecoType: 'Fresh Water',
  ),
  EcosystemSliderModel(
    image: 'assets/images/eco2.png',
    ecoType: 'Mix Water',
  ),
];
