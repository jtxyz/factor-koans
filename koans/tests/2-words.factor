USING: tools.test ;
IN: koans

! "words" are like functions in other languages
: fixed-greeting ( -- greeting )
    "Salutations!" ;

! use the above word to make this test pass
{ "Salutations!" } [ _!_ ] unit-test

! words can return integers
: number-of-bananas ( -- number )
    _!_ ;

{ 11 } [ number-of-bananas ] unit-test

! words can return booleans too
: do-you-like-bananas ( -- ? )
    _!_ ;

{ t } [ do-you-like-bananas ] unit-test

! words can even return multiple items
: banana-colours ( -- color color color )
    _!_ ;

{ "yellow" "yellow" "brownish" } [ banana-colours ] unit-test

! the word name is followed by a "stack effect declaration".
! this is like a function signature, it specifies how the
! word interacts with the stack.

! the items on the left are a description of the input the word expects
! the items on the right are a description of the word's output
: stack-effect-greeting ( -- )
    "Salutations!" ;

! to get this test to pass you need to fill in the output declaration above
! hint: look at fixed-greeting for inspiration
{ "Salutations!" } [ stack-effect-greeting ] unit-test


! only the numbers are significant. you state how many words will be
! consumed and how many will be produced. the compiler checks the
! consistency of these definitions
! TODO: write another koan to drive this out