import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jioyathri/core/constants/constants.dart';
import 'package:jioyathri/core/util/app_colors.dart';

void showTopSnackbar(
  BuildContext context,
  String message,
  String type, {
  Color backgroundColor = Colors.black,
  IconData? icon,
  Duration duration = const Duration(seconds: 3),
}) {
  final overlay = Overlay.of(context);
  OverlayEntry? overlayEntry;
  overlayEntry = OverlayEntry(
    builder:
        (context) => Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: TopSnackbar(
            message: message,
            duration: duration,
            onDismiss: () {
              overlayEntry?.remove();
            },
            type: type,
          ),
        ),
  );

  overlay.insert(overlayEntry);
}

class TopSnackbar extends StatefulWidget {
  const TopSnackbar({
    super.key,
    required this.message,
    required this.duration,
    required this.onDismiss,
    required this.type,
  });

  final String message;
  final Duration duration;
  final Function() onDismiss;
  final String type;

  @override
  State<TopSnackbar> createState() => _TopSnackbarState();
}

class _TopSnackbarState extends State<TopSnackbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  static const colors = {
    "success": AppColors.successColor,
    "error": AppColors.errorColor,
    "warning": AppColors.warningColor,
    "info": AppColors.infoColor,
  };

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Future.delayed(widget.duration, () {
      if (mounted) {
        _controller.reverse().then((_) {
          if (mounted) {
            widget.onDismiss();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return SlideTransition(
      position: _slideAnimation,
      child: Material(
        color: Colors.transparent,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 240),
          margin: EdgeInsets.only(top: topPadding + 8, right: 16, left: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            // color: colors[widget.type]!.withValues(alpha: 0.1),
            color: Theme.of(context).colorScheme.primary,
            border: Border.all(width: 0.5, color: colors[widget.type]!),
            borderRadius: BorderRadius.circular(defaultBorderRadius),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/${widget.type}-fill.svg',
                colorFilter: ColorFilter.mode(
                  colors[widget.type]!,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.message,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  _controller.reverse().then((_) {
                    if (mounted) {
                      widget.onDismiss();
                    }
                  });
                },
                child: Icon(Icons.close, size: 18, color: AppColors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
