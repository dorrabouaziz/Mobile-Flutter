
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer.widget.dart';


import '../model/contact.model.dart';
import '../service/contact.service.dart';

class AjoutModifContactPage extends StatefulWidget {
  AjoutModifContactPage({this.contact, this.modifMode = false});
  final Contact? contact;
  final bool modifMode;
  @override
  State<AjoutModifContactPage> createState() => _AjoutModifContactPageState();
}

class _AjoutModifContactPageState extends State<AjoutModifContactPage> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  Contact contact = Contact();
  ContactService contactService = ContactService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title:
          Text(widget.modifMode ? "Edit Contact Page" : "Add Contact Page",
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Colors.blueAccent[100],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(5),
            child: Container(
              color: Colors.limeAccent[200],
              height: 3,
            ),
          ),
        ),
        drawer: MyDarwer(),
        body: Form(
          key: globalKey,
          child: _formUI(context),
        ),
        bottomNavigationBar: SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FormHelper.submitButton(
                widget.modifMode ? "Edit" : "Add",
                    () {
                  if (validateAndSave()) {
                    if (widget.modifMode) {
                      contactService.modifierContact(contact!).then((value) {
                        Navigator.pop(context);
                      });
                    } else {
                      contactService.ajouterContact(contact!).then((value) {
                        Navigator.pop(context);
                      });
                    }
                  }
                },
                borderRadius: 10,
                btnColor: Colors.green.shade400,
                borderColor: Colors.green.shade400,
              ),
              FormHelper.submitButton(
                "Annuler",
                    () {
                  Navigator.pop(context);
                },
                borderRadius: 10,
                btnColor: Colors.grey,
                borderColor: Colors.grey,
              ),
            ],
          ),
        ));
  }
  @override
  void initState(){
    super.initState();
    if(widget.modifMode) contact =widget.contact!;
  }
  _formUI(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            FormHelper.inputFieldWidgetWithLabel(
              context,
              "nom",
              "Nom",
              "",
                  (onValidate) {
                if (onValidate.isEmpty) {
                  return "* Required";
                }
                return null;
              },
                  (onSaved) {
                contact!.nom = onSaved.toString().trim();
              },
              initialValue: widget.modifMode ? contact!.nom! : "",
              showPrefixIcon: true,
              prefixIcon: const Icon(
                Icons.text_fields,
                color: Colors.blueAccent,
              ),
              borderColor: Colors.blueAccent.shade100,
              borderWidth: 30,
              borderRadius: 10,
              contentPadding: 15,
              fontSize: 14,
              labelFontSize: 14,
              paddingLeft: 0,
              paddingRight: 0,
              prefixIconPaddingLeft: 10,
            ),
            FormHelper.inputFieldWidgetWithLabel(
              context,
              "telephone",
              "Téléphone",
              "",
                  (onValidate) {
                if (onValidate.isEmpty) {
                  return "* Required";
                }
                return null;
              },
                  (onSaved) {
                contact!.tel = int.parse(onSaved.toString().trim());
              },
              initialValue: widget.modifMode ? contact!.tel.toString() : "",
              showPrefixIcon: true,
              prefixIcon: const Icon(Icons.numbers, color: Colors.blueAccent),
              borderRadius: 10,
              borderColor: Colors.blueAccent.shade100,
              borderWidth: 30,
              contentPadding: 15,
              fontSize: 14,
              labelFontSize: 14,
              paddingLeft: 0,
              paddingRight: 0,
              prefixIconPaddingLeft: 10,
              isNumeric: true,
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}