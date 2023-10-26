# Helixworlds Snatcher SDK


## TODO: 
* Methodchannels for native sdk for iOS and Android




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
       ref: initial_branch

flutter:
  uses-material-design: true

  assets:
    - packages/helixworlds_snatcher_sdk/assets/model.tflite

```

#### to test SDK package

* cd example 

* flutter run







