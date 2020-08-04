*&---------------------------------------------------------------------*
*& Report z_sflight_alv
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_sflight_alv.

* Local class to
** Get all data from SFLIGHT
** Display in an ALV

CLASS lcl_sflight_alv DEFINITION.

  PUBLIC SECTION.

    METHODS:
      get_all_sflight_data,
      display_sflight_alv,
      new_method.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA: lo_alv     TYPE REF TO cl_salv_table,
          lt_sflight TYPE TABLE OF sflight.

ENDCLASS.

CLASS lcl_sflight_alv IMPLEMENTATION.

  METHOD display_sflight_alv.

    TRY.
        cl_salv_table=>factory(
      IMPORTING
        r_salv_table   = lo_alv                          " Basis Class Simple ALV Tables
          CHANGING
            t_table        = lt_sflight
        ).
      CATCH cx_salv_msg INTO DATA(lx_msg). " ALV: General Error Class with Message
        cl_demo_output=>display( lx_msg ).
    ENDTRY.

*   Display ALV
    lo_alv->display( ).

  ENDMETHOD.

  METHOD get_all_sflight_data.

    SELECT *
    FROM sflight
    INTO TABLE lt_sflight.

  ENDMETHOD.

ENDCLASS.


START-OF-SELECTION.

  DATA(lo_sflight_alv) = NEW lcl_sflight_alv( ).

* Get all data from SFLIGHT
  lo_sflight_alv->get_all_sflight_data( ).

* Display the sflight data above in an alv
  lo_sflight_alv->display_sflight_alv( ).