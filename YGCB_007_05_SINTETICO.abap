*&---------------------------------------------------------------------*
*& Include          YGCB_007_05_SINTETICO
*&---------------------------------------------------------------------*

CLASS lcl_voos_sintetica DEFINITION.

  PUBLIC SECTION.

    " Tipo de Exibição do ALV
    TYPES: BEGIN OF ty_alv,
            carrid TYPE s_carr_id,
            connid TYPE s_conn_id,
            paymentsum TYPE s_sum,
           END OF ty_alv.

    DATA: lt_voos TYPE TABLE OF sflight,
          lt_alv TYPE TABLE OF ty_alv.

    METHODS: get_voos,
             display_alv.

ENDCLASS.

CLASS lcl_voos_sintetica IMPLEMENTATION.

   METHOD get_voos.

*     " 1 - Resolver via Select
*     SELECT carrid, connid, SUM( paymentsum ) AS Paymentsum
*       FROM sflight
*       INTO TABLE @lt_alv
*       WHERE carrid EQ @p_carrid
*       AND connid   IN @s_connid
*       AND fldate   IN @s_fldate
*      GROUP BY carrid, connid.

     SELECT carrid connid paymentsum
       FROM sflight
       INTO CORRESPONDING FIELDS OF TABLE lt_voos
       WHERE carrid EQ p_carrid
       AND connid IN s_connid
       AND fldate IN s_fldate.

       LOOP AT lt_voos INTO DATA(ls_voos).
        DATA(ls_alv)  = CORRESPONDING ty_alv( ls_voos ).

        COLLECT ls_alv INTO lt_alv.
       ENDLOOP.

   ENDMETHOD.

   METHOD display_alv.

     cl_salv_table=>factory(
      IMPORTING
        r_salv_table = DATA(lo_alv)
      CHANGING
        t_table = lt_alv
     ).

     " Ativar a Toolbar do ALV
     DATA(lo_functions) = lo_alv->get_functions( ).
     lo_functions->set_all( ).

     lo_alv->display( ).
   ENDMETHOD.

ENDCLASS.