![Banner](./banner.png)

## Getting Started
[Coda Link](https://coda.io/d/_dnFTWBVBuj5/Mobile-Development-Flutter_suZvc)


### Prerequisites
* Download and install Flutter SDK
* Download and install Android Studio
* Download and install Xcode (if mac users)
* Download and install Sourcetree


## Description
Helixworld . Mobile App for the Helixworld.



### Setup 

* our first setup is to download the flutter SDK
[Flutter SDK Link Install Mac](https://docs.flutter.dev/get-started/install/macos)

* Download also Sourcetree for Code Version Management
[Sourcetree for Windows or Mac](https://www.sourcetreeapp.com/)

* add existing local repo and point it to where you put the Flutter SDK and then checkout the version `3.13.7`
* setup and Download Android Studio
* setup and Download

## Clone Repo
> git clone https://github.com/MetaverseGroup/helixworlds-snatcher-sdk.git

> create new app in flutter
* flutter create [app_name]
* cd [app_name]
* flutter pub get
* flutter run 


## Running
> sample app inside the SDK for testing the SDK
* dart run build_runner build (add this command if you are experiencing problems with model not generated after pulling)
* cd example
* flutter run 


### Troubleshooting
> if you encounter issue running your project 
* flutter doctor - (to be able to diagnose what your flutter tools lacks or having issues with)


### Integration Setup
> call this function to initialize the DI Class that will be used on the SDK
```
  import 'package:helixworlds_snatcher_sdk/core/service_di.dart';
  import 'package:helixworlds_snatcher_sdk/helixworlds_sdk.dart';

  setupServices()

  /// this will get you access to the methods available on the SDK 
  getSDK()

  /// this is the methods you can use for scanning we should use the scanItem method and provide an optional param if is using amazon rekognition
  Future<Either<Failure, Success>> scanItems(InputImage image);
  Future<Either<Failure, Success>> scanItem({bool isAR = false});
  Future<Either<Failure, Success>> scanItemsByAR(XFile image);

  Future<Either<Failure, String>> getUserId();
  Future<Either<Failure, Success>> cacheFavoritesItem(InventoryItemModel model);
  Future<Either<Failure, List<MyLogModel>>> fetchFavoritesItems();
  Future<Either<Failure, List<MyLogModel>>> fetchScannedItems();
  Future<Either<Failure, Success>> redirectToUrl(String murl); 
  bool isLocalFetch();
  String getDefaultUserId();

```


> on pubspecs.yaml please include this 
```
dependencies:
   // production version from pub dev
   helixworlds_snatcher_sdk: ^1.0.0+1

   // use this if you are testing the modified version in github (remove this if using the one from pub dev)
   helixworlds_snatcher_sdk:
     git:
       url: https://github.com/MetaverseGroup/helixworlds_snatcher_sdk.git 
       ref: main

flutter:
  uses-material-design: true
  assets:
    - packages/helixworlds_snatcher_sdk/assets/model.tflite

```

#### Testing
> run all unit tests cases
flutter test test/ 







