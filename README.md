# zed-abap

ABAP language support for the [Zed](https://zed.dev) editor.

## Features

- Syntax highlighting (keywords, strings, comments, types, operators, field symbols)
- Bracket matching and rainbow brackets `()` `[]`
- Document outline — classes, interfaces, methods, and function modules
- File type detection for all common ABAP file variants

## Supported file extensions

| Extension | Object type |
|---|---|
| `.abap` | Generic ABAP source |
| `.prog.abap` | Program |
| `.fugr.abap` | Function group |
| `.clas.abap` | Class |
| `.intf.abap` | Interface |
| `.fugr.include.abap` | Function group include |
| `.tabl.abap` | Table definition |
| `.ddls.abap` | CDS view |

## Installation

### From the Zed extension registry

1. Open the Command Palette (`Cmd+Shift+P` / `Ctrl+Shift+P`)
2. Run **Extensions: Install Extension**
3. Search for **ABAP** and install

### For local development

1. Clone this repo
2. In Zed, run **Extensions: Install Dev Extension**
3. Select the cloned folder

## Grammar

Syntax parsing is powered by [tree-sitter-abap](https://github.com/oajauregui/tree-sitter-abap), a
dedicated grammar built for this extension (not a fork of an existing one). The
`rev` pinned in `extension.toml` tracks that repo's `main` branch as it
gains coverage.

## Comment toggling

`Cmd+/` (macOS) / `Ctrl+K Ctrl+C` (Windows/Linux) inserts `" ` (double-quote) inline comments.

Beginning-of-line `*` comments are parsed and highlighted by the grammar but are not used as the toggle-comment token, since they are only valid at column 1.

## License

MIT — see [LICENSE](./LICENSE)
