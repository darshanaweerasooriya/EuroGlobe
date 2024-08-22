class Country{
  final String name;
  final String capital;
  final String flagUrl;
  final int population;

  Country({
    required this.name,
    required this.capital,
    required this.flagUrl,
    required this.population,
});

  factory Country.fromJson(Map<String, dynamic> json){
    return Country(
      name: json['name']['common'] ?? 'Unknown',
      capital: json['capital'] != null? json['capital'][0] : 'unknown',
      flagUrl: json['flage']['png'] ?? '',
      population: json['population'] ?? 0,
    );
  }
}