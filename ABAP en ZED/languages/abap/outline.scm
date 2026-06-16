; outline.scm — ABAP
; Powers the Outline Panel (Cmd+Shift+O) and the breadcrumb trail.
;
; @item   = the full node that constitutes one outline entry
; @name   = the text that is displayed in the outline
; @context = ancestor node shown as prefix context (e.g. class name for a method)

; ── Top-level containers ──────────────────────────────────────

(class_declaration
  name: (name) @name) @item

(class_implementation
  name: (name) @name) @item

(interface_declaration
  name: (name) @name) @item

(function_implementation
  name: (name) @name) @item

; ── Method implementations ────────────────────────────────────
; @context picks up the enclosing class_implementation name so the outline
; entry reads "ClassName > method_name" in the breadcrumb.

(class_implementation
  name: (name) @context
  (method_implementation
    name: (name) @name) @item)

; Standalone (non-class) method implementation fallback
(method_implementation
  name: (name) @name) @item
