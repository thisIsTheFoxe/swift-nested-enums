# Swift Enums with Associated Values
![Swift CI](https://github.com/thisisthefoxe/swift-nested-enums/workflows/Swift/badge.svg)

## Intro
This need for this idea came from modeling an item-category with sub-categories. Since those can be enumerated and have discrete, finite values, something like this would be neat:

```swift
let myItems: [Item] = [.item1, .super1(.subItem1), .super2(.subItem2)]
```

*Note, that for this idea `subItem1` and `subItem2` would have similar properties, namely a title (as RawValue) and a decription.*
Now, there might be the need to list all possible items and sub-items. Or one might simply want to check if some `Item` has an associated value (in this case a sub-item) or not. Sadly, there is no such functionality in Swift (yet), so there's no way to manage without some sort of `switch-case-let`. However, in order to avoid having those all over the codebase, it would be neat to have a general pattern for this. That is the purpose of this repo. 


## Explanation
### AssociatedValues
This Playground is an example for the first part of the Intro. Having a `associatedValue` variable, to check if some `Item` has an associated value or not. If the values aren't similar, the type of that variable couls also be `Any?`. 

### AssociatedValueType
This Playground demonstrated the second part. Having a `associatedValueType` which is also a `CaseIterable` enum, it is possible to loop through every possible `Item` case.
