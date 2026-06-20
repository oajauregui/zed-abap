; ── Comments ──────────────────────────────────────────────────
(eol_comment) @comment
(bol_comment) @comment

; ── Literals ──────────────────────────────────────────────────
(numeric_literal) @number
(character_literal) @string
(string_template) @string
(text_symbol) @string

; ── Types ─────────────────────────────────────────────────────
(type) @type

; ── Field Symbols ─────────────────────────────────────────────
(field_symbol_name) @variable.special
(field_symbol (name) @variable.special)

; ── Variables (chained DATA: declarations) ────────────────────
(variable (name) @variable)

; ── Inline declarations ───────────────────────────────────────
(inline_declaration name: (name) @variable)
(inline_fs_declaration (field_symbol_name) @variable.special)

; ── Constructor expressions ───────────────────────────────────
(constructor_expression (type) @type)

; ── SELECT modifier (SINGLE / DISTINCT) ───────────────────────
(select_modifier) @keyword

; ── Function end (ENDFUNCTION) ────────────────────────────────
(function_end) @keyword

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

; ── Built-in predicate functions (line_exists, xsdbool, etc.) ─
(predicate_call name: (name) @function.builtin)

; ── Keywords ──────────────────────────────────────────────────
[
  ; Data declarations
  "data"
  "statics"
  "class-data"
  "field-symbols"
  ; Report / selection screen
  "tables"
  "selection-screen"
  "parameters"
  "block"
  "frame"
  "title"
  "skip"
  "radiobutton"
  "group"
  "user-command"
  "value-request"
  "pushbutton"
  "obligatory"
  "no-display"
  "on"
  "output"
  "modif"
  "checkbox"
  "listbox"
  "visible"
  "length"
  "as"
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
  "field-symbol"
  "bound"
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
  ; Read table / table key
  "read"
  "with"
  "key"
  "unique"
  "non-unique"
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
  ; SORT
  "sort"
  "by"
  "ascending"
  "descending"
  ; CASE/WHEN
  "case"
  "endcase"
  "when"
  "others"
  ; CONCATENATE
  "concatenate"
  "separated"
  "gaps"
  ; CONDENSE
  "condense"
  ; REPLACE
  "replace"
  "first"
  "occurrence"
  "occurrences"
  ; DELETE
  "delete"
  "adjacent"
  "duplicates"
  "comparing"
  "index"
  ; COLLECT
  "collect"
  ; APPEND variants
  "lines"
  ; LOOP/ENDLOOP
  "endloop"
  ; FUNCTION/ENDFUNCTION
  "endfunction"
  ; SELECT ORDER BY
  "order"
  "primary"
  ; TRANSLATE
  "translate"
  "upper"
  "lower"
  ; SPLIT
  "split"
  ; Constructor expressions
  "cond"
  "switch"
  "new"
  "conv"
  "cast"
  "filter"
  "reduce"
  "corresponding"
  "then"
  "throw"
  ; ABAP 7.4 — ASSIGN
  "assign"
  "casting"
  ; ABAP 7.4 — MOVE-CORRESPONDING
  "move-corresponding"
  "expanding"
  "nested"
  "keeping"
  "target"
  ; ABAP 7.4 — CORRESPONDING MAPPING/EXCEPT / FILTER USING KEY
  "mapping"
  "except"
  "using"
  ; ENDSELECT
  "endselect"
  ; SQL JOIN
  "inner"
  "join"
  "left"
  "right"
  "cross"
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
  "&&"
  "DIV"
  "MOD"
  "eq"
  "ne"
] @operator

; ── Punctuation ───────────────────────────────────────────────
["(" ")"] @punctuation.bracket
["." "," ":"] @punctuation.delimiter