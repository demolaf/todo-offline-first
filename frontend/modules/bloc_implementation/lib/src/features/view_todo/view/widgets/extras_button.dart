import 'package:bloc_implementation/src/features/view_todo/bloc/view_todo_bloc.dart';
import 'package:bloc_implementation/src/features/view_todo/view/widgets/extras_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExtrasButton extends StatefulWidget {
  const ExtrasButton({
    super.key,
  });

  @override
  State<ExtrasButton> createState() => _ExtrasButtonState();
}

class _ExtrasButtonState extends State<ExtrasButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationAnimationController;
  late Animation<double> _rotationAnimation;

  LayerLink layerLink = LayerLink();
  OverlayEntry? entry;

  bool extrasMenuVisible = false;

  @override
  void initState() {
    super.initState();

    _rotationAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 45 / 360).animate(
      CurvedAnimation(
        parent: _rotationAnimationController,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    hideExtrasMenu();
    _rotationAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: SizedBox(
        width: 48,
        height: 48,
        child: IconButton.filled(
          iconSize: 20,
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          onPressed: () {
            if (!extrasMenuVisible) {
              _rotationAnimationController.forward();
              showExtrasMenu(context.read<ViewTodoBloc>());
            } else {
              _rotationAnimationController.reverse();
              hideExtrasMenu();
            }

            setState(() {
              extrasMenuVisible = !extrasMenuVisible;
            });
          },
          icon: RotationTransition(
            turns: _rotationAnimation,
            child: const FittedBox(
              child: Icon(
                Icons.add,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showExtrasMenu(ViewTodoBloc bloc) {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject()! as RenderBox;
    final size = renderBox.size;

    entry = OverlayEntry(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: hideExtrasMenu,
        child: Positioned(
          width: size.width,
          child: CompositedTransformFollower(
            link: layerLink,
            showWhenUnlinked: false,
            offset: Offset(0, size.height + 16),
            child: BlocProvider.value(
              value: bloc,
              child: const ExtrasMenu(),
            ),
          ),
        ),
      ),
    );

    overlay.insert(entry!);
  }

  void hideExtrasMenu() {
    entry?.remove();
    entry = null;
  }
}
