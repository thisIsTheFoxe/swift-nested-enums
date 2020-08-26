import Foundation

// MARK: Definitions

protocol P: CustomStringConvertible {
    init?(rawValue: String)
    var rawValue: String { get }

    static var allEnumCases: [P] { get }
}

extension P where Self: CaseIterable {
    static var allEnumCases: [P] { allCases as! [P] }
}


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
    case e1(E1), e2(E2), x, y, z
}
extension X {
    var associatedValue: P? {
        switch self {
        case let .e1(x):
            return x
        case let .e2(x):
            return x
        default: return nil
        }
    }
    
    var associatedValueType: P.Type? {
        switch self {
        case .e1:
            return E1.self
        case .e2:
            return E2.self
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


// MARK: Implementaion

func write(enumCase: X) {
    print("Title: \(enumCase.title)")
    if let aValue = enumCase.associatedValue, let type = enumCase.associatedValueType {
        print("  Value: \(aValue.rawValue)")
        print("  All Values:")
        listValues(for: type)
    }
}

func listValues(for type: P.Type) {
    for x in type.allEnumCases {
        print("    \(x.rawValue)")
    }
}

write(enumCase: .e1(.a))
write(enumCase: .y)
write(enumCase: .e2(.d))


// MARK: Possible breaking change

/*
struct S: P, CaseIterable {
    static var allCases: [E1] { E1.allCases }
    
    typealias AllCases = [E1]
    
    init?(rawValue: String) {
        self.rawValue = rawValue
        self.description = ""
    }
    
    var rawValue: String
        
    var description: String
}

let s = S(rawValue: "x")
S.allEnumCases
 */
