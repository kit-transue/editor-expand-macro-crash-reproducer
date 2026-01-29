#  editor-expand-macro-crash-reproducer

Demonstrate editor crash during "Expand Macro." This was
a 100% reproducible crash until I resized my window and since
then I have been unable to replicate any crash.

Editor: Xcode Version 26.2 (17C52)


## Steps that reproduced

- build
- arrange editor pane to wrap after 65th column:
  - with default layout: open a second editor pane on right (proably depends on monitor size)
  - with single window: narrow Xcode window to minimum allowed, then expand left-side tool panel until alignment marks in editor for OpenThisFile.swift show 65 monospaced columns
- in either editor: navigate to ``Good`` in "OpenThisFile.swift"
- expand the @AddMemberOfSpecificLength macro
- repeat for ``Good2``
- experience immediate, 100% repeatable crash on multiple computers


## Line wrap

A prerequisite for this reproducer was to have two editor
panes open side-by-side. The crash did not reproduce in a single
editor pane.

In simplifying this case, I found the reproducer was sensitive
to the number of bytes in the macro expansion but not to syntax:
you can add/remove declarations, change identifier lengths, but
the comments need to be padded so the total length stayed the
same.

There was an additional sensitivity to line length: if parts
of the long line were moved to another line, the crash would
disappear. At least one line needed to be long-ish.

I suspect a boundary condition near the line wrap point.

With this theory: the crash may go away if the editor window
is resized. It reproduces with a single editor pane if the
editor wraps (for monospaced source lines) after column 65.
