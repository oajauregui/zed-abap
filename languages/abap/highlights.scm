; NOTE ON PRECEDENCE: Zed's docs only document ONE fallback mechanism —
; multiple captures on the SAME node within a SINGLE pattern, resolved
; right-to-left (rightmost tried first, falls back left), e.g.
; `(type_identifier) @type @variable`. Whether a *separate* later pattern in
; this file can override an earlier pattern's capture on the same node is
; NOT documented. To stay correct regardless of that, this file avoids
; overlapping patterns entirely: there is no generic `(name) @variable`
; catch-all. Every `(name)` capture below is scoped to a specific,
; mutually-exclusive field/parent position, and each carries its own
; `@variable` fallback via the documented same-pattern mechanism. Bare
; `name` occurrences in positions not called out below (e.g. LOOP AT
; control variables, obsolete-statement operands) render uncolored rather
; than risk a wrong override.

; ── Comments & literals ─────────────────────────────────────────────
[
  (bol_comment)
  (eol_comment)
] @comment

(numeric_literal) @number
(character_literal) @string
(string_template) @string
(text_symbol) @constant

(field_symbol_name) @variable.special
(field_symbol (name) @variable.special)
(variable (name) @variable)
(inline_declaration name: (name) @variable)

; ABAP-specific aliased identifier positions (each is its own distinct
; node type — no overlap with any other pattern in this file)
(type) @type
(itab) @variable
(result) @variable
(data_source) @type @variable
(structure_name) @variable
(strucure_name) @variable
(component_name) @property @variable

; ── Types: class / interface names ──────────────────────────────────
(class_declaration name: (name) @type @variable)
(class_declaration superclass: (name) @type @variable)
(class_implementation name: (name) @type @variable)
(interface_declaration name: (name) @type @variable)
(class_publication name: (name) @type @variable)
(class_local_friend_publication name: (name) @type @variable)
(call_method_static class_name: (name) @type @variable)
(attribute_access_static class: (name) @type @variable)
(raise_exception_statement class: (name) @type @variable)
(catch_statement exception: (name) @type @variable)

; Exception classes on METHODS/CONSTRUCTOR RAISING / EXCEPTIONS clauses
(method_declaration raising: (name) @type @variable)
(method_declaration exceptions: (name) @type @variable)
(class_method_declaration raising: (name) @type @variable)
(class_method_declaration exceptions: (name) @type @variable)
(constructor_declaration raising: (name) @type @variable)
(constructor_declaration exceptions: (name) @type @variable)

; RFC-style exception/return-code names on CALL FUNCTION ... EXCEPTIONS
(return_code_binding exception: (name) @constant @variable)

; ── Functions / methods ──────────────────────────────────────────────
(method_declaration name: (name) @function @variable)
(class_method_declaration name: (name) @function @variable)
(method_redefinition (name) @function @variable)
(method_implementation name: (name) @function @variable)
(function_implementation name: (name) @function @variable)
(call_method name: (name) @function @variable)
(call_method_static method_name: (name) @function @variable)
(call_method_instance method_name: (name) @function @variable)
(predicate_call name: (name) @function.builtin @function @variable)
(macro_include name: (name) @function @variable)

; ── Parameters / structure fields ────────────────────────────────────
(method_parameters (name) @property @variable)
(returning_parameter (name) @property @variable)
(parameter_binding formal_parameter: (name) @property @variable)
(comp_spec component: (name) @property @variable)
(structure_component (name) @property @variable)

; ── Built-in constants ────────────────────────────────────────────────
; These only compete with each other (both scoped to the exact same
; regex-matched subset), never with the rules above — no cross-pattern
; precedence risk.
((name) @constant.builtin @constant
  (#match? @constant.builtin "^(?i)abap_(true|false|undefined|on|off)$"))

((structure_name) @constant.builtin @constant
  (#match? @constant.builtin "^(?i)sy$"))

; ── Keywords ──────────────────────────────────────────────────────────
[
  "abstract"
  "adjacent"
  "all"
  "any"
  "append"
  "appending"
  "as"
  "ascending"
  "assign"
  "assigning"
  "at"
  "begin"
  "binary"
  "block"
  "bound"
  "by"
  "call"
  "case"
  "cast"
  "casting"
  "catch"
  "changing"
  "check"
  "checkbox"
  "class"
  "class-data"
  "class-methods"
  "class_constructor"
  "clear"
  "collect"
  "comment"
  "comparing"
  "concatenate"
  "cond"
  "condense"
  "constructor"
  "continue"
  "conv"
  "corresponding"
  "create"
  "cross"
  "data"
  "default"
  "deferred"
  "definition"
  "delete"
  "descending"
  "distinct"
  "duplicates"
  "else"
  "elseif"
  "enabled"
  "end"
  "endcase"
  "endclass"
  "endfunction"
  "endif"
  "endinterface"
  "endloop"
  "endmethod"
  "endselect"
  "endtry"
  "entries"
  "eq"
  "except"
  "exception"
  "exceptions"
  "exit"
  "expanding"
  "exporting"
  "fail"
  "field"
  "field-symbol"
  "field-symbols"
  "fields"
  "filter"
  "final"
  "first"
  "for"
  "found"
  "frame"
  "friends"
  "from"
  "function"
  "gaps"
  "global"
  "group"
  "hashed"
  "id"
  "if"
  "ignore"
  "implementation"
  "importing"
  "in"
  "include"
  "index"
  "inheriting"
  "initial"
  "inner"
  "interface"
  "into"
  "is"
  "join"
  "keeping"
  "key"
  "left"
  "length"
  "like"
  "line"
  "lines"
  "listbox"
  "local"
  "loop"
  "lower"
  "mapping"
  "memory"
  "method"
  "methods"
  "modif"
  "move-corresponding"
  "ne"
  "nested"
  "new"
  "no"
  "no-display"
  "non-unique"
  "object"
  "obligatory"
  "occurrence"
  "occurrences"
  "of"
  "on"
  "optional"
  "order"
  "others"
  "output"
  "parameters"
  "primary"
  "private"
  "protected"
  "public"
  "pushbutton"
  "radiobutton"
  "raise"
  "raising"
  "read"
  "read-only"
  "receiving"
  "redefinition"
  "reduce"
  "ref"
  "reference"
  "replace"
  "report"
  "resumable"
  "returning"
  "right"
  "rows"
  "search"
  "section"
  "select"
  "selection-screen"
  "separated"
  "set"
  "shared"
  "single"
  "skip"
  "sort"
  "sorted"
  "split"
  "standard"
  "statics"
  "step"
  "switch"
  "table"
  "tables"
  "target"
  "then"
  "throw"
  "title"
  "to"
  "translate"
  "transporting"
  "try"
  "type"
  "unique"
  "up"
  "update"
  "upper"
  "user-command"
  "using"
  "value"
  "value-request"
  "visible"
  "when"
  "where"
  "with"
  "write"
] @keyword

"return" @keyword.return @keyword

[
  "and"
  "or"
  "not"
] @keyword.operator @keyword

; ── Operators ─────────────────────────────────────────────────────────
[
  "="
  "<>"
  "+"
  "-"
  "*"
  "**"
  "/"
  "DIV"
  "MOD"
  "&&"
  "!"
] @operator

"@" @punctuation.special

; ── Punctuation ───────────────────────────────────────────────────────
[
  "("
  ")"
  "[ "
  "]"
] @punctuation.bracket

[
  "."
  ","
  ":"
  "->"
  "=>"
  "~"
] @punctuation.delimiter
