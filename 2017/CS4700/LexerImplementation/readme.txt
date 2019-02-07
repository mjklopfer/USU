Nathan Tipton
A01207112
Lexer Assignment


python 2.7.12

I have my lexer implementation mostly working.
-It checks each character and determines if it is a space,letter,digit, etc.
-It is not able to determine all combinations of multiple symbols. Can find some such as += or >=
-It does not find every type of literal. At this point only string, char, null, or boolean
-It determines if an ID or LIT is more than max characters
-It determines if integer lit is above max value
-Cannot recognize negative integers, recognizes - as a symbol not negative sign
-Finds if a ID has a digit as first character

