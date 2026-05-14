import 'package:chefia_app/app/core/provider/app_cubit.dart';
import 'package:chefia_app/app/core/routes/app_routes.dart';
import 'package:chefia_app/app/core/ui/styles/app_colors.dart';
import 'package:chefia_app/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final text = context.textStyles;
    final userName = context.select<AppCubit, String>(
      (cubit) => cubit.state.userLogged?.name ?? 'Usuario',
    );

    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 56, 20, 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary,
                  AppColors.primary.withAlpha(220),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chefia',
                  style: text.textBold.copyWith(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  userName,
                  style: text.textSemiBold.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              children: [
                _DrawerItem(
                  icon: Icons.table_restaurant_rounded,
                  label: 'Mesas',
                  onTap: () => Navigator.pop(context),
                ),
                _DrawerItem(
                  icon: Icons.receipt_long_rounded,
                  label: 'Comandas',
                  onTap: () => Navigator.pop(context),
                ),
                _DrawerItem(
                  icon: Icons.inventory_2_rounded,
                  label: 'Produtos',
                  onTap: () => Navigator.pop(context),
                ),
                _DrawerItem(
                  icon: Icons.apartment_rounded,
                  label: 'Empresa',
                  onTap: () => Navigator.pop(context),
                ),
                _DrawerItem(
                  icon: Icons.settings_rounded,
                  label: 'Configuracoes',
                  onTap: () => Navigator.pop(context),
                ),
                const Divider(height: 28),
                _DrawerItem(
                  icon: Icons.logout_rounded,
                  label: 'Sair',
                  iconColor: Colors.red.shade400,
                  textColor: Colors.red.shade400,
                  onTap: () {
                    context.read<AppCubit>().clear();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.login,
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: Text(
              'Versao 1.0.0',
              textAlign: TextAlign.center,
              style: text.textRegular.copyWith(
                color: const Color(0xFF8B92A3),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? textColor;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final text = context.textStyles;

    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      leading: Icon(icon, color: iconColor ?? const Color(0xFF424A5C)),
      title: Text(
        label,
        style: text.textMedium.copyWith(
          color: textColor ?? const Color(0xFF1F2533),
          fontSize: 15,
        ),
      ),
      onTap: onTap,
    );
  }
}