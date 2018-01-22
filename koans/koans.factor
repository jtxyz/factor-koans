USING: tools.test prettyprint
     kernel namespaces sequences accessors combinators
     debugger source-files.errors.debugger
     make math math.parser splitting
     io io.streams.null io.files io.encodings.utf8 ;

USE: koans

IN: koans

SYMBOL: total-tests

: koan ( -- )
    total-tests [ 1 + ] change-global ;

: _!_ ( -- greeting )
    "Please replace _!_ with the solution" throw ;

: my-error-location ( error -- string )
     [
        "Your attention is directed to line " %
        dup line#>> #
        " of koans/tests/" %
        dup path>> "/" split last %
     ] "" make swap drop ;

: explain-failure ( test-failures -- )
    first
    [ my-error-location write nl nl ]
    [ error>> print-error ]
    bi ;

: encourage ( test-failures -- )
    length total-tests get-global swap - ! number of passed tests
    [
        ".progress" utf8 file-contents string>number {
            { [ [ dup 0 = ] dip swap ] [ "Good luck on your journey!" ] }
            { [ 2dup > ] [ "You are progressing!" ] }
            [ "Do not lose hope!" ]
        } cond write nl nl 2drop
    ]
    [ number>string ".progress" utf8 set-file-contents ]
    bi ;

: illuminate-path ( test-failures -- )
    [ encourage ] [ explain-failure ] bi ;

: ensure-progress-file-exists ( -- )
    ".progress" exists? [ "0" ".progress" utf8 set-file-contents ] unless ;

: test-koans-examples ( -- )
    ensure-progress-file-exists
    total-tests [ 0 ] initialize

    [ "koans" test ] with-null-writer

    test-failures get dup empty?
    [ drop "You have achieved enlightenment." print ]
    [ illuminate-path ] if ;


MAIN: test-koans-examples
