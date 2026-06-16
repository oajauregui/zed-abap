; ── Comments ──────────────────────────────────────────────────
(eol_comment) @comment
(bol_comment) @comment

; ── Literals ──────────────────────────────────────────────────
(numeric_literal) @number
(character_literal) @string

; ── Types ─────────────────────────────────────────────────────
(type) @type

; ── Field Symbols ─────────────────────────────────────────────
(field_symbol_name) @variable.special
(field_symbol (name) @variable.special)

; ── Variables (chained DATA: declarations) ────────────────────
(variable (name) @variable)

; ── Named declarations ────────────────────────────────────────
(class_declaration name: (name) @type)
(class_implementation name: (name) @type)
(interface_declaration name: (name) @type)
(function_implementation name: (name) @function)
(method_implementation name: (name) @function)
(method_declaration name: (name) @function)
(class_method_declaration name: (name) @function)

; ── Method / function calls ───────────────────────────────────
(call_method_static class_name: (name) @type method_name: (name) @function)
(call_method_instance instance_name: (name) @variable method_name: (name) @function)
(call_method name: (name) @function)
(call_function name: (character_literal) @string)

; ── Keywords ──────────────────────────────────────────────────
[
  ; Data declarations
  "data"
  "field-symbols"
  "begin"
  "end"
  "of"
  "line"
  "read-only"
  "value"
  "reference"
  "optional"
  ; Types
  "type"
  "like"
  "ref"
  "standard"
  "sorted"
  "hashed"
  "table"
  "any"
  ; OO structure
  "class"
  "endclass"
  "interface"
  "endinterface"
  "definition"
  "implementation"
  "inheriting"
  "from"
  "abstract"
  "final"
  "create"
  "public"
  "protected"
  "private"
  "section"
  "friends"
  "local"
  "deferred"
  "shared"
  "memory"
  "enabled"
  ; Methods
  "method"
  "endmethod"
  "methods"
  "class-methods"
  "class_constructor"
  "constructor"
  "redefinition"
  "importing"
  "exporting"
  "changing"
  "returning"
  "raising"
  "resumable"
  "exceptions"
  "receiving"
  "default"
  "ignore"
  "fail"
  ; Function modules
  "function"
  "endfunction"
  "call"
  "exception"
  ; Control flow
  "if"
  "elseif"
  "else"
  "endif"
  "check"
  "return"
  "exit"
  "continue"
  "try"
  "catch"
  "endtry"
  "raise"
  ; Loops
  "loop"
  "endloop"
  "at"
  "into"
  "assigning"
  "from"
  "to"
  "step"
  ; SQL
  "select"
  "where"
  "up"
  "rows"
  "corresponding"
  "fields"
  "appending"
  "for"
  "all"
  "entries"
  "in"
  ; Read table
  "read"
  "with"
  "key"
  "binary"
  "search"
  "transporting"
  "no"
  ; Misc statements
  "clear"
  "append"
  "object"
  "include"
  "found"
  "write"
  "report"
  ; Logical
  "not"
  "and"
  "or"
  "is"
  "initial"
] @keyword

; ── Operators ─────────────────────────────────────────────────
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
  "eq"
  "ne"
] @operator

; ── Punctuation ───────────────────────────────────────────────
["(" ")"] @punctuation.bracket
["." "," ":"] @punctuation.delimiter