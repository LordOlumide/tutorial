import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorials/src/features/basic_bloc_tutorial/ui/presentation/basic_bloc_view.dart';
import 'package:tutorials/src/features/basic_bloc_tutorial/ui/state_mgmt/basic_cubit.dart';

class BasicBlocScreen extends StatelessWidget {
  static const screenId = 'basic_bloc_screen';

  const BasicBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BasicCubit>(
      create: (context) => BasicCubit(),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          const BasicBlocView(),
          BlocBuilder<BasicCubit, BasicState>(
            builder: (context, state) {
              return state.screenIsLoading == true
                  ? Container(
                      color: Colors.black.withOpacity(0.15),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
