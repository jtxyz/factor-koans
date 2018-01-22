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
     ] "" make nip ;

: explain-failure ( test-failures -- )
    first
    [ my-error-location write nl nl ]
    [ error>> print-error ]
    bi ;

: number-of-passed-tests ( test-failures -- n )
    length total-tests get-global swap - ;

: ensure-progress-file-exists ( -- )
    ".progress" exists? [ "0" ".progress" utf8 set-file-contents ] unless ;

: previous-number-of-passed-tests ( -- n )
    ".progress" utf8 file-contents string>number ;

: save-number-of-passed-tests ( n -- )
    number>string ".progress" utf8 set-file-contents ;

: encourage ( test-failures -- )
    number-of-passed-tests {
        { [ dup 0 = ] [ "Good luck on your journey!" ] }
        { [ dup previous-number-of-passed-tests > ] [ "You are progressing!" ] }
        [ "Do not lose hope!" ]
    } cond write nl nl
    save-number-of-passed-tests ;

: illuminate-path ( test-failures -- )
    [ encourage ] [ explain-failure ] bi ;

: test-koans-examples ( -- )
    ensure-progress-file-exists
    total-tests [ 0 ] initialize

    [ "koans" test ] with-null-writer

    test-failures get dup empty?
    [ drop "You have achieved enlightenment." print ]
    [ illuminate-path ] if ;


MAIN: test-koans-examples
