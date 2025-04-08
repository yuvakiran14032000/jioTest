import 'package:flutter/material.dart';
import 'package:jioyathri/core/constants/constants.dart';

class RegisterField extends StatefulWidget {
  const RegisterField({
    super.key,
    required this.title,
    required this.controller,
    this.action = TextInputAction.next,
    this.obscure = false,
  });
  final String title;
  final TextEditingController controller;
  final TextInputAction action;
  final bool obscure;

  @override
  State<RegisterField> createState() => _RegisterFieldState();
}

class _RegisterFieldState extends State<RegisterField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Theme.of(context).colorScheme.onSurface.withAlpha(30),
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        border: Border.all(
          width: 0.6,
          color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: TextField(
        obscureText: widget.obscure && !isVisible,
        textInputAction: widget.action,
        controller: widget.controller,
        cursorColor: Theme.of(context).colorScheme.onSurface,
        decoration: InputDecoration(
          border: UnderlineInputBorder(borderSide: BorderSide.none),
          hintText: widget.title,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(125),
          ),
          suffix:
              widget.obscure
                  ? InkWell(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Icon(
                        isVisible
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        size: 20,
                      ),
                    ),
                  )
                  : null,
        ),
      ),
    );
  }
}
