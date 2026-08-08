[
  "if"
  "else"
  "while"
  "for"
  "return"
  "break"
  "continue"
  "const"
  "struct"
  "union"
  "alias"
  "enum"
  "extern"
] @keyword

[
  "fn"
] @attribute


[
 "import"
 "module"
] @keyword.import


(base_type_name) @type
(type_ident) @type

(func_declaration
    (func_header 
      (ident) @function))

(import_declaration
  path: (path_ident) @property)

;; Return types
(func_header
  return_type: (type) @type)

(func_param_list
  (param) @parameter)


;(attributes) @attribute

(call_inline_attributes
  (at_ident) @attribute.name)


(call_inline_attributes) @attribute.block

; Struct declarations
(struct_declaration
  name: (type_ident) @type)


(struct_member_declaration
  ;(type) @type
  (identifier_list
    (ident) @variable.parameter))

(func_definition
  (func_header
    (ident) @function))

(enum_declaration
  name: (type_ident) @type
  body: (enum_body
          (enum_constant) @constant))

(declaration
  type: (type) @type
  name: (ident) @variable.parameter)

(string_literal) @string

(integer_literal) @number
(char_literal) @string.special
(real_literal) @number
(call_expr
  function: (ident_expr) @function)

(block_comment) @comment
(doc_comment) @comment
(line_comment) @comment
(const_ident) @constant
(binary_expr
  (ident_expr) @variable.parameter)

(assignment_expr
  (ident_expr) @variable.parameter)

(update_expr
  argument: (ident_expr) @variable.parameter)

(subscript_expr
  argument: (ident_expr) @variable.parameter
  index: (ident_expr) @variable.parameter)

(field_expr
  argument: (ident_expr) @variable.parameter)

(access_ident) @field

(call_expr
  arguments: (call_arg_list
               (call_arg) @variable.parameter))


(module_declaration
  path: (path_ident) @property)


(attribute
  name: (at_ident) @attribute)


(escape_sequence) @string.special


(return_stmt
  (ident_expr
    (ident) @variable.parameter))

;(ident_expr
;  (ident) @variable.parameter)


; (unary_expr
;   argument: (ident_expr
;               (ident) @variable.parameter))
