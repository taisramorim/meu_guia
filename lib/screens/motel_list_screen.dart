import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meu_guia/blocs/motel_bloc/motel_bloc.dart';
import 'package:meu_guia/widgets/motel_card.dart';

class MotelListScreen extends StatelessWidget {
  const MotelListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60),
            child: BlocBuilder<MotelBloc, MotelState>(
              builder: (context, state) {
                if (state is MotelLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MotelLoaded) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: ListView.builder(
                      itemCount: state.moteis.length,
                      itemBuilder: (context, index) {
                        return MotelCard(motel: state.moteis[index]);
                      },
                    ),
                  );
                } else if (state is MotelError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text("Carregue os moteis"));
              },
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.filter_list, color: Colors.white),
                    onPressed: () {},
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.run_circle_outlined,
                                color: Colors.red, size: 26),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Ir Agora",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.red,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_today,
                                color: Colors.white, size: 18),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Ir Outro Dia",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.map, size: 15),
                    const SizedBox(width: 3),
                    Text("Mapa", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
