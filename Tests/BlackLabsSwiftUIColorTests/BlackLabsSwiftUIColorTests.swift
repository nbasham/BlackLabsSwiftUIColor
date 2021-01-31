import XCTest
import SwiftUI

@testable import BlackLabsSwiftUIColor

final class BlackLabsSwiftUIColorTests: XCTestCase {
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
    }

    static var allTests = [
        ("testExample", testExample),
    ]
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

