CLASS lcl_reduce_test DEFINITION CREATE PRIVATE FINAL.

PUBLIC SECTION.

    CLASS-METHODS: create
        RETURNING
            VALUE(ro_obj) TYPE REF TO lcl_reduce_test.

    METHODS: run.

PROTECTED SECTION.
PRIVATE SECTION.

ENDCLASS.

CLASS lcl_reduce_test IMPLEMENTATION.

    METHOD create.
        ro_obj = NEW lcl_reduce_test( ).
    ENDMETHOD.

    METHOD run.
        DATA lt_test TYPE TABLE OF i WITH EMPTY KEY.
    lt_test = VALUE #( FOR j = 1 WHILE j <= 10 ( j ) ).

    cl_demo_output=>new(
    )->next_section( |Simple Sum| )->write(
      REDUCE i( INIT s = 0
                FOR i = 1 UNTIL i > 10
                NEXT s = s + i )
    )->next_section( |String concatenation| )->write(
      REDUCE string( INIT text = |Count down:|
                     FOR i = 10 THEN i - 1 UNTIL i = 0
                     NEXT text = text && | { i }| )
    )->next_section( |Table Example| )->write(
      lt_test
    )->next_section( |Table Reduction using REDUCE| )->write(
      REDUCE i( INIT x = 0
                FOR ls_test IN lt_test
                NEXT x = x + ls_test )
    )->display( ).
    ENDMETHOD.

ENDCLASS.


