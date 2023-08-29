import 'dart:math';

import 'package:todo_bloc/src/core/global_imports.dart';

class AnimatedSyncStatus extends StatefulWidget {
  const AnimatedSyncStatus({
    super.key,
  });

  @override
  State<AnimatedSyncStatus> createState() => _AnimatedSyncStatusState();
}

class _AnimatedSyncStatusState extends State<AnimatedSyncStatus>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationAnimationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _rotationAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..forward();

    _rotationAnimation = Tween<double>(begin: 0, end: pi * 2).animate(
      CurvedAnimation(
        parent: _rotationAnimationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    debugPrint('Rotation animation controller disposed');
    _rotationAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotationAnimation,
      child: Icon(
        Icons.sync,
        color: Theme.of(context).colorScheme.primaryContainer,
        size: 36,
      ),
    );
  }
}
