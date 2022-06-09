import 'dart:io';
import 'package:capstone_design/presentation/page/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';

class AddUmkm extends StatefulWidget {
  const AddUmkm({Key? key}) : super(key: key);

  @override
  State<AddUmkm> createState() => _AddUmkmState();
}

class _AddUmkmState extends State<AddUmkm> {
  File? image;
  LatLng? _center;
  String? address, imageName, urlName, name, type;
  late Position currentLocation;

  void pickImg() async {
    var selectedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      image = File(selectedImage!.path);
      imageName = basename(image!.path);
    });
  }

  void addData(BuildContext context) {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child(imageName! + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(image!);
    User user = FirebaseAuth.instance.currentUser!;
    FirebaseFirestore.instance.runTransaction((transaction) async {
      CollectionReference reference =
          FirebaseFirestore.instance.collection("UMKM");
      uploadTask.then((res) async {
        urlName = await res.ref.getDownloadURL();
        if (name != null && type != null) {
          await reference.add({
            "name": name,
            "email": user.email,
            "latitude": currentLocation.latitude,
            "longitude": currentLocation.longitude,
            "coverUrl": urlName,
            "type": type,
            "verivication": false,
          });
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Dashboard(user: user);
          }));
          image = null;
          imageName = null;
        } else {
          AlertDialog alert = AlertDialog(
            title: Text("Silahkan lengkapi data"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok"))
            ],
          );
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUserLocation();
    setState(() {});
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);
    });
    getAddressFromLatLong(currentLocation);
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  }

  Future<Position> locateUser() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Nama"),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: "Jenis"),
              onChanged: (value) {
                setState(() {
                  type = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: getUserLocation,
              child: Text("get location"),
            ),
            (_center != null)
                ? Column(
                    children: [
                      Text("Lattitude: ${_center!.latitude}"),
                      Text("Longitude: ${_center!.longitude}"),
                      Text("Address: $address"),
                    ],
                  )
                : Text("Lokasi belum didapatkan"),
            ElevatedButton(
              onPressed: () {
                pickImg();
              },
              child: Text("Input Foto"),
            ),
            (image == null) ? Text("Tidak ada gambar") : Image.file(image!),
            ElevatedButton(
              onPressed: () {
                addData(context);
              },
              child: Text("Send UMKM"),
            ),
          ],
        ),
      ),
    ));
  }
}
