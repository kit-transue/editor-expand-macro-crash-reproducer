//
//  macro.swift
//
//  Created by Kit Transue on 2026-01-26.
//


import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

@main
struct macro_learnPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        SpecificLengthMacro.self,
    ]
}


/// Return a DeclSyntax of a particular length (112 bytes?)
///
/// - Important: The crash seems to be triggered only at this length expansion.
///   Removing or adding text to the expansion makes the crash disappear.
///   The crash is insensitive to the specific declarations added.
public struct SpecificLengthMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext) throws -> [DeclSyntax] {
            return [
                """
                let answer = 42
                // xxxxxxx xxxxxxx xxxxxxx
                // xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx
                //
                """
            ]
    }
}
