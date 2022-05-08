// import 'package:flutter/material.dart';


// class form extends StatelessWidget {
//   const form({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//           key: signUpFormProvider.formSignUpKey,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           child: Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ColumnTextField(
//                   label: 'Correo electrónico',
//                   textFormChild: TextFormField(
//                     onChanged: (value) => signUpFormProvider.email = value,
//                     decoration:
//                         InputsDecorationTheme.inputDecorationColumnTextField,
//                     validator: (value) => RegularExpressions().validateEmail(value),
//                   ),
//                 ),
//                 SizedBox(height: size.height * 0.03),
//                 ColumnTextField(
//                   label: 'Contraseña',
//                   textFormChild: TextFormField(
//                     // onChanged: (value) => signUpFormProvider.password = value,
//                     // decoration: InputsDecorationTheme
//                     //     .inputDecorationColumnTextFieldPassword,
//                     // validator: (value) => RegularExpressions().validatePassword(value),
//                   ),
//                 ),
//                 const Spacer(),
//                 const CheckboxListTile(
//                     contentPadding: EdgeInsets.zero,
//                     title: Text(
//                         'Acepto los Terminos y condiciones para operaciones de inversión'),
//                     value: false,
//                       onChanged: null),
//                 const CheckboxListTile(
//                     contentPadding: EdgeInsets.zero,
//                     title: Text('Acepto las politicas de privacidad'),
//                     value: false,
//                     onChanged: null),
//                 Center(
//                   child: SizedBox(
//                     width: double.infinity,
//                     child:Text('boto'),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text('¿Ya tienes cuenta?'),
//                     TextButton(
//                       onPressed: (){

//                       },
//                       child: const Text(
//                         'Inicia sesión',
//                         style: TextStyle(decoration: TextDecoration.underline),
//                       ),
//                       style: TextButton.styleFrom(primary: Colors.blue),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//   }
// }