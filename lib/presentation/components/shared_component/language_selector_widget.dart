import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_place_car/core/global/localization/helper/locale_entity.dart';
import 'package:market_place_car/presentation/controller/cubit/locale/locale_state.dart';

class LanguageSelectorWidget extends StatelessWidget {
  const LanguageSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        final current = state is LocaleLoaded ? state.locale : LocaleEntity.english;

        return ListTile(
          leading: const Icon(Icons.language),
          title: const Text('Language / اللغة'),
          trailing: Text(
            current.label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          onTap: () => _showLanguageSheet(context, current),
        );
      },
    );
  }

  void _showLanguageSheet(BuildContext context, LocaleEntity current) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => BlocProvider.value(
        value: context.read<LocaleCubit>(),
        child: _LanguageSheetContent(current: current),
      ),
    );
  }
}

class _LanguageSheetContent extends StatelessWidget {
  final LocaleEntity current;
  const _LanguageSheetContent({required this.current});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          ...LocaleEntity.supportedLocales.map(
                (locale) => _LocaleTile(locale: locale, isSelected: locale == current),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _LocaleTile extends StatelessWidget {
  final LocaleEntity locale;
  final bool isSelected;
  const _LocaleTile({required this.locale, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(locale.label),
      trailing: isSelected ? const Icon(Icons.check_circle, color: Colors.black) : null,
      onTap: () {
        context.read<LocaleCubit>().changeLocale(locale);
        Navigator.pop(context);
      },
    );
  }
}