import 'package:flutter/material.dart';

class CustomSnackBarBuilder extends SnackBar {
  CustomSnackBarBuilder({
    required this.title,
    super.key,
    this.body,
    this.color,
    this.icon,
    this.snackBarAction,
    this.seconds,
    this.titleColor,
  }) : super(
          backgroundColor: color ?? Colors.white,
          content: SnackBarContent(
            body: body,
            title: title,
            titleColor: titleColor,
            icon: icon,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: const EdgeInsets.only(bottom: 18, left: 16, right: 16),
          behavior: SnackBarBehavior.floating,
          dismissDirection: DismissDirection.down,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          action: snackBarAction,
          duration: Duration(seconds: seconds ?? 2),
        );
  final String? body;
  final String title;
  final Color? titleColor;
  final Color? color;
  final SnackBarAction? snackBarAction;
  final int? seconds;
  final Widget? icon;
}

class SnackBarContent extends StatelessWidget {
  const SnackBarContent({
    required this.title,
    required this.body,
    super.key,
    this.icon,
    this.titleColor,
  });

  final String title;
  final Color? titleColor;
  final String? body;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon ??
            const Icon(
              Icons.info,
              size: 48,
            ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color:
                          titleColor ?? Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
              ),
              if (body != null) ...[
                const SizedBox(height: 4),
                Text(
                  body ?? '',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
