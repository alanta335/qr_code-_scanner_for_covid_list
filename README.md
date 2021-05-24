![BFH Banner](https://trello-attachments.s3.amazonaws.com/542e9c6316504d5797afbfb9/542e9c6316504d5797afbfc1/39dee8d993841943b5723510ce663233/Frame_19.png)
# CoViQrR

QR Code scanner for covid list

QR code scanner is a mobile application where shopkeepers have an app that shows QR code and users can scan this QR code which will automatically add that user to the visitor list. This should replace manual entry of contact details in the shop due to COVID.

## Team members

1. Alan T A https://github.com/alanta335
2. Akhil Krishna S https://github.com/ilmentore72

## Team Id

BFH/recdRQxvgOGx8Toyv/2021

## Link to product walkthrough

https://www.loom.com/share/56504be922274405a47afde25a27e1f3

## How it Works ?
1. Step 1
2. Step 2

## Libraries used

environment:
  sdk: ">=2.12.0 <3.0.0"
minSdkVersion: 21
qr_flutter: 4.0.0
qr_code_scanner: 0.4.0
firebase_core: 1.2.0
firebase_auth: 1.2.0
cloud_firestore: 2.2.0
rflutter_alert: 2.0.2
flutter_spinkit: 5.0.0
url_launcher: 6.0.4

## How to configure
Instructions for setting up project

flutter pub get
create a firebase project and download the json file.
put the firebase json file in the android\app\
In the firebase enable firebase authentication (email and password).
In the firebase enable firestore and start a collection named USER.


## How to Run
Instructions for running
