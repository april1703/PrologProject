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

mainfunction(Infile, Outfile)
    % read it

    % parse it

    % print it