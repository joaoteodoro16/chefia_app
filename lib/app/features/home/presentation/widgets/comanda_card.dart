import 'package:chefia_app/app/core/ui/styles/app_colors.dart';
import 'package:chefia_app/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

enum ComandaStatus { pendente, emAndamento, fechada }

class ComandaMock {
  final String codigo;
  final String cliente;
  final String mesa;
  final int itens;
  final double valor;
  final ComandaStatus status;

  const ComandaMock({
    required this.codigo,
    required this.cliente,
    required this.mesa,
    required this.itens,
    required this.valor,
    required this.status,
  });
}

class ComandaCard extends StatelessWidget {
  final ComandaMock comanda;

  const ComandaCard({super.key, required this.comanda});

  @override
  Widget build(BuildContext context) {
    final text = context.textStyles;

    final statusColor = switch (comanda.status) {
      ComandaStatus.pendente => const Color(0xFFE6A52D),
      ComandaStatus.emAndamento => const Color(0xFF0D86FF),
      ComandaStatus.fechada => const Color(0xFF1FA55A),
    };

    final statusLabel = switch (comanda.status) {
      ComandaStatus.pendente => 'Pendente',
      ComandaStatus.emAndamento => 'Em andamento',
      ComandaStatus.fechada => 'Fechada',
    };

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 12,
            offset: Offset(0, 6),
            color: Color(0x12000000),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                comanda.codigo,
                style: text.textBold.copyWith(
                  color: const Color(0xFF1F2533),
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.14),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  statusLabel,
                  style: text.textSemiBold.copyWith(
                    color: statusColor,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 12,
            runSpacing: 6,
            children: [
              _MiniInfo(label: 'Cliente', value: comanda.cliente),
              _MiniInfo(label: 'Mesa', value: comanda.mesa),
              _MiniInfo(label: 'Itens', value: '${comanda.itens}'),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                'Total',
                style: text.textRegular.copyWith(
                  color: const Color(0xFF6E7688),
                ),
              ),
              const Spacer(),
              Text(
                'R\$ ${comanda.valor.toStringAsFixed(2)}',
                style: text.textBold.copyWith(
                  color: AppColors.primary,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniInfo extends StatelessWidget {
  final String label;
  final String value;

  const _MiniInfo({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final text = context.textStyles;
    return RichText(
      text: TextSpan(
        text: '$label: ',
        style: text.textRegular.copyWith(
          color: const Color(0xFF6E7688),
          fontSize: 13,
        ),
        children: [
          TextSpan(
            text: value,
            style: text.textSemiBold.copyWith(
              color: const Color(0xFF222938),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
