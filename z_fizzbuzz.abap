REPORT z_test.

CLASS lcl_fizzbuzz DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.

    CLASS-METHODS: create
      RETURNING
        VALUE(ro_fizzbuzz) TYPE REF TO lcl_fizzbuzz.

    METHODS: run.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_fizzbuzz IMPLEMENTATION.

  METHOD create.

    ro_fizzbuzz = NEW lcl_fizzbuzz( ).

  ENDMETHOD.

  METHOD run.

    DATA(lt_fizzbuzz) = VALUE stringtab(
        FOR i = 1 WHILE i <= 100 (
           COND string( LET lv_3 = i MOD 3
                            lv_5 = i MOD 5 IN
                        WHEN lv_3 = 0 AND lv_5 = 0 THEN |FIZZBUZZ|
                        WHEN lv_3 = 0              THEN |FIZZ|
                        WHEN lv_5 = 0              THEN |BUZZ|
                        ELSE i ) ) ).

    cl_demo_output=>display( lt_fizzbuzz ).

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  lcl_fizzbuzz=>create( )->run( ).



*DATA: tab TYPE TABLE OF string.
*
*tab = VALUE #(
*  FOR i = 1 WHILE i <= 100 (
*    COND string( LET r3 = i MOD 3
*                     r5 = i MOD 5 IN
*                 WHEN r3 = 0 AND r5 = 0 THEN |FIZZBUZZ|
*                 WHEN r3 = 0            THEN |FIZZ|
*                 WHEN r5 = 0            THEN |BUZZ|
*                 ELSE i ) ) ).
*
*cl_demo_output=>write( tab ).
*cl_demo_output=>display( ).

*cl_demo_output=>display( VALUE stringtab( FOR i = 1 WHILE i <= 100 ( COND #(  LET m3 = i MOD 3 m5 = i MOD 5 IN
*                                                                             WHEN m3 = 0 AND m5 = 0 THEN |FIZZBUZZ|
*                                                                             WHEN m3 = 0            THEN |FIZZ|
*                                                                             WHEN m5 = 0            THEN |BUZZ|
*                                                                             ELSE i ) ) ) ).


*DATA(lv_3) = 3.
*DATA(lv_5) = 5.
*DATA(lv_15) = 15.
*
*DATA(lv_count) = 5.
*DATA(lv_result) = ''.
*
*lv_result = lv_count MOD lv_3.
*
*WRITE lv_result.