import 'package:flutter/cupertino.dart';

class CustomCupertinoTextField extends StatefulWidget {
  String name;
  String? errorText;

  TextEditingController controller;

  CustomCupertinoTextField({required this.name, required this.controller, this.errorText});

  @override
  State<CustomCupertinoTextField> createState() => _CustomCupertinoTextFieldState();
}

class _CustomCupertinoTextFieldState extends State<CustomCupertinoTextField> {

  bool fieldFocus = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print(widget.errorText);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          style: const TextStyle(fontSize: 20),
        ),
        Focus(
          child: CupertinoTextField(
            controller: widget.controller,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            
            decoration: BoxDecoration(
              color: const CupertinoDynamicColor.withBrightness(
                color: CupertinoColors.white,
                darkColor: CupertinoColors.black,
              ),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                width: 0.0,
                color: fieldFocus
                ? CupertinoTheme.of(context).primaryColor
                : const CupertinoDynamicColor.withBrightness(
                    color: Color(0x33000000),
                    darkColor: Color(0x33FFFFFF),
                  )
              )
            ),
          ),
          onFocusChange: (value){
            setState(() {
              fieldFocus = value;
            });
          },
        ),
        if(widget.errorText!=null) 
        Text(
          widget.errorText!,
          style: TextStyle(
            fontSize: 15,
            color: CupertinoColors.destructiveRed
          ),
        )
      ],
    );
  }
}