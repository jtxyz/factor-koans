USING: tools.test sequences kernel ;
IN: koans


! All about sequences
! a sequence is a collection of items enclosed in "{ }"

: demonstrate-sequences ( -- seq )
    { "zip" "zoom" "bim" } ;

{ { "zip" "zoom" "bim" } } [ demonstrate-sequences ] unit-test

! sequences can contain many types of objects
: seq-of-numbers ( -- seq )
    { 5 10 _!_ } ;

{ { 5 10 15 } } [ seq-of-numbers ] unit-test koan

! they can even contain sequences themselves !
: seq-of-seqs ( -- seq )
    { _!_ } ;

{ { { 1 } } } [ seq-of-seqs ] unit-test koan

! sequences need not contain all the same type of object
: seq-of-things ( -- seq )
    { "why i'd like" _!_ "hamburger, please" } ;

{ { "why i'd like" 1 "hamburger, please" } } [ seq-of-things ] unit-test koan

! you can ask the sequence for its length with the "length" word
{ _!_ } [ { "sequence of length one" } length ] unit-test koan

: types-of-bacon ( -- seq )
    { "raw" "floppy" "crispy" "burnt" "chunky" } ;

! you can ask for the item at a given index
{ _!_ } [ 0 types-of-bacon nth ] unit-test koan
{ _!_ } [ 1 types-of-bacon nth ] unit-test koan

! you can even ask for the first or last item
{ _!_ } [ types-of-bacon first ] unit-test koan
{ _!_ } [ types-of-bacon last ] unit-test koan
