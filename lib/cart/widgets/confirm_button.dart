import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({Key? key, required this.onTap}) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 25,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          fixedSize: MaterialStateProperty.all<Size>(
            const Size(150, 35),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xff322043),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 20,
              ),
            ),
            Flexible(
              child: Text(
                'Confirm',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        onPressed: () {
          onTap;
        },
      ),
    );
  }
}
