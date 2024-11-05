class Country {
  final String name;
  final String code;
  final String flagPath;

  const Country({
    required this.name,
    required this.code,
    required this.flagPath,
  });
}

List<Country> countries = [
  const Country(
    name: 'Brazil',
    code: '55',
    flagPath: '../../libs/ui/assets/flags/brazil.png',
  ),
  const Country(
    name: 'Canada',
    code: '1',
    flagPath: '../../libs/ui/assets/flags/canada.png',
  ),
  const Country(
    name: 'Egypt',
    code: '20',
    flagPath: '../../libs/ui/assets/flags/egypt.png',
  ),
  const Country(
    name: 'France',
    code: '33',
    flagPath: '../../libs/ui/assets/flags/france.png',
  ),
  const Country(
    name: 'Germany',
    code: '49',
    flagPath: '../../libs/ui/assets/flags/germany.png',
  ),
  const Country(
    name: 'Italy',
    code: '39',
    flagPath: '../../libs/ui/assets/flags/italy.png',
  ),
  const Country(
    name: 'Spain',
    code: '34',
    flagPath: '../../libs/ui/assets/flags/spain.png',
  ),
  const Country(
    name: 'United Kingdom',
    code: '44',
    flagPath: '../../libs/ui/assets/flags/uk.png',
  ),
  const Country(
    name: 'United States',
    code: '1',
    flagPath: '../../libs/ui/assets/flags/us.png',
  ),
];
