/*
Names: Sadie Sanders, April Gauthreaux
Emails: sas111@email.latech.edu, ajg044@email.latech.edu
Date: 02/13/2025
Course #: CSC 330 002
Quarter: Winter 2025
Project #: Project 2 - Prolog
*/

tree(operator(pl, tree(number, X), tree(number, Y))):-
    Res is X + Y,
    print(Res).

tree(operator(mi, tree(number, X), tree(number, Y))):-
    Res is X - Y,
    print(Res).

tree(operator(ti, tree(number, X), tree(number, Y))):-
    Res is X * Y,
    print(Res).

tree(operator(di, tree(number, X), tree(number, Y))):-
    Y \= 0,
    Res is X / Y,
    print(Res).
tree(operator(di, tree(number, X), tree(number, 0))):-
    print('Div by Zero').

% tree(number, Val).
% tree(operator(Op, Left, Right)).
% operator(Op, Left, Right).

% recursively reads each character in a file - sadie
readLines(CharCode, Res) :-
    CharCode \= -1,
    CharCode \= 10,
    get0(NewCharCode),
    readLines(NewCharCode, NewRes),
    char_code(Char, CharCode),
    atomic_concat(Char, NewRes, Res).
readLines(10, '').
readLines(-1, '').

% MAIN FUNCTION %
evaluate(Infile, Outfile):-
    % set up the file contents
    see(Infile), tell(Outfile),

    % read it
    get0(FirstChar),
    readLines(FirstChar, Line),
    atomic_concat(Line, '.', Command),
    % print(Command),

    % parse it


    % print it,


    % close files
    seen, told.