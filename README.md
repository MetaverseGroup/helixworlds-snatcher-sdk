# Helixworlds Snatcher SDK


## TODO: 
* Methodchannels for native sdk for iOS and Android
* for SDK regarding this native please check out 
https://github.com/MetaverseGroup/helixworlds_native_gateway




# How to Create test app to integrate the SDK
* flutter create [app_name]
* cd [app_name]
* flutter pub get
* flutter run 
### if you encounter issue running your project 
* flutter doctor - (to be able to diagnose what your flutter tools lacks or having issues with)


## Setup
#### call this function to initialize the DI Class that will be used on the SDK
setupServices()

#### to access the ScanScreenWidget call this builder
ScanScreenWidget.builder(context)


#### on pubspecs.yaml please include this 
```
dependencies:
   helixworlds_snatcher_sdk:
     git:
       url: https://github.com/MetaverseGroup/helixworlds_snatcher_sdk.git 
       ref: main

flutter:
  uses-material-design: true

  assets:
    - packages/helixworlds_snatcher_sdk/assets/model.tflite

```

#### to test SDK package

* cd example 

* flutter run


#### run all unit tests cases
flutter test test/ 







