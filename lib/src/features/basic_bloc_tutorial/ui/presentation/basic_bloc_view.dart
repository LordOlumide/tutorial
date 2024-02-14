import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorials/src/features/basic_bloc_tutorial/ui/presentation/components/color_changing_square.dart';
import 'package:tutorials/src/features/basic_bloc_tutorial/ui/presentation/components/editing_field.dart';
import 'package:tutorials/src/features/basic_bloc_tutorial/ui/presentation/components/items_listview.dart';
import 'package:tutorials/src/features/basic_bloc_tutorial/ui/state_mgmt/basic_cubit.dart';

class BasicBlocView extends StatefulWidget {
  const BasicBlocView({super.key});

  @override
  State<BasicBlocView> createState() => _BasicBlocViewState();
}

class _BasicBlocViewState extends State<BasicBlocView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController itemFieldController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    itemFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BlocBuilder<BasicCubit, BasicState>(
          buildWhen: (previous, current) {
            return previous.details.screenTitle != current.details.screenTitle;
          },
          builder: (context, state) {
            return Text(state.details.screenTitle);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const ColorChangingSquare(),
            const SizedBox(height: 10),
            EditingField(
              hintText: 'Enter New AppBar Title',
              controller: titleController,
              onSubmitted: _onNewTitleSubmitted,
            ),
            const SizedBox(height: 10),
            const ItemsListView(),
            EditingField(
              hintText: 'Add New Item',
              controller: itemFieldController,
              onSubmitted: _onNewItemSubmitted,
            ),
          ],
        ),
      ),
    );
  }

  void _onNewTitleSubmitted(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.read<BasicCubit>().changeTitle(titleController.text);
    titleController.text = '';
  }

  void _onNewItemSubmitted(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.read<BasicCubit>().addItemToDisplayList(itemFieldController.text);
    itemFieldController.text = '';
  }
}
