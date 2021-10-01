# LetterboxdAPI

## Required
- Swift 5.3


## Installation

### Xcode
Project > Swift Packages

```
git@github.com:gianpispi/LetterboxdAPI.git
```

### Swift Package Manager
You can install it via SPM in your `Package.swift`:

``` swift
import PackageDescription

let package = Package(name: "YourPackage",
    dependencies: [
      .Package(url: "https://github.com/gianpispi/LetterboxdAPI", majorVersion: 0),
    ]
)
```
You must then use import SwiftLocation to use the core features.


## Usage
``` swift
import LetterboxdAPI

// AppDelegate.swift file
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    LetterboxdAPI.setUpAPIKeys(publicAPI: "<<API Key>>", privateAPI: "<<API Secret>>")
    
    return true
}
```

### Get the LID (Letterboxd ID) and type for a Letterboxd URL (eg: boxd.it/<<ID>> or letterboxd.com/<<something>>)
``` swift
let url = URL(string: "https://letterboxd.com/film/free-guy/")!
LetterboxdAPI.shared.getLID(for: url) { result in
    switch result {
    case .success(let obj):
        // obj of type LetterboxdObject, which has the object LID and the  object type (LetterboxdType)
        print(obj.lid)
        
    case .failure(let error):
        // error is of type LetterboxdAPIError and is `wrongResponse`
        print(error)
    }
}
```

## Contributing

- If you need help or you'd like to ask a general question, open an issue.
- If you found a bug, open an issue.
- If you have a feature request, open an issue.
- If you want to contribute, submit a pull request.


## API Documentation
[Letterboxd API](https://api-docs.letterboxd.com)


## Author
gianpispi
