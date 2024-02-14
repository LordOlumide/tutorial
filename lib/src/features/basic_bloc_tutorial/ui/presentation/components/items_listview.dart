import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorials/src/features/basic_bloc_tutorial/ui/state_mgmt/basic_cubit.dart';

class ItemsListView extends StatelessWidget {
  const ItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicCubit, BasicState>(
      builder: (context, state) {
        return Column(
          children: [
            for (int i = 0; i < state.details.displayList.length; i++)
              ListTile(
                title: Text(state.details.displayList[i]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    context.read<BasicCubit>().removeItemFromDisplayList(
                          state.details.displayList[i],
                        );
                  },
                ),
              )
          ],
        );
      },
    );
  }
}
