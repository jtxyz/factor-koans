USING: tools.test math ;
IN: koans

! welcome to the factor koans!

! factor has a built in testing framework
! we'll be using it to explore the language

! here's how the tests work:

{ 2 }      ! you provide an expected result
[ 1 1 + ]  ! and some code to execute
unit-test  ! and then assert that they're equal

! they're typically written on one line
{ "Hello" } [ "Hello" ] unit-test

! fix the one above and then let's move on
