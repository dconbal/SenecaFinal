import 'package:flutter/material.dart';
import 'package:seneca/widgets/background.dart';
import 'package:seneca/widgets/card.dart';
import 'package:seneca/widgets/central_menu.dart';
import 'package:seneca/widgets/custom_button_navegation.dart';

class PrincipalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Background(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                children: [
                  Text(
                    "iSéneca",
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  PrincipalCard(),
                  CentralMenu(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomButtonNavegation(),
    );
  }
}
