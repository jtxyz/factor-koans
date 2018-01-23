USING: tools.test kernel math combinators combinators.short-circuit.smart ;
IN: koans


! All about "if"
! you can check if a value is truthy by using "if"

: demonstrate-if-blocks ( -- string )
    t             ! first we place a value on the stack to use as the condition
    [ "bananas" ] ! this block will be invoked when the condition is truthy
    [ "oranges" ] ! this block will ONLY be called when the condition is "f"
    if ;          ! "if" will consume the previous three values off the stack

{ "bananas" } [ demonstrate-if-blocks ] unit-test

: would-you-like-some-fruit? ( bool -- string )
    [ "a lovely bunch of coconuts" ]
    [ "perhaps some spam ?"]
    if ;

! you can use the booleans 't' and 'f' as conditions to check for with if
{ "a lovely bunch of coconuts" } [ _!_ would-you-like-some-fruit? ] unit-test koan
{ "perhaps some spam ?" } [ _!_ would-you-like-some-fruit? ] unit-test koan

! integers can be used as conditions as well
{ _!_ } [ 5 would-you-like-some-fruit? ] unit-test koan

! so can strings
{ _!_ } [ "wow-very-dynamic" would-you-like-some-fruit? ] unit-test koan

! more complex expressions are useful as conditions as well
: is-math-broken? ( -- string )
    _!_ 10 <
    [ "math is cromulent" ]
    [ "math is broken "]
    if ;

{ "math is cromulent" } [ is-math-broken? ] unit-test koan

! All about "case"
! you can check against multiple values at once using the "case" word

: how-many-coconuts ( number -- string )
    {
      { 1 [ "a single solitary coconut" ] } ! this quotation is called when the input is exactly 1
      { 2 [ "two coconuts" ] }              ! this quotation is called when the input is exactly 2
      [ drop "a lovely bunch" ]             ! this quotation is called in all other cases
    }
    case ;

{ "a single solitary coconut" } [ _!_ how-many-coconuts ] unit-test koan

! All about "cond"
! you can check a value in more complicated ways using "cond"
: describe-nth-castle ( number -- string )
    {
      {
        [ dup 0 <= ] ! when the input is less than or equal to zero
        [ "When I first came here, this was all swamp." ]
      }
      {
        [ dup { [ 1 = ] [ 2 = ] } || ] ! if it equals 1 or 2
        [ "Sank into the swamp" ]
      }
      {
        [ dup 3 = ] ! only if it is equal to three
        [ "Burned, fell over, and then sank into the swamp" ]
      }
      {
        [ dup 4 = ] ! only if it is equal to four
        [ "The strongest castle in all of England" ]
      }
      ! the last quotation will be called in all other cases
      [ "... but I don't want land !" ]
    }
    cond
    nip ; ! take the initial input off the stack

{ "The strongest castle in all of England" } [ _!_ describe-nth-castle ] unit-test koan
