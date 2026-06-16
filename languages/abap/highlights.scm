; ============================================================
; highlights.scm — ABAP (tree-sitter-abap)
; Node inventory sourced from grammar.js @ mkoval1/tree-sitter-abap
; ============================================================

; ── Comments ────────────────────────────────────────────────
; bol_comment: lines starting with *
; eol_comment: inline " ... to end-of-line
[
  (bol_comment)
  (eol_comment)
] @comment

; ── String literals ─────────────────────────────────────────
(character_literal) @string

; CALL FUNCTION 'FM_NAME' — the FM name is a character literal used as
; a function identifier; override @string with @function for that position.
(call_function name: (character_literal) @function)

; ── Numeric literals ─────────────────────────────────────────
(numeric_literal) @number

; ── Field symbols (<FS>) ─────────────────────────────────────
; The entire token including angle brackets is a single `field_symbol_name` node.
(field_symbol_name) @variable.special

; ── Type references ──────────────────────────────────────────
; `type` is an alias of `name` produced inside typing clauses
; (e.g. TYPE lcl_foo, TYPE REF TO cx_root).
(type) @type

; ── Class / Interface / Function — declaration names ─────────
(class_declaration        name: (name) @type)
(class_implementation     name: (name) @type)
(interface_declaration    name: (name) @type)
(function_implementation  name: (name) @function)

; ── Method declarations (inside CLASS ... DEFINITION) ────────
(method_declaration       name: (name) @function)
(class_method_declaration name: (name) @function)

; ── Method implementations (CLASS ... IMPLEMENTATION) ────────
(method_implementation    name: (name) @function)

; ── Variable declarations ─────────────────────────────────────
(variable_declaration name: (name) @variable)

; ── Static method / attribute calls  (Class=>member) ─────────
(call_method_static
  class_name:  (name) @type
  method_name: (name) @function)

(attribute_access_static
  class:     (name) @type
  attribute: (name) @property)

; ── Instance method calls  (ref->method) ──────────────────────
(call_method_instance
  instance_name: (name) @variable
  method_name:   (name) @function)

; ── Keywords ─────────────────────────────────────────────────
; Full inventory of kw() aliases defined in grammar.js.
; "and" / "or" / "not" intentionally included here (also logical);
; "return" gets its own semantic capture below.
[
  "abstract"
  "all"
  "append"
  "appending"
  "assigning"
  "at"
  "begin"
  "binary"
  "call"
  "catch"
  "changing"
  "check"
  "class"
  "class-methods"
  "class_constructor"
  "clear"
  "constructor"
  "continue"
  "corresponding"
  "create"
  "data"
  "default"
  "deferred"
  "definition"
  "enabled"
  "end"
  "endclass"
  "endfunction"
  "endif"
  "endinterface"
  "endloop"
  "endmethod"
  "endtry"
  "entries"
  "eq"
  "exception"
  "exceptions"
  "exit"
  "exporting"
  "fail"
  "field-symbols"
  "fields"
  "final"
  "for"
  "found"
  "friends"
  "from"
  "function"
  "global"
  "hashed"
  "if"
  "ignore"
  "implementation"
  "importing"
  "in"
  "include"
  "inheriting"
  "initial"
  "interface"
  "into"
  "is"
  "key"
  "like"
  "line"
  "local"
  "loop"
  "memory"
  "method"
  "methods"
  "ne"
  "no"
  "not"
  "object"
  "of"
  "optional"
  "private"
  "protected"
  "public"
  "raise"
  "raising"
  "read"
  "read-only"
  "redefinition"
  "ref"
  "reference"
  "report"
  "resumable"
  "returning"
  "rows"
  "search"
  "section"
  "select"
  "shared"
  "sorted"
  "standard"
  "step"
  "table"
  "to"
  "transporting"
  "try"
  "type"
  "up"
  "value"
  "where"
  "with"
  "write"
] @keyword

; Logical connectives
[
  "and"
  "or"
] @keyword

; RETURN is semantically a control-flow keyword — separate capture
; so themes that distinguish control-flow can style it differently.
"return" @keyword

; ── Comparison & arithmetic operators ─────────────────────────
[
  "="
  "<>"
  "+"
  "-"
  "*"
  "/"
  "**"
  "DIV"
  "MOD"
] @operator

; OO navigation operators (token.immediate in grammar)
"=>" @operator
"->" @operator

; ── Punctuation ───────────────────────────────────────────────
["(" ")"] @punctuation.bracket
["[" "]"] @punctuation.bracket

; Statement terminator and list separators
"." @punctuation.delimiter
"," @punctuation.delimiter
":" @punctuation.delimiter
