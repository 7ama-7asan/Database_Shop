import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database/Components/ShowDialoge.dart';
import 'package:database/Firebase/inser_data_to_Merchant_Firebase%20.dart';
import 'package:database/Firebase/inser_data_to_items_Firebase.dart';
import 'package:database/Models/Getting_Items_firebase.dart';
import 'package:database/Models/model_trader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

//test
class Trader extends StatefulWidget {
  const Trader({Key? key}) : super(key: key);

  @override
  State<Trader> createState() => _ItemsState();
}

class _ItemsState extends State<Trader> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _type = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _number = TextEditingController();
  final TextEditingController _id = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Trader'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextField(_name, 'trader Name'),
              _buildTextField(_type, 'trader Type'),
              _buildTextField(_city, 'trader city'),
              _buildTextField(_number, 'trader number'),
              _buildTextField(_id, 'id'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Call a function to insert data into Firebase here
                  insertData();
                },
                child: Text('Insert Data'),
              ),
              SizedBox(
                height: 20,
              ),
              ShowItemsRaport(_name)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 10,
        child: TextField(
          style: TextStyle(color: Colors.red),
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }

  // Function to insert data into Firebase
  void insertData() async {
    // Use the controllers to get the data from the text fields
    String dataName = _name.text;
    String dataType = _type.text;
    String dataCity = _city.text;
    String dataNumber = _number.text;
    String dataId = _id.text;

    // Perform the data insertion logic here
    await inser_data_to_merchant_Firebase()
        .insertMerchant(dataName, dataType, dataCity, dataNumber, dataId);
    // Optionally, you can clear the text fields after inserting data
    _name.clear();
    _type.clear();
    _city.clear();
    _number.clear();
    _id.clear();
  }

  Widget ShowItemsRaport(_name) {
    var _user = FirebaseAuth.instance.currentUser;
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection('users')
        .doc(_user!.email.toString())
        .collection('merchant');

    return StreamBuilder<QuerySnapshot>(
      stream: collectionReference.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Center(child: Text('Loading...'));
        List<TraderModel> _list = snapshot.data!.docs.map(
          (dataModel) {
            return TraderModel(dataModel['name'], dataModel['type'],
                dataModel['city'], dataModel['number'], dataModel['id']);
          },
        ).toList();

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(border: Border.all()),
            child: DataTable(
                columns: [
                  const DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Type')),
                  DataColumn(label: Text('city')),
                  DataColumn(label: Text('number')),
                  DataColumn(label: Text('id')),
                  DataColumn(label: Text('update')),
                ],
                rows: _list.map((data) {
                  return DataRow(cells: [
                    DataCell(Text(data.name)),
                    DataCell(Text(data.type)),
                    DataCell(Text(data.city)),
                    DataCell(Text(data.number.toString())),
                    DataCell(Text(data.id.toString())),
                    DataCell(
                        onTap: () {}, showEditIcon: true, Icon(Icons.update)),
                  ]);
                }).toList()),
          ),
        );
      },
    );
  }
}

Future<void> UpdateItems(
  BuildContext context,
  data,
  TextEditingController nameController,
  TextEditingController typeController,
  TextEditingController cityController,
  TextEditingController numberController,
) async {
  nameController.text = data.name; // Set the initial value
  typeController.text = data.brand; // Set the initial value
  cityController.text = data.price_sell; // Set the initial value
  numberController.text = data.price.buy; // Set the initial value

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      content: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'New Name'),
          ),
          Text('Current brand: ${data.name}'),
          TextField(
            controller: typeController,
            decoration: InputDecoration(labelText: 'New type'),
          ),
          Text('Current price_sell: ${data.type}'),
          TextField(
            controller: cityController,
            decoration: InputDecoration(labelText: 'New city'),
          ),
          Text('Current price buy: ${data.brand}'),
          TextField(
            controller: numberController,
            decoration: InputDecoration(labelText: 'New number'),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            await FirebaseFirestore.instance
                .collection('users')
                .doc('yadgar@gtc.com')
                .collection('merchant')
                .doc(data.id.toString())
                .update({
              'name': nameController.text,
              'type': typeController.text,
              'city': cityController.text,
              'number': numberController.text,
            });
            Navigator.of(context).pop();
          },
          child: Text('Update'),
        ),
      ],
    ),
  );
}
