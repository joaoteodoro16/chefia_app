import 'package:chefia_app/app/core/ui/styles/app_colors.dart';
import 'package:chefia_app/app/core/ui/styles/app_text_styles.dart';
import 'package:chefia_app/app/features/home/presentation/widgets/comanda_card.dart';
import 'package:chefia_app/app/features/home/presentation/widgets/kpi_card.dart';
import 'package:chefia_app/app/features/home/presentation/widgets/mesa_card.dart';
import 'package:chefia_app/app/features/home/presentation/widgets/status_chip.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;
  _StatusFilter _statusFilter = _StatusFilter.todos;

  final List<MesaMock> _mesas = const [
    MesaMock(numero: '01', lugares: 4, ocupacaoAtual: 2, status: MesaStatus.aberta),
    MesaMock(numero: '02', lugares: 6, ocupacaoAtual: 6, status: MesaStatus.ocupada),
    MesaMock(numero: '03', lugares: 4, ocupacaoAtual: 3, status: MesaStatus.ocupada),
    MesaMock(numero: '04', lugares: 2, ocupacaoAtual: 0, status: MesaStatus.fechada),
    MesaMock(numero: '05', lugares: 8, ocupacaoAtual: 5, status: MesaStatus.ocupada),
    MesaMock(numero: '06', lugares: 4, ocupacaoAtual: 0, status: MesaStatus.aberta),
  ];

  final List<ComandaMock> _comandas = const [
    ComandaMock(
      codigo: '#1024',
      cliente: 'Juliana',
      mesa: '02',
      itens: 7,
      valor: 184.30,
      status: ComandaStatus.emAndamento,
    ),
    ComandaMock(
      codigo: '#1025',
      cliente: 'Carlos',
      mesa: '05',
      itens: 12,
      valor: 362.90,
      status: ComandaStatus.emAndamento,
    ),
    ComandaMock(
      codigo: '#1020',
      cliente: 'Balcao',
      mesa: '-',
      itens: 3,
      valor: 59.00,
      status: ComandaStatus.fechada,
    ),
    ComandaMock(
      codigo: '#1019',
      cliente: 'Fernanda',
      mesa: '03',
      itens: 5,
      valor: 121.80,
      status: ComandaStatus.pendente,
    ),
  ];

  List<MesaMock> get _mesasFiltradas {
    switch (_statusFilter) {
      case _StatusFilter.todos:
        return _mesas;
      case _StatusFilter.abertos:
        return _mesas.where((m) => m.status == MesaStatus.aberta).toList();
      case _StatusFilter.ocupados:
        return _mesas.where((m) => m.status == MesaStatus.ocupada).toList();
      case _StatusFilter.fechados:
        return _mesas.where((m) => m.status == MesaStatus.fechada).toList();
    }
  }

  List<ComandaMock> get _comandasFiltradas {
    switch (_statusFilter) {
      case _StatusFilter.todos:
        return _comandas;
      case _StatusFilter.abertos:
        return _comandas
            .where((c) => c.status == ComandaStatus.pendente || c.status == ComandaStatus.emAndamento)
            .toList();
      case _StatusFilter.ocupados:
        return _comandas.where((c) => c.status == ComandaStatus.emAndamento).toList();
      case _StatusFilter.fechados:
        return _comandas.where((c) => c.status == ComandaStatus.fechada).toList();
    }
  }

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
                      AppColors.primary.withAlpha(220),
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
                                backgroundColor: Colors.white.withAlpha(36),
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
                                  color: Colors.white.withAlpha(204),
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
                          child: KpiCard(
                            label: 'Abertas',
                            value: _selectedTab == 0
                                ? '${_mesasFiltradas.length} mesas'
                                : '${_comandasFiltradas.length} comandas',
                            icon: Icons.table_restaurant_rounded,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          StatusChip(
                            label: 'Todos',
                            selected: _statusFilter == _StatusFilter.todos,
                            onTap: () => setState(() => _statusFilter = _StatusFilter.todos),
                          ),
                          const SizedBox(width: 8),
                          StatusChip(
                            label: 'Abertos',
                            selected: _statusFilter == _StatusFilter.abertos,
                            onTap: () => setState(() => _statusFilter = _StatusFilter.abertos),
                          ),
                          const SizedBox(width: 8),
                          StatusChip(
                            label: 'Ocupados',
                            selected: _statusFilter == _StatusFilter.ocupados,
                            onTap: () => setState(() => _statusFilter = _StatusFilter.ocupados),
                          ),
                          const SizedBox(width: 8),
                          StatusChip(
                            label: 'Fechados',
                            selected: _statusFilter == _StatusFilter.fechados,
                            onTap: () => setState(() => _statusFilter = _StatusFilter.fechados),
                          ),
                        ],
                      ),
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
                        (context, index) => MesaCard(mesa: _mesasFiltradas[index]),
                        childCount: _mesasFiltradas.length,
                      ),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.06,
                      ),
                    )
                  : SliverList.separated(
                      itemBuilder: (context, index) => ComandaCard(comanda: _comandasFiltradas[index]),
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemCount: _comandasFiltradas.length,
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

enum _StatusFilter { todos, abertos, ocupados, fechados }
