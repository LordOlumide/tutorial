import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorials/src/features/basic_bloc_tutorial/ui/state_mgmt/basic_cubit.dart';

class ColorChangingSquare extends StatelessWidget {
  const ColorChangingSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<BasicCubit, BasicState>(
          buildWhen: (previous, current) {
            return previous.squareColor != current.squareColor;
          },
          builder: (context, state) {
            return Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: state.squareColor,
                border: Border.all(color: Colors.black, width: 2),
              ),
            );
          },
        ),
        const SizedBox(width: 40),
        const Column(
          children: [
            ColorSelectSquare(color: Colors.blue),
            ColorSelectSquare(color: Colors.red),
            ColorSelectSquare(color: Colors.green),
            ColorSelectSquare(color: Colors.yellow),
          ],
        ),
        const SizedBox(width: 15),
        const Column(
          children: [
            ColorSelectSquare(color: Colors.pink),
            ColorSelectSquare(color: Colors.orange),
            ColorSelectSquare(color: Colors.indigo),
            ColorSelectSquare(color: Colors.purple),
          ],
        ),
      ],
    );
  }
}

class ColorSelectSquare extends StatelessWidget {
  final Color color;

  const ColorSelectSquare({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<BasicCubit>().changeColor(color);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: 35,
        height: 35,
        color: color,
      ),
    );
  }
}
