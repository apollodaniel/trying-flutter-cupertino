import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCupertinoButton extends StatefulWidget {

  String buttonText;
  bool loading;
  Function onPressed;
  CustomCupertinoButton({required this.buttonText, required this.loading, required this.onPressed});

  @override
  State<CustomCupertinoButton> createState() => _CustomCupertinoButtonState();
}

class _CustomCupertinoButtonState extends State<CustomCupertinoButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: CupertinoButton.filled(
          child: widget.loading ?
          Center(
            child: AspectRatio(
              aspectRatio: 1/1,
              child: CupertinoActivityIndicator(
                color: Theme.of(context)
                .primaryTextTheme
                .bodyMedium!.color,
              )
            ),
          )
          : Text(
            widget.buttonText,
            style: Theme.of(context)
                .primaryTextTheme
                .bodyMedium!
                .copyWith(
                    fontSize: 18, fontWeight: FontWeight.w500),
          ),
          onPressed: widget.loading ? () {} : () => widget.onPressed()
      )
    );
  }
}