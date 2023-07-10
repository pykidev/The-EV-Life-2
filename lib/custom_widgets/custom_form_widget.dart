import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class CustomForm {

  Widget textField(TextEditingController ctrl, textLabelText){

    return TextFormField(
      controller: ctrl,
      validator: (value) {
        if(value == null || value.isEmpty){
          return 'Please enter some text';
        }
        if(!value.contains('@')){
          return 'Not valid email';
        }
      },
      decoration: InputDecoration(
      labelText: textLabelText,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red 
          )
        )
      ),
    ); 
  }

  Widget passwordField(TextEditingController ctrl, obscureTextCharacter){
    
    return TextFormField(
      controller: ctrl,
      validator: (value) {
      if( value == null || value.isEmpty){
        return 'Please enter some text';
      }
      if(value.length < 8){
        return 'Minimum length is 8';
      }
        return null;
      },
      obscureText: true,
      obscuringCharacter: obscureTextCharacter,
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
            color: Colors.red 
          )
        )
      ),
    );
  }

  Widget confirmPasswordField( TextEditingController ctrl, TextEditingController passwordCtrl, obscureTextCharacter){
    return TextFormField(
      controller: ctrl,
      validator: (value) {
      if( value == null || value.isEmpty){
        return 'Please enter some text';
      }
      if(value != passwordCtrl.text){
        return 'Passwords not the same';
      }
        return null;
      },
      obscureText: true,
      obscuringCharacter: obscureTextCharacter,
      decoration: const InputDecoration(
        labelText: 'Confirm Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
            color: Colors.red 
          )
        )
      ),
    );    
  }

}
