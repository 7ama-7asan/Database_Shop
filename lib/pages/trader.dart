import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database/Components/ShowDialoge.dart';
import 'package:database/Firebase/inser_data_to_Merchant_Firebase%20.dart';
import 'package:database/Firebase/inser_data_to_items_Firebase.dart';
import 'package:database/Models/Getting_Items_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Trader extends StatefulWidget {
  const Trader({Key? key}) : super(key: key);

  @override
  State<Trader> createState() => _ItemsState();
}

class _ItemsState extends State<Trader> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _type = TextEditingController();
  final TextEditingController _brand = TextEditingController();
  final TextEditingController _priceSell = TextEditingController();
  final TextEditingController _priceBuy = TextEditingController();

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
              _buildTextField(_name, 'merchant Name'),
              _buildTextField(_type, 'merchant Type'),
              _buildTextField(_brand, 'merchant city'),
              _buildTextField(_priceSell, 'merchant number'),
              _buildTextField(_priceBuy, 'id'),
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
    String dataBrand = _brand.text;
    String dataPriceSell = _priceSell.text;
    String dataPriceBuy = _priceBuy.text;

    // Perform the data insertion logic here
    await inser_data_to_merchant_Firebase().insertMerchant(
        dataName, dataType, dataBrand, dataPriceSell, dataPriceBuy);
    // Optionally, you can clear the text fields after inserting data
    _name.clear();
    _type.clear();
    _brand.clear();
    _priceSell.clear();
    _priceBuy.clear();
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
        List<ItemsModel> _list = snapshot.data!.docs.map(
          (dataModel) {
            return ItemsModel(
                dataModel['name'],
                dataModel['type'],
                dataModel['brand'],
                dataModel['price_sell'],
                dataModel['price_buy']);
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
                  DataColumn(label: Text('Brand')),
                  DataColumn(label: Text('Price_Sell')),
                  DataColumn(label: Text('Price_Buy')),
                  DataColumn(label: Text('update')),
                ],
                rows: _list.map((data) {
                  return DataRow(cells: [
                    DataCell(Text(data.name)),
                    DataCell(Text(data.type)),
                    DataCell(Text(data.brand)),
                    DataCell(Text(data.price_sell)),
                    DataCell(Text(data.Price_buy)),
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
  TextEditingController brandController,
  TextEditingController price_sellController,
  TextEditingController price_buyController,
) async {
  nameController.text = data.name; // Set the initial value
  brandController.text = data.brand; // Set the initial value
  price_sellController.text = data.price_sell; // Set the initial value
  price_buyController.text = data.price.buy; // Set the initial value

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
            controller: brandController,
            decoration: InputDecoration(labelText: 'New Name'),
          ),
          Text('Current price_sell: ${data.type}'),
          TextField(
            controller: price_sellController,
            decoration: InputDecoration(labelText: 'New Name'),
          ),
          Text('Current price buy: ${data.brand}'),
          TextField(
            controller: price_buyController,
            decoration: InputDecoration(labelText: 'New Name'),
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
              'brand': brandController.text,
              'price_sell': price_sellController.text,
              'price_buy': price_buyController.text,
            });
            Navigator.of(context).pop();
          },
          child: Text('Update'),
        ),
      ],
    ),
  );
}
