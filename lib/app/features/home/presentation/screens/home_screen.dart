import 'package:chefia_app/app/core/ui/styles/app_colors.dart';
import 'package:chefia_app/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;

  final List<_MesaMock> _mesas = const [
    _MesaMock(numero: '01', lugares: 4, ocupacaoAtual: 2, status: _MesaStatus.livre),
    _MesaMock(numero: '02', lugares: 6, ocupacaoAtual: 6, status: _MesaStatus.ocupada),
    _MesaMock(numero: '03', lugares: 4, ocupacaoAtual: 3, status: _MesaStatus.ocupada),
    _MesaMock(numero: '04', lugares: 2, ocupacaoAtual: 0, status: _MesaStatus.reservada),
    _MesaMock(numero: '05', lugares: 8, ocupacaoAtual: 5, status: _MesaStatus.ocupada),
    _MesaMock(numero: '06', lugares: 4, ocupacaoAtual: 0, status: _MesaStatus.livre),
  ];

  final List<_ComandaMock> _comandas = const [
    _ComandaMock(
      codigo: '#1024',
      cliente: 'Juliana',
      mesa: '02',
      itens: 7,
      valor: 184.30,
      status: _ComandaStatus.emAndamento,
    ),
    _ComandaMock(
      codigo: '#1025',
      cliente: 'Carlos',
      mesa: '05',
      itens: 12,
      valor: 362.90,
      status: _ComandaStatus.emAndamento,
    ),
    _ComandaMock(
      codigo: '#1020',
      cliente: 'Balcao',
      mesa: '-',
      itens: 3,
      valor: 59.00,
      status: _ComandaStatus.prontaParaFechar,
    ),
    _ComandaMock(
      codigo: '#1019',
      cliente: 'Fernanda',
      mesa: '03',
      itens: 5,
      valor: 121.80,
      status: _ComandaStatus.pendente,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final text = context.textStyles;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      drawer: const Drawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primary,
                      AppColors.primary.withValues(alpha: 0.86),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Builder(
                          builder: (context) {
                            return IconButton(
                              onPressed: () => Scaffold.of(context).openDrawer(),
                              icon: const Icon(Icons.menu_rounded),
                              color: Colors.white,
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.white.withValues(alpha: 0.14),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Chefia - Salao Principal',
                                style: text.textSemiBold.copyWith(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Fluxo do turno em tempo real',
                                style: text.textRegular.copyWith(
                                  color: Colors.white.withValues(alpha: 0.8),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: _selectedTab == 0
                              ? 'Buscar mesa, numero ou status'
                              : 'Buscar comanda, cliente ou mesa',
                          hintStyle: text.textRegular.copyWith(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: colorScheme.primary,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: _KpiCard(
                            label: 'Abertas',
                            value: _selectedTab == 0 ? '4 mesas' : '3 comandas',
                            icon: Icons.table_restaurant_rounded,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 100),
              sliver: _selectedTab == 0
                  ? SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => _MesaCard(mesa: _mesas[index]),
                        childCount: _mesas.length,
                      ),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.06,
                      ),
                    )
                  : SliverList.separated(
                      itemBuilder: (context, index) => _ComandaCard(comanda: _comandas[index]),
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemCount: _comandas.length,
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedTab,
        onDestinationSelected: (index) {
          setState(() => _selectedTab = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Mesas',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_rounded),
            label: 'Comandas',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppColors.secondary,
        icon: const Icon(Icons.add_rounded, color: Colors.black87),
        label: Text(
          _selectedTab == 0 ? 'Nova Mesa' : 'Nova Comanda',
          style: text.textSemiBold.copyWith(color: Colors.black87),
        ),
      ),
    );
  }
}

class _KpiCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _KpiCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final text = context.textStyles;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.24)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: text.textRegular.copyWith(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 12,
                  ),
                ),
                Text(
                  value,
                  style: text.textSemiBold.copyWith(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MesaCard extends StatelessWidget {
  final _MesaMock mesa;

  const _MesaCard({required this.mesa});

  @override
  Widget build(BuildContext context) {
    final text = context.textStyles;
    final statusColor = switch (mesa.status) {
      _MesaStatus.livre => const Color(0xFF1FA55A),
      _MesaStatus.ocupada => const Color(0xFFDA4B49),
      _MesaStatus.reservada => const Color(0xFFE6A52D),
    };

    final statusLabel = switch (mesa.status) {
      _MesaStatus.livre => 'Livre',
      _MesaStatus.ocupada => 'Ocupada',
      _MesaStatus.reservada => 'Reservada',
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
                  color: statusColor.withValues(alpha: 0.14),
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

class _ComandaCard extends StatelessWidget {
  final _ComandaMock comanda;

  const _ComandaCard({required this.comanda});

  @override
  Widget build(BuildContext context) {
    final text = context.textStyles;

    final statusColor = switch (comanda.status) {
      _ComandaStatus.pendente => const Color(0xFFE6A52D),
      _ComandaStatus.emAndamento => const Color(0xFF0D86FF),
      _ComandaStatus.prontaParaFechar => const Color(0xFF1FA55A),
    };

    final statusLabel = switch (comanda.status) {
      _ComandaStatus.pendente => 'Pendente',
      _ComandaStatus.emAndamento => 'Em andamento',
      _ComandaStatus.prontaParaFechar => 'Pronta para fechar',
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
                  color: statusColor.withValues(alpha: 0.14),
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

enum _MesaStatus { livre, ocupada, reservada }

enum _ComandaStatus { pendente, emAndamento, prontaParaFechar }

class _MesaMock {
  final String numero;
  final int lugares;
  final int ocupacaoAtual;
  final _MesaStatus status;

  const _MesaMock({
    required this.numero,
    required this.lugares,
    required this.ocupacaoAtual,
    required this.status,
  });
}

class _ComandaMock {
  final String codigo;
  final String cliente;
  final String mesa;
  final int itens;
  final double valor;
  final _ComandaStatus status;

  const _ComandaMock({
    required this.codigo,
    required this.cliente,
    required this.mesa,
    required this.itens,
    required this.valor,
    required this.status,
  });
}
