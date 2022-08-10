import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Logo extends StatelessWidget {
  final String label;
  final String pathImage;
  final double ancho;

  const Logo(
      {super.key,
      required this.label,
      required this.pathImage,
      required this.ancho});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        width: this.ancho,
        child: Column(
          children: <Widget>[
            Image(image: AssetImage(this.pathImage)),
            const SizedBox(
              height: 10,
            ),
            Text(
              this.label,
              style: const TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
