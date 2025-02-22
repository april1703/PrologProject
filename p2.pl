/*
Names: Sadie Sanders, April Gauthreaux
Emails: sas111@email.latech.edu, ajg044@email.latech.edu
Date: 02/13/2025
Course #: CSC 330 002
Quarter: Winter 2025
Project #: Project 2 - Prolog
*/

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


evalLineByLine([Input|Tail]):-
    Input \= '',
    % set the line up
    % parse the line
    postfix(NumberArray, [], FinalResult),
    % print the results
    print('result = '),
    print(FinalResult),
    nl.

evalLineByLine([]).

% MAIN FUNCTION %
evaluate(Infile):-
    % set up the file contents
    see(Infile), seeing(INSTREAM),

    % read it
    read_line_to_codes(INSTREAM, LineArray),
    print(Line),
    % print(Command),

    % parse it


    % print it,


    % close files
    seen, told.