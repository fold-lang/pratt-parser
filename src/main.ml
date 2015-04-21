
open Fold.Foundation
open Fold.Syntax
open Fold.Lexer
open Fold.Parser
open Fold.Pratt
open Fold.Lang


let fold_logo =
blue ("     ▗▐▝        ▐▐      ▐▐   ") ^ ("|" ^ bright_white "  A modern pragmatic functional language.\n") ^
blue ("    ▐▐     ▗▗   ▐▐    ▗▗▐▐   ") ^ ("|" ^ bright_white "\n") ^
blue ("  ▝▝▐▐▝▝ ▐▐  ▐▐ ▐▐  ▐▐  ▐▐   ") ^ ("|" ^ bright_white "  Version 0.0.1-alpha+001 (2015-02-12)\n") ^
blue ("    ▐▐   ▐▐  ▐▐ ▐▐  ▐▐  ▐▐   ") ^ ("|  " ^ (underline (bright_white "http://fold-lang.org\n"))) ^
blue ("    ▐▐     ▝▝    ▝▝   ▝▝▝    ") ^ ("|" ^ bright_white "  Type ? for help.\n") ^
blue ("  ▗▐▝                      \n") ^
          "                           \n"  ^
 (italic "  \"Simplicity is prerequisite for reliability.\"\n") ^
      "      — Edsger W. Dijkstra"



let rec eval env = function
    | Lit lit -> begin match lit with
        | Sym x -> assert false
        | Char x -> assert false
        | Str x -> assert false
        | Float x -> assert false
        | Int x -> x
    end
    | App (Lit (Sym "+"), [e1; e2]) -> (eval env e1) + (eval env e2)
    | App (Lit (Sym "-"), [e1; e2]) -> (eval env e1) - (eval env e2)
    | App (Lit (Sym "/"), [e1; e2]) -> (eval env e1) / (eval env e2)
    | App (Lit (Sym "*"), [e1; e2]) -> (eval env e1) * (eval env e2)
    | _ -> assert false

let loop () =
    while true do try
        print_string (bright_blue "-> " ^ start_white);
        flush stdout;
        let lexer = create_lexer_with_channel "<REPL>" stdin in
        let e = init ~lexer ~grammar: core_lang () in
        print (green " = " ^ start_white ^ (show_expr e))
    with
        Failure msg -> print_endline @@ (bright_red " * Error" ^ ": " ^ msg);
                       flush stdout
    done

let () =
    print (end_color ^ "\n" ^ fold_logo ^ "\n");
    Tests.run ();
    loop ()

