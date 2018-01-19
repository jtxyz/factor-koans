USING: tools.test ;
IN: koans

! words are like functions
: fixed-greeting ( -- greeting )
    "Salutations!" ;

{ "Salutations!" } [ fixed-greeting ] unit-test

! the word name is followed by a stack effect declaration
! this is like a function signature, it specifies how
! the input and output. this one is missing its output declaration
: stack-effect-greeting ( -- greeting )
    "Salutations!" ;

{ "Salutations!" } [ stack-effect-greeting ] unit-test
