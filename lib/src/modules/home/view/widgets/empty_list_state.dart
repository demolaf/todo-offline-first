import 'package:todo_bloc/src/core/global_imports.dart';

class EmptyListState extends StatelessWidget {
  const EmptyListState({
    required this.sectionTitle,
    super.key,
  });

  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.note_add,
            size: 48,
            color: Theme.of(context).colorScheme.tertiaryContainer,
          ),
          const SizedBox(height: 16),
          Text(
            'You have no todos $sectionTitle',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
