import Foundation

// MARK: Definitions

enum E1: String, CaseIterable {
    case a, b
}

extension E1: P {
    var description: String {
        switch self {
        case .a:
            return "a"
        case .b:
            return "b"
        }
    }
}

enum E2: String, CaseIterable {
    case c, d
}

extension E2: P {
    var description: String {
        switch self {
        case .d:
            return "d"
        case .c:
            return "c"
        }
    }
}

enum X {
    case e1(E1.Type), e2(E2.Type), x, y, z
}

extension X {
    var associatedValueType: P.Type? {
        switch self {
        case let .e1(x):
            return x.self as P.Type
        case let .e2(x):
            return x.self as P.Type
        default: return nil
        }
    }
    
    var title: String {
        switch self {
        case .e1: return "e1"
        case .e2: return "e2"
        case .x: return "x"
        case .y: return "y"
        case .z: return "z"
        }
    }
}


extension X: CaseIterable {
    public static var allCases: [X] {
        //thorws an error in playgounds
        [.x, .y, .z]
    }
}


// MARK: Implementaion

func writeAll() {
    for enumCase in X.allCases {
        print("Title: \(enumCase.title)")
        E1.a()
        if let type = enumCase.associatedValueType {
            print("  All Values:")
            listValues(for: type)
        }
    }
}

func listValues(for type: P.Type) {
    for x in type.allEnumCases {
        print("    \(x.rawValue)")
    }
}

writeAll()
