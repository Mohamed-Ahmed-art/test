import 'package:flutter/material.dart';
import '../model/country_model.dart';


class CountryDropdown extends StatefulWidget {
  final Function(Country) onCountryChanged;

  const CountryDropdown({
    super.key,
    required this.onCountryChanged,
  });

  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  Country selectedCountry =
      countries.firstWhere((country) => country.name == 'Egypt');

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<Country>(
        value: selectedCountry,
        elevation: 0,
        icon: const SizedBox.shrink(),
        onChanged: (Country? newCountry) {
          if (newCountry != null) {
            setState(() {
              selectedCountry = newCountry;
            });
            widget.onCountryChanged(newCountry);
          }
        },
        items: countries.map((Country country) {
          return DropdownMenuItem<Country>(
            value: country,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  child: Text(
                    Localizations.localeOf(context).languageCode == 'ar'
                        ? '${country.code}+'
                        : '+${country.code}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    textDirection:
                        Localizations.localeOf(context).languageCode == 'ar'
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(
                    country.flagPath,
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
