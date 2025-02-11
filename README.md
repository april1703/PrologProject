# PrologProject
Write a Prolog predicate named evaluate/2, whose first argument is the name of a input text file and the second argument is the name of an output text file. The input file will contain one or more Prolog terms on separate lines. Each term represents a binary tree structure, with each node of the tree either containing a number or an operator. The tree is structured as follows:

Number nodes: tree(number, Value) where Value is the number.
Operator nodes: tree(operator(Op, Left, Right)) where:
Op is the arithmetic operator (pl, mi, ti, di),
Left and Right are the left and right subtrees of the operator.
Here’s an example of what a tree representing the expression 3 + (5 * 2) would look like in the file:

tree(operator(pl, tree(number, 3), tree(operator(ti, tree(number, 5), tree(number, 2)))))

The tree structure will contain the following atoms to represent the traditional arithmetic symbols:

pl for addition (+)
mi for subtraction (-)
ti for multiplication (*)
di for division (/)

Your evaluate/2 predicate will recursively read the Prolog terms on each line, evaluate the expression represented each tree, and then write the results to the corresponding lines of the output file.
For example, suppose the input file is named expressions.txt and contains:

tree(operator(pl, tree(number, 3), tree(operator(ti, tree(number, 5), tree(number, 2)))))
tree(operator(mi, tree(number, 10), tree(operator(di, tree(number, 8), tree(number, 2)))))
tree(operator(ti, tree(number, 6), tree(operator(mi, tree(number, 4), tree(number, 3)))))
tree(operator(di, tree(number, 12), tree(number, 4)))
tree(operator(di, tree(number, 12), tree(number, 0)))

At the Prolog prompt, if we type:
?- evaluate('expressions.txt','results.txt').

Then the output file results.txt will contain:
13
14.0
18
3.0
Div by Zero

Note that you should handle division by zero by printing an error message in the result, ensuring that no runtime errors occur when the denominator is zero.

Specifications:

To parse the file, you are limited to the library predicates specified in Canvas. No other structure or library predicates are allowed without explicit permission.
The input file can be blank, in which case the output file should be blank as well.
To handle a division by zero error, your predicate should put the message "Div by Zero" to the corresponding line of the output file. There should be no errors/crashes nor exception raised at run time.
You may not allow any warnings from the interpreter.
Your project must be IDE independent. It should work properly when your code is loaded into the Prolog environment using the consult predicate in the terminal interface.
You must use the logical/recursive programming style where appropriate. Do not use loops, "global" variable bindings, or other procedural techniques (e.g., no if-then-else operators such as ->).
 

Evaluation:

To conquer the complexity of the project, it is recommended you start by coding to succeed on "simpler" cases and then adjust your code to handle more complex cases.
To assist in code readability, break up tasks by writing helper predicates when possible.
Comment your code briefly but thoroughly.
If you use ideas/code from other sources, cite them in the comments. Outside sources should be minimal… they shall not be used to replace large segments of code or to perform the tokenization for you.
You may work with one partner. If you do, include in the comments a brief statement on how the work was divided and/or who was responsible for which pieces of code.
You shall set an office appointment to do a presentation/demonstration/defense of your project after the submission deadline, which will be a part of your project grade.*
Penalties can be applied for being unable to explain parts of code, deviating from project specifications, insufficient source citing, compilation errors, being unprepared to demo, or for failing to complete the demo at the appointed times.
You shall be graded on clarity, efficiency, efficacy. Observe good coding practices.
