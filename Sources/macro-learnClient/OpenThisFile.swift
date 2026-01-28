// In Xcode Version 26.2 (17C52), open more than
// one editor pane, then expand both of the following
// macro usages (in either order):

// (1) build
@AddMemberOfSpecificLength  // (2) <--- expand this
struct Good {}

@AddMemberOfSpecificLength  // (3) <--- expand this
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

// Editor width gauge:
//34567891123456789212345678931234567894123456789512345678961234567897
