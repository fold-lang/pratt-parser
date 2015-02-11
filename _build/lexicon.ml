# 2 "lexicon.mll"
 

open Foundation

(* -- Literal -- *)

type literal =
    | Symbol of string
    | String of string
    | Float of float
    | Integer of int

let show_literal = function
    | Symbol  x -> format "`%s" x
    | String  x -> format "\"%s\"" x
    | Float   x -> format "%f" x
    | Integer x -> format "%d" x

(* -- Location -- *)

type location =
  { filename : string;
    line     : int;
    column   : int }

let empty_location =
	{ filename = "none";
	  line     = 0;
	  column   = 0 }

let show_location x =
	format "%s:%d:%d" x.filename x.line x.column


(* -- Token -- *)

type token_stream = Lexing.lexbuf

type token =
    { value    : literal;
      location : location }

let create_token value ?loc_opt () =
    { value = value;
      location = loc_opt => function
        | Some loc -> loc
        | None -> empty_location }

let tok v = create_token v ()

let start_token = create_token (Symbol "module") ()
let end_token   = create_token (Symbol "end")    ()

let show_token tok =
    format "%s @ %s" (show_literal  tok.value)
                     (show_location tok.location)

# 60 "lexicon.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base = 
   "\000\000\248\255\249\255\092\000\092\000\251\255\192\000\020\001\
    \002\000\255\255\005\000\006\000\104\001\179\001\216\001\044\002\
    \128\002\212\002\040\003\124\003\172\000\199\003\189\001\230\003\
    ";
  Lexing.lex_backtrk = 
   "\255\255\255\255\255\255\005\000\005\000\255\255\002\000\002\000\
    \001\000\255\255\006\000\255\255\005\000\003\000\005\000\005\000\
    \005\000\002\000\002\000\002\000\255\255\003\000\255\255\003\000\
    ";
  Lexing.lex_default = 
   "\002\000\000\000\000\000\255\255\255\255\000\000\255\255\255\255\
    \255\255\000\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    ";
  Lexing.lex_trans = 
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\008\000\009\000\008\000\008\000\010\000\008\000\009\000\
    \009\000\000\000\011\000\011\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \008\000\003\000\008\000\000\000\003\000\003\000\003\000\004\000\
    \005\000\005\000\003\000\003\000\000\000\003\000\003\000\003\000\
    \007\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\003\000\000\000\003\000\003\000\003\000\003\000\
    \003\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\000\000\000\000\000\000\003\000\004\000\
    \005\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\000\000\003\000\003\000\003\000\000\000\
    \003\000\003\000\003\000\004\000\000\000\000\000\003\000\003\000\
    \000\000\003\000\003\000\003\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\003\000\000\000\
    \003\000\003\000\003\000\003\000\003\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\000\000\
    \000\000\000\000\003\000\004\000\000\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\022\000\
    \003\000\022\000\003\000\000\000\021\000\021\000\021\000\021\000\
    \021\000\021\000\021\000\021\000\021\000\021\000\000\000\004\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\013\000\000\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \001\000\004\000\004\000\004\000\004\000\012\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\000\000\000\000\000\000\000\000\006\000\
    \000\000\004\000\004\000\004\000\004\000\012\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\013\000\000\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\004\000\014\000\004\000\
    \004\000\012\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\015\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\016\000\004\000\004\000\000\000\
    \000\000\000\000\000\000\006\000\000\000\004\000\014\000\004\000\
    \004\000\012\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\015\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\016\000\004\000\004\000\004\000\
    \000\000\000\000\000\000\022\000\000\000\022\000\000\000\000\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\000\000\000\000\000\000\000\000\004\000\
    \000\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\013\000\013\000\013\000\013\000\013\000\
    \013\000\013\000\013\000\013\000\013\000\021\000\021\000\021\000\
    \021\000\021\000\021\000\021\000\021\000\021\000\021\000\000\000\
    \020\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \019\000\019\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\013\000\000\000\000\000\000\000\000\000\000\000\
    \020\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\000\000\000\000\000\000\000\000\004\000\
    \000\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\018\000\018\000\018\000\018\000\
    \018\000\018\000\018\000\018\000\004\000\004\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\000\000\
    \000\000\000\000\000\000\004\000\000\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \017\000\017\000\017\000\017\000\017\000\017\000\017\000\017\000\
    \017\000\017\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\017\000\017\000\017\000\017\000\017\000\017\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\000\000\000\000\000\000\000\000\004\000\
    \000\000\017\000\017\000\017\000\017\000\017\000\017\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\017\000\017\000\017\000\017\000\
    \017\000\017\000\017\000\017\000\017\000\017\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\017\000\017\000\017\000\
    \017\000\017\000\017\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\000\000\
    \000\000\000\000\000\000\017\000\000\000\017\000\017\000\017\000\
    \017\000\017\000\017\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \018\000\018\000\018\000\018\000\018\000\018\000\018\000\018\000\
    \004\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\000\000\000\000\000\000\000\000\018\000\
    \000\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\019\000\019\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\000\000\
    \000\000\000\000\000\000\019\000\000\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\021\000\
    \021\000\021\000\021\000\021\000\021\000\021\000\021\000\021\000\
    \021\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\021\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\000\000\000\000\000\000\000\000\023\000\000\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000";
  Lexing.lex_check = 
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\008\000\000\000\000\000\008\000\010\000\
    \011\000\255\255\010\000\011\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\008\000\255\255\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\255\255\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\255\255\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\255\255\255\255\255\255\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\255\255\000\000\003\000\000\000\255\255\
    \003\000\003\000\003\000\004\000\255\255\255\255\003\000\003\000\
    \255\255\003\000\003\000\003\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\003\000\255\255\
    \003\000\003\000\003\000\003\000\003\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\255\255\
    \255\255\255\255\003\000\004\000\255\255\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\020\000\
    \003\000\020\000\003\000\255\255\020\000\020\000\020\000\020\000\
    \020\000\020\000\020\000\020\000\020\000\020\000\255\255\006\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\006\000\255\255\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\255\255\255\255\255\255\255\255\006\000\
    \255\255\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\007\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\007\000\255\255\007\000\007\000\007\000\007\000\
    \007\000\007\000\007\000\007\000\007\000\007\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\007\000\007\000\007\000\
    \007\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
    \007\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
    \007\000\007\000\007\000\007\000\007\000\007\000\007\000\255\255\
    \255\255\255\255\255\255\007\000\255\255\007\000\007\000\007\000\
    \007\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
    \007\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
    \007\000\007\000\007\000\007\000\007\000\007\000\007\000\012\000\
    \255\255\255\255\255\255\012\000\255\255\012\000\255\255\255\255\
    \012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
    \012\000\012\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
    \012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
    \012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
    \012\000\012\000\012\000\255\255\255\255\255\255\255\255\012\000\
    \255\255\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
    \012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
    \012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
    \012\000\012\000\012\000\013\000\013\000\013\000\013\000\013\000\
    \013\000\013\000\013\000\013\000\013\000\022\000\022\000\022\000\
    \022\000\022\000\022\000\022\000\022\000\022\000\022\000\255\255\
    \013\000\255\255\255\255\255\255\255\255\255\255\255\255\014\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
    \014\000\014\000\013\000\255\255\255\255\255\255\255\255\255\255\
    \013\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
    \014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
    \014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
    \014\000\014\000\014\000\255\255\255\255\255\255\255\255\014\000\
    \255\255\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
    \014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
    \014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
    \014\000\014\000\014\000\015\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\015\000\015\000\015\000\015\000\
    \015\000\015\000\015\000\015\000\015\000\015\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\015\000\015\000\015\000\
    \015\000\015\000\015\000\015\000\015\000\015\000\015\000\015\000\
    \015\000\015\000\015\000\015\000\015\000\015\000\015\000\015\000\
    \015\000\015\000\015\000\015\000\015\000\015\000\015\000\255\255\
    \255\255\255\255\255\255\015\000\255\255\015\000\015\000\015\000\
    \015\000\015\000\015\000\015\000\015\000\015\000\015\000\015\000\
    \015\000\015\000\015\000\015\000\015\000\015\000\015\000\015\000\
    \015\000\015\000\015\000\015\000\015\000\015\000\015\000\016\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \016\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\016\000\255\255\255\255\255\255\255\255\016\000\
    \255\255\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\016\000\017\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\017\000\017\000\017\000\017\000\
    \017\000\017\000\017\000\017\000\017\000\017\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\017\000\017\000\017\000\
    \017\000\017\000\017\000\017\000\017\000\017\000\017\000\017\000\
    \017\000\017\000\017\000\017\000\017\000\017\000\017\000\017\000\
    \017\000\017\000\017\000\017\000\017\000\017\000\017\000\255\255\
    \255\255\255\255\255\255\017\000\255\255\017\000\017\000\017\000\
    \017\000\017\000\017\000\017\000\017\000\017\000\017\000\017\000\
    \017\000\017\000\017\000\017\000\017\000\017\000\017\000\017\000\
    \017\000\017\000\017\000\017\000\017\000\017\000\017\000\018\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \018\000\018\000\018\000\018\000\018\000\018\000\018\000\018\000\
    \018\000\018\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\018\000\018\000\018\000\018\000\018\000\018\000\018\000\
    \018\000\018\000\018\000\018\000\018\000\018\000\018\000\018\000\
    \018\000\018\000\018\000\018\000\018\000\018\000\018\000\018\000\
    \018\000\018\000\018\000\255\255\255\255\255\255\255\255\018\000\
    \255\255\018\000\018\000\018\000\018\000\018\000\018\000\018\000\
    \018\000\018\000\018\000\018\000\018\000\018\000\018\000\018\000\
    \018\000\018\000\018\000\018\000\018\000\018\000\018\000\018\000\
    \018\000\018\000\018\000\019\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\019\000\019\000\019\000\019\000\
    \019\000\019\000\019\000\019\000\019\000\019\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\019\000\019\000\019\000\
    \019\000\019\000\019\000\019\000\019\000\019\000\019\000\019\000\
    \019\000\019\000\019\000\019\000\019\000\019\000\019\000\019\000\
    \019\000\019\000\019\000\019\000\019\000\019\000\019\000\255\255\
    \255\255\255\255\255\255\019\000\255\255\019\000\019\000\019\000\
    \019\000\019\000\019\000\019\000\019\000\019\000\019\000\019\000\
    \019\000\019\000\019\000\019\000\019\000\019\000\019\000\019\000\
    \019\000\019\000\019\000\019\000\019\000\019\000\019\000\021\000\
    \021\000\021\000\021\000\021\000\021\000\021\000\021\000\021\000\
    \021\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\023\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\021\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\255\255\255\255\255\255\255\255\023\000\255\255\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_base_code = 
   "";
  Lexing.lex_backtrk_code = 
   "";
  Lexing.lex_default_code = 
   "";
  Lexing.lex_trans_code = 
   "";
  Lexing.lex_check_code = 
   "";
  Lexing.lex_code = 
   "";
}

let rec read_token lexbuf =
    __ocaml_lex_read_token_rec lexbuf 0
and __ocaml_lex_read_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 78 "lexicon.mll"
      ( read_token lexbuf )
# 414 "lexicon.ml"

  | 1 ->
# 80 "lexicon.mll"
      ( read_token lexbuf )
# 419 "lexicon.ml"

  | 2 ->
let
# 81 "lexicon.mll"
                   x
# 425 "lexicon.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 82 "lexicon.mll"
      ( create_token (Integer (int_of_string x)) () )
# 429 "lexicon.ml"

  | 3 ->
let
# 83 "lexicon.mll"
                     x
# 435 "lexicon.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 84 "lexicon.mll"
      ( create_token (Float (float_of_string x)) () )
# 439 "lexicon.ml"

  | 4 ->
let
# 85 "lexicon.mll"
                            c
# 445 "lexicon.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 86 "lexicon.mll"
      ( create_token (Symbol (String.make 1 c)) () )
# 449 "lexicon.ml"

  | 5 ->
let
# 87 "lexicon.mll"
                                            x
# 455 "lexicon.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 88 "lexicon.mll"
      ( create_token (Symbol x) () )
# 459 "lexicon.ml"

  | 6 ->
let
# 89 "lexicon.mll"
         c
# 465 "lexicon.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 90 "lexicon.mll"
    ( failwith ("Unrecognized character: " ^ (String.make 1 c)) )
# 469 "lexicon.ml"

  | 7 ->
# 92 "lexicon.mll"
    ( end_token )
# 474 "lexicon.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; 
      __ocaml_lex_read_token_rec lexbuf __ocaml_lex_state

;;

