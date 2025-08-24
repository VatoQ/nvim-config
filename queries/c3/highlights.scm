; Basic highlight queries for C3

[
  "if"
  "else"
  "while"
  "for"
  "return"
  "break"
  "continue"
] @keyword

[
  "import"
  "const"
  "union"
  "struct"
  "enum"
  "fn"
] @attribute

(base_type_name) @type

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
  (identifier_list
    (ident) @variable.parameter))


;; Struct members
(struct_member_declaration
  (type) @type
  (ident) @field)



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

(call_expr
  arguments: (call_arg_list
               (call_arg) @variable.parameter))
