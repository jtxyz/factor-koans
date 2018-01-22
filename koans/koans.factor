USING: tools.test io io.streams.null prettyprint
     kernel namespaces sequences accessors combinators
     debugger source-files.errors.debugger
     make math.parser splitting ; ! for my-error-location

USE: koans

IN: koans

: _!_ ( -- greeting )
    "Please replace _!_ with the solution" throw ;

: my-error-location ( error -- string )
     [
        "Your attention is directed to line " %
        dup line#>> #
        " of koans/tests/" %
        dup path>> "/" split last %
     ] "" make swap drop ;

: explain-failure ( test-failure -- )
    {
        [ my-error-location write nl nl ]
        [ error>> print-error ]
    } cleave ;

: illuminate-path ( test-failures -- )
    first explain-failure ;

: test-koans-examples ( -- )
    [ "koans" test ] with-null-writer

    test-failures get dup empty?

    [ drop "You have achieved enlightenment." print ]
    [ illuminate-path ] if ;

MAIN: test-koans-examples
