import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';
import '../theme/app_tokens.dart';

/// Country selector: shows the flag and the country name in the app
/// language, and opens a searchable list of every country. The value is the
/// ISO 3166-1 alpha-2 code (`JO`) — what the API stores.
class CountryField extends StatelessWidget {
  final String? value;
  final ValueChanged<String> onChanged;
  final String label;
  final String? errorText;

  /// Shown at the top of the list.
  static const favorites = ['JO', 'SA', 'AE', 'KW', 'QA', 'EG', 'PS'];

  const CountryField({super.key, required this.value, required this.onChanged, required this.label, this.errorText});

  void _open(BuildContext context) {
    final t = context.tokens;
    showCountryPicker(
      context: context,
      favorite: favorites,
      showPhoneCode: false,
      useSafeArea: true,
      moveAlongWithKeyboard: true,
      onSelect: (country) => onChanged(country.countryCode),
      countryListTheme: CountryListThemeData(
        backgroundColor: t.surface,
        textStyle: context.text.bodyLarge,
        searchTextStyle: context.text.bodyLarge,
        bottomSheetHeight: MediaQuery.sizeOf(context).height * .75,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
        inputDecoration: InputDecoration(
          hintText: MaterialLocalizations.of(context).searchFieldLabel,
          prefixIcon: const Icon(Icons.search_rounded),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final code = value?.toUpperCase();
    final country = code == null || code.isEmpty ? null : CountryParser.tryParseCountryCode(code);
    final name = country?.getTranslatedName(context) ?? country?.name;
    return InkWell(
      onTap: () => _open(context),
      borderRadius: AppRadius.controlAll,
      child: InputDecorator(
        isEmpty: country == null,
        decoration: InputDecoration(
          labelText: label,
          errorText: errorText,
          suffixIcon: const Icon(Icons.expand_more_rounded),
        ),
        child: country == null
            ? null
            : Row(
                children: [
                  Text(country.flagEmoji, style: const TextStyle(fontSize: 20)),
                  Gap.sm,
                  Expanded(child: Text(name ?? code!, overflow: TextOverflow.ellipsis)),
                ],
              ),
      ),
    );
  }
}
