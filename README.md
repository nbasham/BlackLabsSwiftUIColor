# BlackLabsSwiftUIColor


## Installation

### Swift Package Manager
If you are using Xcode 11 or later:
1. Click `File`
2. `Swift Packages`
3. `Add Package Dependency...`
4. Enter: https://github.com/nbasham/BlackLabsSwiftUIColor/

### UserDefaults
Works with `UIColor` and `Color`. `Color` is determined at runtime. This implementation grags the current .light/.dark color and save's it, the color being saved will loose the .light/.dark color not currently in use. `UIColor` uses `UserDefaults.standard.uicolor(forKey)` and `UserDefaults.standard.uicolors(forKey)` API.
```swift
let color = Color.red
UserDefaults.standard.set(color, forKey: "key")
if let savedColor: Color = UserDefaults.standard.color(forKey: "key") {
print("Loaded Color from UserDefaults: \(savedColor.hex)")
}

let colors: [Color] = [.red, .orange, .pink]
UserDefaults.standard.set(colors, forKey: "arraykey")
if let savedColors: [Color] = UserDefaults.standard.colors(forKey: "arraykey") {
print("Loaded [Color] from UserDefaults: \(savedColors.map { $0.hexWithAlpha })")
}
```

### Example project
[Example project demonstrating usage.](https://github.com/nbasham/SwiftUIColors)

![Readme image](https://github.com/nbasham/BlackLabsSwiftUIColor/blob/main/SwiftUIColors.png?raw=true)
