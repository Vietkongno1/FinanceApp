

import 'package:financeapp/src/data/model/add_date.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

class AddScreen extends StatefulWidget {
  AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final box = Hive.box<Add_data>('data');
  DateTime date = DateTime.now();
  String? selctedItem;
  String? selctedItemi;
  FocusNode ex = FocusNode();
  FocusNode amount = FocusNode();
  final TextEditingController expalin_C = TextEditingController();
  final TextEditingController amount_C = TextEditingController();
  final List<String> _item = [
    'food',
    "Transfer",
    "Transportation",
    "Education"
  ];
  final List<String> _itemei = ['Income', 'Expand'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ex.addListener(() {
      setState(() {});
      amount.addListener(() {
        setState(() {});
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            background_container(context),
            Positioned(top: 120, child: main_container())
          ],
        ),
      ),
    );
  }

  Container main_container() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      width: 340,
      height: 550,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          name(),
          SizedBox(
            height: 30,
          ),
          explain(),
          SizedBox(
            height: 30,
          ),
          amount_(),
          SizedBox(
            height: 30,
          ),
          how(),
          SizedBox(
            height: 30,
          ),
          date_time(),
          Spacer(),
          save(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  GestureDetector save() {
    return GestureDetector(
          onTap: (){
            var add = Add_data(selctedItemi!, expalin_C.text, amount_C.text, selctedItemi!, date);
            box.add(add);
            Navigator.of(context).pop();
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xff368983)
            ),
            width: 120,
              height: 50,
              child: Text("Save",
              style: TextStyle(
                fontFamily: 'f',
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 17
              ),),
          ),
        );
  }

  Widget date_time() {
    return Container(
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: Color(0xffC5C5C5)),
          ),
          width: 300,
          height: 50,
          child: TextButton(
            onPressed: () async {
              DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100));
              if(newDate == null){
                date = newDate!;
              }

            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text("Date : ${date.year} / ${date.day} / ${date.month}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15
              ),),
            ),
          ),
        );
  }

  Padding how() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: 300,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: const Color(0xffC5C5C5))),
        child: DropdownButton(
            value: selctedItemi,
            items: _itemei
                .map((e) => DropdownMenuItem(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            e,
                            style: const TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                      value: e,
                    ))
                .toList(),
            selectedItemBuilder: (BuildContext context) => _itemei
                .map((e) => Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          e,
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    ))
                .toList(),
            hint: const Text("How"),
            dropdownColor: Colors.white,
            isExpanded: true,
            underline: Container(),
            onChanged: ((value) {
              setState(() {
                selctedItemi = value!;
              });
            })),
      ),
    );
  }

  Padding amount_() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        focusNode: amount,
        controller: amount_C,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            labelText: "Amount",
            labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(width: 2, color: Color(0xffC5C5C5))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(width: 2, color: Color(0xffC5C5C5)))),
      ),
    );
  }

  Padding explain() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        focusNode: ex,
        controller: expalin_C,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            labelText: "Explain",
            labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5)))),
      ),
    );
  }

  Padding name() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: 300,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 2, color: const Color(0xffC5C5C5))),
        child: DropdownButton(
            value: selctedItem,
            items: _item
                .map((e) => DropdownMenuItem(
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            child: Image.asset("images/${e}.png"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            e,
                            style: const TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                      value: e,
                    ))
                .toList(),
            selectedItemBuilder: (BuildContext context) => _item
                .map((e) => Row(
                      children: [
                        Container(
                          width: 42,
                          child: Image.asset('images/${e}.png'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          e,
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    ))
                .toList(),
            hint: const Text("Name"),
            dropdownColor: Colors.white,
            isExpanded: true,
            underline: Container(),
            onChanged: ((value) {
              setState(() {
                selctedItem = value!;
              });
            })),
      ),
    );
  }
}

Column background_container(BuildContext context) {
  return Column(
    children: [
      Container(
        width: double.infinity,
        height: 240,
        decoration: const BoxDecoration(
            color: Color(0xff368983),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back, color: Colors.white)),
                  const Text(
                    "Adding",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.attach_file_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}
