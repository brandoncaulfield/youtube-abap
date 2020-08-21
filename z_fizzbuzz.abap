*&---------------------------------------------------------------------*
*& Report z_fizzbuzz
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_fizzbuzz.

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