
*&---------------------------------------------------------------------*
*& Report z_cds_alv
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_test.

CLASS lcl_main DEFINITION CREATE PRIVATE.
  
    PUBLIC SECTION.
  
    CLASS-METHODS create
      RETURNING
        VALUE(ro_result) TYPE REF TO lcl_main.

    METHODS run.
  
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS lcl_main IMPLEMENTATION.
  
    METHOD create.
    ro_result = NEW lcl_main( ).
  ENDMETHOD.

  METHOD run.
    TRY.
        cl_salv_gui_table_ida=>create_for_cds_view( 'Z_INVOICE_ITEMS_001' )->fullscreen( )->display( ).
      CATCH cx_root INTO DATA(lx_msg). " IDA API contract violated by caller
        cl_demo_output=>display( lx_msg->get_longtext( ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  lcl_main=>create( )->run( ).