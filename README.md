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


### Code Setup 
* on pubspecs.yaml please include this 
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



### Troubleshooting issues in the Flutter Environment 
* flutter doctor - (to be able to diagnose what your flutter tools lacks or having issues with)



## Running 
* dart run build_runner build (add this command if you are experiencing problems with model)
* cd example
* flutter run 


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







