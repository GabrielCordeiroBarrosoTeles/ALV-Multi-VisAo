*&---------------------------------------------------------------------*
*& Include          YGCB_007_05_SRC
*&---------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
  PARAMETERS: p_carrid TYPE s_carr_id OBLIGATORY.
  SELECT-OPTIONS:
                  s_connid FOR sflight-connid,
                  s_fldate FOR sflight-fldate.
  SELECTION-SCREEN SKIP 1.
  PARAMETERS: rd_anli RADIOBUTTON GROUP rbg1,
              rd_sint RADIOBUTTON GROUP rbg1.
SELECTION-SCREEN END OF BLOCK b1.