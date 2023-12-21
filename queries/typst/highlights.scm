;; All scopes: comments
(comment) @comment @spell

;; Code
;; punctuation
["#"] @punctuation.special
[":" ";" "," ".." "sep"] @punctuation.delimiter
["(" ")" "{" "}"] @punctuation.bracket
;; TODO: context blocks?
[ "[" "]" ] @punctuation.bracket
;; operators
[
 "-"
 "+"
 "*"
 "/"

 "=="
 "!="
 "<"
 "<="
 ">"
 ">="

 "="

 "as"
 "in"
 "and"
 "or"
 "not"
 "end"
] @operator
;; keywords
[ "import" "include" ] @include
[ "let" "set" "show" ] @keyword
;; control flow
[ "for" "while" "break" "continue" ] @repeat
[ "if" "else" ] @conditional
;; special case: #for (ident) in (expr)
(for "in" @repeat)
;; type literals
(number) @number
(string) @string
(bool) @boolean
;; identifiers
(builtin) @namespace
(ident) @variable
;; name-value pairs
(tagged
  field: (ident)) @field
;; function definitions, calls, etc.
;; TODO: support for functions such as #calc.cos, tree view appears as
;; (call)
;;  item: (field)
;;   (builtin)
;    field: (ident)
(call
  item: (builtin) @function.builtin)
(call
  item: (ident) @function.call)
(call
  item: (field field: (ident)) @method.call)

;; Text
;; (text) @text
(heading) @text.title
(strong) @text.strong
(emph) @text.emphasis
(url) @text.uri
(quote) @text.quote
(content ["[" "]"] @operator)
;; literals
(linebreak) @constant.builtin
(symbol) @character
(letter) @character
;; code blocks
(raw_span) @text.literal
(raw_span
  (blob)) @text.literal
(raw_blck) @text.literal
(raw_blck
  (blob)) @text.literal.block
;; refs and labels
(label) @text.reference
(ref) @text.reference

;; Math
(math "$" @operator) @text.math
(attach _ "^" @operator
  sup: _)
(attach _ "_" @operator
  sub: _)
(shorthand) @constant.macro
(align) @operator
