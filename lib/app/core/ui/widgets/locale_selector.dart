import 'package:chefia_app/app/core/translate/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _LocaleOption {
  final String code;
  final String label;
  final String flag;

  const _LocaleOption({
    required this.code,
    required this.label,
    required this.flag,
  });
}

const _locales = [
  _LocaleOption(code: 'pt', label: 'Português', flag: '🇧🇷'),
  _LocaleOption(code: 'en', label: 'English', flag: '🇺🇸'),
];

class LocaleSelector extends StatelessWidget {
  const LocaleSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final currentCode =
        context.watch<LocaleCubit>().state.locale.languageCode;
    final current = _locales.firstWhere(
      (l) => l.code == currentCode,
      orElse: () => _locales.first,
    );
    final theme = Theme.of(context);

    return MenuAnchor(
      alignmentOffset: const Offset(0, 8),
      style: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(theme.colorScheme.surface),
        elevation: const WidgetStatePropertyAll(10),
        padding: const WidgetStatePropertyAll(EdgeInsets.all(6)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        side: WidgetStatePropertyAll(
          BorderSide(color: theme.colorScheme.outline.withValues(alpha: 0.2)),
        ),
      ),
      menuChildren: _locales
          .map(
            (locale) => MenuItemButton(
              onPressed: () {
                context.read<LocaleCubit>().changeLocale(locale.code);
              },
              style: const ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
                minimumSize: WidgetStatePropertyAll(Size(180, 0)),
              ),
              child: _LocaleMenuItem(
                option: locale,
                selected: locale.code == current.code,
              ),
            ),
          )
          .toList(),
      builder: (context, controller, child) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: controller.isOpen
                      ? theme.colorScheme.primary
                      : theme.colorScheme.outline.withValues(alpha: 0.35),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(current.flag, style: const TextStyle(fontSize: 18)),
                  const SizedBox(width: 8),
                  Text(
                    current.label,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(width: 6),
                  AnimatedRotation(
                    turns: controller.isOpen ? 0.5 : 0,
                    duration: const Duration(milliseconds: 180),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 18,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LocaleMenuItem extends StatelessWidget {
  final _LocaleOption option;
  final bool selected;

  const _LocaleMenuItem({required this.option, required this.selected});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: selected
            ? theme.colorScheme.primary.withValues(alpha: 0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(option.flag, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Text(
            option.label,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight:
                  selected ? FontWeight.w700 : FontWeight.w400,
              color: selected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurface,
            ),
          ),
          if (selected) ...[
            const Spacer(),
            Icon(
              Icons.check_rounded,
              size: 18,
              color: theme.colorScheme.primary,
            ),
          ],
        ],
      ),
    );
  }
}