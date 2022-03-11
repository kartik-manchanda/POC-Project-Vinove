import 'package:flutter/material.dart';

class SettingOption extends StatefulWidget {
  final String title;
  final String? subtitle;
  final Icon leading;
  final Icon? trailing;
  final onTap;
  const SettingOption({Key? key,
    required this.title,
    this.subtitle,
    required this.leading,
    required this.onTap,
    this.trailing,
  }) : super(key: key);

  @override
  State<SettingOption> createState() => _SettingOptionState();
}

class _SettingOptionState extends State<SettingOption> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: widget.onTap,
          // onTap: () {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => const (),
          //     ),
          //   );
          // },
          child: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: ListTile(
              title: Text(widget.title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                ),
              ),
              subtitle: widget.subtitle!=null?  Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text(widget.subtitle! ,
                    style: TextStyle(fontSize: 15),
                  )
              ): null,
              leading: widget.leading,
              trailing: widget.trailing,
            ),
          ),
        ),
      ],
    );
  }
}
