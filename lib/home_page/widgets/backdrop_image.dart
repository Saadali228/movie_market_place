import 'package:flutter/material.dart';

class BackDropImage extends StatelessWidget {
  const BackDropImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String? image;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: _shaderGradient,
      blendMode: BlendMode.dstIn,
      child: Align(
        alignment: Alignment.centerRight,
        child: _buildImage(context),
      ),
    );
  }

  SizedBox _buildImage(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width *
          (MediaQuery.of(context).size.width < 1450
              ? 1
              : (MediaQuery.of(context).size.width < 1650 ? 0.9 : 0.8)),
      height: MediaQuery.of(context).size.height,
      child: image != null ? Image.network(
        "https://image.tmdb.org/t/p/w1280/$image",
        fit: BoxFit.cover,
      ) : const Text('Image not found'),
    );
  }

  Shader _shaderGradient(rect) {
    return const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: [0, 0.6],
      colors: [Colors.black, Colors.transparent],
    ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
  }
}