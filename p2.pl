/*
Names: Sadie Sanders, April Gauthreaux
Emails: sas111@email.latech.edu, ajg044@email.latech.edu
Date: 02/13/2025
Course #: CSC 330 002
Quarter: Winter 2025
Project #: Project 2 - Prolog
*/

allTogether(NumL,R) :-
    % deals with ascii numbers of commas and parenthesis
    delNum(NumL,NumL2),
    
    % takes rest of ascii list and turns it into a string, then string list 
    string_codes(Str,NumL2),
    split_string(Str, " ", " ", StrList),
    
    % removes "tree", "operator", "number" from string list
    rmStr(StrList, X),
    % converts to integers
    toInt(X, NewX),
    % converts operators to atoms
    toAtom(NewX, Z).


% take ascii num list and replace commas and parenthesis with spaces
delNum(L, X) :- replace(44, L, X1), replace(40, X1, X2), replace(41, X2, X).
% helper function
replace(_,[],[]).
replace(N, [N|T], [32|R]) :- replace(N, T, R).
replace(N, [H|T], [H|R]) :- H \== N, replace(N, T, R).


% take string list and deletes all occurrences of "tree", "operator", "number"
rmStr([],[]).
rmStr([H|T], [H|R]) :- 
    H \= "tree",
    H \= "operator",
    H \= "number", !,
    rmStr(T, R).
rmStr([_|T], R) :- rmStr(T, R).

% covert strings in array to integers - April
toInt([H|T], [N|NewT]) :- number_string(N, H), !, toInt(T, NewT).
toInt([H|T], [H|NewT]) :- toInt(T, NewT).
% base case
toInt([],[]).

toAtom([H|T], [A|NewT]) :- string(H), atom_string(A, H), toAtom(T,NewT).
toAtom([H|T], [H|NewT]) :- integer(H), toAtom(T,NewT).
toAtom([],[]).

% reverse: reverse an array, go from pre- to post-fix
% theres a built in predicate for this in our notes
reverse([H|T], R):-
    reverse(T, NewH),
    append(NewH, [H], R).
reverse([], []).

% postfix stack, number stack, Result
% check if number
postfix([Pancake|Extra], PancakeStack, Res):-
    Pancake \= [], Pancake \= pl, Pancake \= mi, Pancake \= ti, Pancake \= di,
    postfix(Extra, [Pancake|PancakeStack], Res).
% check if operator
postfix([pl|Extra], [TopPancake|[BottomPancake|PancakeStack]], Res):-
    NewPancake is TopPancake + BottomPancake,
    postfix(Extra, [NewPancake|PancakeStack], Res).
postfix([mi|Extra], [TopPancake|[BottomPancake|PancakeStack]], Res):-
    NewPancake is TopPancake - BottomPancake,
    postfix(Extra, [NewPancake|PancakeStack], Res).
postfix([ti|Extra], [TopPancake|[BottomPancake|PancakeStack]], Res):-
    NewPancake is TopPancake * BottomPancake,
    postfix(Extra, [NewPancake|PancakeStack], Res).
postfix([di|Extra], [TopPancake|[BottomPancake|PancakeStack]], Res):-
    BottomPancake \= 0,
    NewPancake is TopPancake / BottomPancake,
    postfix(Extra, [NewPancake|PancakeStack], Res).
% check for division by zero
postfix([di|_], [_|[0|_]], divByZero).
% base case: empty array
postfix([], [FinalCake|_], FinalCake).

% print result to out
printToOut(divByZero):-
    write('Div by Zero'),
    nl.
printToOut(Res):-
    Res \= divByZero,
    write(Res),
    nl.

% MAIN FUNCTION %
evaluate(Infile, Outfile):-
    % set up the file contents
    see(Infile), seeing(INSTREAM),
    tell(Outfile),

    % read it
    read_line_to_codes(INSTREAM, RawLineArray),
    reverse(RawLineArray, LineArray),
    LineArray \= end_of_file,

    % parse it
    postfix(LineArray, [], FinalResult),

    % print it,
    printToOut(FinalResult),


    % close files
    seen, told.
evaluate(Infile, _):-
    see(Infile), seeing(INSTREAM),
    read_line_to_codes(INSTREAM, LineArray),
    LineArray == end_of_file.
