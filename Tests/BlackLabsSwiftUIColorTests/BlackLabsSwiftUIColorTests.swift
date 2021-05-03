import XCTest
import SwiftUI

@testable import BlackLabsSwiftUIColor

final class BlackLabsSwiftUIColorTests: XCTestCase {

    @available(iOS 14.0, *)
    func testSampleCode() {
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
    }
    @available(iOS 14.0, *)
    func testSwiftUIColor() {
        let red = Color.red
        XCTAssertEqual(red.hex, "fe3a2f")
        let white = Color.white
        XCTAssertEqual(white.hex, "fefefe")
        let black = Color.black
        XCTAssertEqual(black.hex, "000000")
        let systemPink = Color.systemPink
        XCTAssertEqual(systemPink.hex, "fe2c54")
        
        let userDefaults = UserDefaults.createCleanForTest()
        userDefaults.set(Color.black, forKey: "BlackLabsSwiftUIColorTestsBlack")
        let color = userDefaults.color(forKey: "BlackLabsSwiftUIColorTestsBlack")!
        XCTAssertNotNil(color)
        XCTAssertEqual(color.hex, "000000")
        
        let colors:[Color] = [.red, .green, .blue]
        userDefaults.set(colors, forKey: "BlackLabsSwiftUIColorTestsArray")
        let loadedColors = userDefaults.colors(forKey: "BlackLabsSwiftUIColorTestsArray")!
        XCTAssertEqual(loadedColors[0].hex, Color.red.hex)
        XCTAssertEqual(loadedColors[1].hex, Color.green.hex)
        XCTAssertEqual(loadedColors[2].hex, Color.blue.hex)
        
        let uicolor = UIColor.green.withAlphaComponent(0)
        let greenColor = Color(uicolor)
        XCTAssertEqual(greenColor.hexWithAlpha, "00ff0000")
    }

    @available(iOS 13.0, *)
    func testExample() {
        for colorRecord in colorList {
            XCTAssertNotNil(colorRecord.color)
        }

        for hexRecord in hexList {
            XCTAssertNotNil(Color(hex: hexRecord.hex))
        }

        for hexRecord in hexWithAlphaList {
            XCTAssertNotNil(Color(hex: hexRecord.hex))
        }

        for hexRecord in hexWebColorsList {
            XCTAssertNotNil(Color(hex: hexRecord.hex))
        }

        for hexRecord in hexClearList {
            XCTAssertNotNil(Color(hex: hexRecord.hex))
        }

        XCTAssertNotNil(Color.random)
        
        for (name, hex) in UIColor.cssToHexDictionary {
            XCTAssertNotNil(Color(hex: hex), "Unable to resolve color for web color: '\(name)'.")
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

extension UserDefaults {
    private static var index = 0
    static func createCleanForTest(label: StaticString = #file) -> UserDefaults {
        index += 1
        let suiteName = "UnitTest-UserDefaults-\(label)-\(index)"
        UserDefaults().removePersistentDomain(forName: suiteName)
        return UserDefaults(suiteName: suiteName)!
    }
}


struct HexColorRecord: Identifiable {
    let id: UUID
    let hex: String?
    
    init(_ hex: String?) {
        id = UUID()
        self.hex = hex
    }
}

let hexList: [HexColorRecord] = [
    HexColorRecord("afe"),
    HexColorRecord("FFFF00"),
    HexColorRecord("#abc"),
    HexColorRecord("#00FF00"),
]

let hexWithAlphaList: [HexColorRecord] = [
    HexColorRecord("abc7"),
    HexColorRecord("#DEF7"),
    HexColorRecord("0000FF77"),
    HexColorRecord("#0000FF77"),
]

let hexWebColorsList: [HexColorRecord] = [
    HexColorRecord("LIGHTGREEN"),
    HexColorRecord("hotpink"),
    HexColorRecord("SEAGREEN"),
    HexColorRecord("Coral"),
    HexColorRecord("LAVENDER")
]


let hexClearList: [HexColorRecord] = [
    HexColorRecord(nil),
    HexColorRecord("clear"),
    HexColorRecord("Transparent"),
    HexColorRecord("")
]

@available(iOS 13.0, *)
struct ColorRecord: Identifiable {
    let id: String
    let color: Color
    let name: String
    
    init(_ name: String, _ color: Color) {
        id = name
        self.name = name
        self.color = color
    }
}

@available(iOS 13.0, *)
let colorList: [ColorRecord] = [
    ColorRecord("systemBlue", Color.systemBlue),
    ColorRecord("systemGreen", Color.systemGreen),
    ColorRecord("systemIndigo", Color.systemIndigo),
    ColorRecord("systemOrange", Color.systemOrange),
    ColorRecord("systemPink", Color.systemPink),
    ColorRecord("systemPurple", Color.systemPurple),
    ColorRecord("systemRed", Color.systemRed),
    ColorRecord("systemTeal", Color.systemTeal),
    ColorRecord("systemYellow", Color.systemYellow),
    ColorRecord("systemGray", Color.systemGray),
    ColorRecord("systemGray2", Color.systemGray2),
    ColorRecord("systemGray3", Color.systemGray3),
    ColorRecord("systemGray4", Color.systemGray4),
    ColorRecord("systemGray5", Color.systemGray5),
    ColorRecord("systemGray6", Color.systemGray6),
    ColorRecord("systemFill", Color.systemFill),
    ColorRecord("secondarySystemFill", Color.secondarySystemFill),
    ColorRecord("tertiarySystemFill", Color.tertiarySystemFill),
    ColorRecord("quaternarySystemFill", Color.quaternarySystemFill),
    ColorRecord("systemBackground", Color.systemBackground),
    ColorRecord("secondarySystemBackground", Color.secondarySystemBackground),
    ColorRecord("tertiarySystemBackground", Color.tertiarySystemBackground),
    ColorRecord("systemGroupedBackground", Color.systemGroupedBackground),
    ColorRecord("secondarySystemGroupedBackground", Color.secondarySystemGroupedBackground),
    ColorRecord("tertiarySystemGroupedBackground", Color.tertiarySystemGroupedBackground)
]

