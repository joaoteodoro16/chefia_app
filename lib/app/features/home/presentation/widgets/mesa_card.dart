import 'package:chefia_app/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

enum MesaStatus { aberta, ocupada, fechada }

class MesaMock {
  final String numero;
  final int lugares;
  final int ocupacaoAtual;
  final MesaStatus status;

  const MesaMock({
    required this.numero,
    required this.lugares,
    required this.ocupacaoAtual,
    required this.status,
  });
}

class MesaCard extends StatelessWidget {
  final MesaMock mesa;

  const MesaCard({super.key, required this.mesa});

  @override
  Widget build(BuildContext context) {
    final text = context.textStyles;
    final statusColor = switch (mesa.status) {
      MesaStatus.aberta => const Color(0xFF1FA55A),
      MesaStatus.ocupada => const Color(0xFFDA4B49),
      MesaStatus.fechada => const Color(0xFF6E7688),
    };

    final statusLabel = switch (mesa.status) {
      MesaStatus.aberta => 'Aberta',
      MesaStatus.ocupada => 'Ocupada',
      MesaStatus.fechada => 'Fechada',
    };

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            blurRadius: 16,
            offset: Offset(0, 8),
            color: Color(0x14000000),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withAlpha(36),
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
              const Spacer(),
              Icon(Icons.more_horiz_rounded, color: Colors.grey.shade400),
            ],
          ),
          const Spacer(),
          Text(
            'Mesa ${mesa.numero}',
            style: text.textBold.copyWith(
              color: const Color(0xFF1F2533),
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '${mesa.ocupacaoAtual}/${mesa.lugares} lugares',
            style: text.textRegular.copyWith(
              color: const Color(0xFF6E7688),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
