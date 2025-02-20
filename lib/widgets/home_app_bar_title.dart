import 'package:flutter/material.dart';
import 'package:weincoders_app/design/colors.dart';

class HomeAppBarTittle extends StatelessWidget {
  final String storeName;
  const HomeAppBarTittle({super.key, required this.storeName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: Colors.black12,
            image: DecorationImage(image: AssetImage('assets/images/user.png')),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        Expanded(
          child: Text(
            storeName,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        ContainerHeaderIcon(
          iconButton: IconButton(
            onPressed: () {
              return print("haz presionado el boton de notificacion");
            },
            icon: Icon(
              Icons.notifications,
              color: WeinFluColors.brandPrimaryColor,
            ),
          ),
          configMargin: EdgeInsets.only(right: 12),
        ),
        ContainerHeaderIcon(
          iconButton: IconButton(
            onPressed: () {
              return print("haz presionado el boton de opciones");
            },
            icon: Icon(Icons.more_vert, color: WeinFluColors.brandPrimaryColor),
          ),
        ),
      ],
    );
  }
}

class ContainerHeaderIcon extends StatelessWidget {
  final IconButton iconButton;
  final EdgeInsets? configMargin;
  const ContainerHeaderIcon({
    super.key,
    required this.iconButton,
    this.configMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: configMargin,
      decoration: BoxDecoration(
        border: Border.all(color: WeinFluColors.brandLightColorBorder),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: iconButton,
    );
  }
}
