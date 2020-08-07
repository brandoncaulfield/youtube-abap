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
      set_alv_functions,
      set_alv_columns,
      display_sflight_alv.

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

    set_alv_functions( ).

    set_alv_columns( ).

*   Display ALV
    lo_alv->display( ).

  ENDMETHOD.

  METHOD get_all_sflight_data.

    SELECT *
    FROM sflight
    INTO TABLE lt_sflight.

  ENDMETHOD.


  METHOD set_alv_functions.

    DATA(lo_alv_functions_list) = lo_alv->get_functions( ).
    lo_alv_functions_list->set_all( if_salv_c_bool_sap=>true ).
*    lo_alv_functions_list->set_sort_asc( if_salv_c_bool_sap=>false ).
*    lo_alv_functions_list->set_sort_desc( if_salv_c_bool_sap=>false ).

  ENDMETHOD.

  METHOD set_alv_columns.

    TRY.
        DATA(lo_columns) = lo_alv->get_columns( ).

* Hide the client (MANDT) column
        DATA(lo_column_mandt) = lo_columns->get_column( 'MANDT' ).
        lo_column_mandt->set_visible( if_salv_c_bool_sap=>false ).


* Rename Occupied Column to 'Seats Occupied'
        DATA(lo_column_seatsocc) = lo_columns->get_column( 'SEATSOCC' ).
        lo_column_seatsocc->set_short_text( 'Seats Occ.' ).
        lo_column_seatsocc->set_medium_text( 'Seats Occupied' ).
        lo_column_seatsocc->set_long_text( 'Seats Occupied' ).
      CATCH cx_salv_not_found INTO DATA(lx_msg). " ALV: General Error Class (Checked During Syntax Check)
        cl_demo_output=>display( lx_msg ).

    ENDTRY.

  ENDMETHOD.

ENDCLASS.


START-OF-SELECTION.

  DATA(lo_sflight_alv) = NEW lcl_sflight_alv( ).

* Get all data from SFLIGHT
  lo_sflight_alv->get_all_sflight_data( ).

* Display the sflight data above in an alv
  lo_sflight_alv->display_sflight_alv( ).