import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';

class TopSettingsRow extends StatefulWidget {
  const TopSettingsRow({super.key});

  @override
  State<TopSettingsRow> createState() => _TopSettingsRowState();
}

class _TopSettingsRowState extends State<TopSettingsRow> {
  final _form = FormGroup({'menu': FormControl<String>(value: 'English')});
  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: _form,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 140,
            child: ReactiveDropdownSearch<String, String>(
              formControlName: 'menu',
              dropdownDecoratorProps: DropDownDecoratorProps(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 10,
                  ),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Theme.of(context).hoverColor,
                ),
              ),
              popupProps: PopupProps.menu(
                constraints: const BoxConstraints(
                  minHeight: 80,
                  maxHeight: 100,
                ),
              ),
              items: (_, _) => const ['English', 'Arabic'],
              itemAsString: (String? v) {
                if (v == 'Arabic') return 'العربية  🇸🇦';
                return 'English  🇺🇸';
              },
              onSaved: (String? value) {
                if (value == null) return;
                switch (value) {
                  case 'Arabic':
                    I18n.of(context).locale = const Locale('ar', 'SA');
                    break;
                  case 'English':
                  default:
                    I18n.of(context).locale = const Locale('en', 'US');
                    break;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
