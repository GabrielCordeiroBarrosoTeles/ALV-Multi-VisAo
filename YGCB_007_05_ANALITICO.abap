*&---------------------------------------------------------------------*
*& Include          YGCB_007_05_ANALITICO
*&---------------------------------------------------------------------*
CLASS lcl_voos_analitica DEFINITION.

  PUBLIC SECTION.
    DATA: lt_voos TYPE TABLE OF sflight.
    METHODS: get_voos,
             display_alv.

ENDCLASS.

CLASS lcl_voos_analitica IMPLEMENTATION.

   METHOD get_voos.

     SELECT *
       FROM sflight
       INTO TABLE lt_voos
       WHERE carrid EQ p_carrid
       AND connid IN s_connid
       AND fldate IN s_fldate.

   ENDMETHOD.

   METHOD display_alv.

     cl_salv_table=>factory(
      IMPORTING
        r_salv_table = DATA(lo_alv)
      CHANGING
        t_table = lt_voos
     ).

     " Ativar a Toolbar do ALV
     DATA(lo_functions) = lo_alv->get_functions( ).
     lo_functions->set_all( ).

     lo_alv->display( ).
   ENDMETHOD.

ENDCLASS.
