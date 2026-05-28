// In Xcode:
// - Version 26.2 (17C52)
// - Version 26.4 (24909)
// - Version 26.4.1 (24909.0.3)
// - Version 26.5 (17F42)

// (Step 1) Set the width of an Xcode Editor pane: so this file wraps after 65th column:
//34567891123456789212345678931234567894123456789512345678961234567897
//  ^^^^^ wrap should show "67897" aligned above these carats.

// (Step 2) build this project

@AddMemberOfSpecificLength  // (Step 3) <--- expand this macro
struct Good {}

@AddMemberOfSpecificLength  // (Step 4) <--- expand this macro and observe crash
struct Good2 {}

// (4) Expect Xcode crash



/// A macro that adds a member
@attached(member, names: named(answer))
public macro AddMemberOfSpecificLength() = #externalMacro(module: "macro_learnMacros", type: "SpecificLengthMacro")

// Nothing important here: just give compiler a main to
// satisfy the build:
@main
struct MainApp {
    static func main() {
    }
}

