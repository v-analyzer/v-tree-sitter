# V tree-sitter

[![Test](https://github.com/spavn-analyzer/v-tree-sitter/actions/workflows/test_tree_sitter.yml/badge.svg)](https://github.com/spavn-analyzer/v-tree-sitter/actions/workflows/test_tree_sitter.yml)

V bindings for the
[tree-sitter](https://github.com/tree-sitter/tree-sitter)
parsing library.

## Installation

```sh
v install https://github.com/spavn-analyzer/v-tree-sitter
```

## Basic Usage

Create a parser with a grammar:

```v
import v_tree_sitter.tree_sitter
import v_tree_sitter.languages.tree_sitter_v as v

mut p := tree_sitter.new_parser[v.NodeType](v.type_factory)
p.set_language(v.language)
```

Parse some code:

```v
code := 'fn main() {}'
tree := p.parse_string(source: code)
```

Inspect the syntax tree:

```v skip
root := tree.root_node()

// (source_file (function_declaration name: (identifier) signature: 
// (signature parameters: (parameter_list)) body: (block)))
println(root)

fc := root.first_child()?

if fc.type_name == .function_declaration {
    if name_node := fc.child_by_field_name('name') {
        println('Found function: ${name_node.text(rope)}') // Found function: main
        println('Position: ${name_node.range()}')
        println('Line: ${name_node.start_point().row}') // Line: 0
    }
}
```

## Use old tree

```v
code := 'fn main() {}'
tree := p.parse_string(source: code, tree: old_tree.raw_tree)
```

## Examples

See examples in the `examples` directory.

## Project structure

- `examples` — examples of using the library
- `languages` — languages sources (only V for now)
- `lib` — tree-sitter C lib sources
- `tests` — tests for the bindings
- `tree_sitter` — bindings sources

## Updating tree-sitter

To update the tree-sitter lib, run:

```sh
v update_tree_sitter.vsh
```

## Authors

This project initially started by
[nedpals](https://github.com/nedpals)
and after that in 2023 it was heavily modified by the
[VOSCA](https://github.com/vlang-association).

## License

This project is under the **MIT License**.
See the
[LICENSE](https://github.com/vlang-association/spavn-analyzer/blob/master/tree_sitter/LICENSE)
file for the full license text.
