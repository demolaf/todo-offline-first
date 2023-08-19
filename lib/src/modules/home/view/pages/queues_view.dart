import 'package:todo_bloc/src/core/global_imports.dart';
import 'package:todo_bloc/src/modules/home/bloc/home_bloc.dart';

class QueuesView extends StatelessWidget {
  const QueuesView({super.key});

  static Route<QueuesView> route({required HomeBloc bloc}) {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider.value(
          value: bloc,
          child: const QueuesView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            // Check for state is viewing queues
            if (state is! ViewingQueues) {
              return const Center(child: CircularProgressIndicator());
            }

            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('See queues here'),
              ],
            );
          },
        ),
      ),
    );
  }
}
