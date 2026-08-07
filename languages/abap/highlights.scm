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
(form_implementation name: (name) @function @variable)
(call_method name: (name) @function @variable)
(call_method_static method_name: (name) @function @variable)
(call_method_instance instance_name: (name) @variable)
(call_method_instance method_name: (name) @function @variable)
(functional_call_instance instance_name: (name) @variable)
(functional_call_instance method_name: (name) @function @variable)
(functional_call_static class_name: (name) @type @variable)
(functional_call_static method_name: (name) @function @variable)
(predicate_call name: (name) @function.builtin @function @variable)
(macro_include name: (name) @function @variable)
(perform_statement name: (name) @function @variable)
(perform_statement program: (name) @type @variable)

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
  "byte-ca"
  "byte-cn"
  "byte-co"
  "byte-cs"
  "byte-na"
  "byte-ns"
  "ca"
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
  "cn"
  "co"
  "collect"
  "comment"
  "commit"
  "comparing"
  "concatenate"
  "cond"
  "condense"
  "constants"
  "constructor"
  "continue"
  "conv"
  "corresponding"
  "cp"
  "create"
  "cross"
  "cs"
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
  "empty"
  "enabled"
  "end"
  "endcase"
  "endclass"
  "endfunction"
  "endif"
  "endform"
  "endinterface"
  "endloop"
  "endmethod"
  "endselect"
  "endtry"
  "endwhile"
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
  "form"
  "found"
  "frame"
  "friends"
  "from"
  "function"
  "gaps"
  "ge"
  "global"
  "group"
  "gt"
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
  "insert"
  "interface"
  "interfaces"
  "into"
  "is"
  "join"
  "keeping"
  "key"
  "le"
  "left"
  "length"
  "level"
  "like"
  "line"
  "lines"
  "listbox"
  "local"
  "loop"
  "lower"
  "lt"
  "m"
  "mapping"
  "memory"
  "message"
  "method"
  "methods"
  "modif"
  "move-corresponding"
  "na"
  "ne"
  "nested"
  "new"
  "no"
  "no-display"
  "non-unique"
  "np"
  "ns"
  "number"
  "o"
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
  "perform"
  "primary"
  "private"
  "protected"
  "public"
  "pushbutton"
  "radiobutton"
  "raise"
  "raising"
  "range"
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
  "rollback"
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
  "types"
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
  "while"
  "with"
  "write"
  "z"
] @keyword

"return" @keyword.return @keyword

[
  "and"
  "or"
  "not"
] @keyword.operator @keyword

; ── Operators ─────────────────────────────────────────────────────────
; "=>" is not listed here as a bare token: it's ambiguous with the "=>"
; punctuation below (static class/interface member access, no spaces) --
; both compile to the identical anonymous token, so a bare-text pattern
; can't tell them apart. Scoped to its actual parent node instead.
[
  "="
  "<>"
  "><"
  "<="
  ">="
  "=<"
  "<"
  ">"
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

(comparison_expression "=>" @operator)

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
  "~"
] @punctuation.delimiter

; "=>" as static member access (class=>attribute / class=>method( )) --
; see the note above the operator list for why this can't be a bare pattern.
(attribute_access_static "=>" @punctuation.delimiter)
(call_method_static "=>" @punctuation.delimiter)
(functional_call_static "=>" @punctuation.delimiter)
