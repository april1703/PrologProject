/*
Names: Sadie Sanders, April Gauthreaux
Emails: sas111@email.latech.edu, ajg044@email.latech.edu
Date: 02/13/2025
Course #: CSC 330 002
Quarter: Winter 2025
Project #: Project 2 - Prolog
*/

% reverse: reverse an array, go from pre- to post-fix
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