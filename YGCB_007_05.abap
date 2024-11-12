*&---------------------------------------------------------------------*
*& Report YGCB_007_05
*&---------------------------------------------------------------------*
*& ALV - Multi Visão
*&---------------------------------------------------------------------*
REPORT ygcb_007_05.

" Relatório multi visão
" OK - Colocar os Filtros na Tela de Seleção
" OK - 2 - Selecionar Dados do Banco
" OK - 2 - Montar os Dados
" OK - 2 - Exibição dos Dados

" Voos                        - SFLIGH
" Horarios dos Voos           - SPFLI
" Marcação de vôo individual  - SBOOK

" Analitica - Dados Globais
" Sintética - Resumos

TABLES: sflight.

INCLUDE: ygcb_007_05_src.

INCLUDE: ygcb_007_05_analitico.
INCLUDE: YGCB_007_05_sintetico.


INITIALIZATION.
  DATA(lo_voos_analitica) = NEW lcl_voos_analitica( ).
  DATA(lo_voos_sintetica) = NEW lcl_voos_sintetica( ).

START-OF-SELECTION.
  IF rd_anli = 'X'.
      lo_voos_analitica->get_voos( ).
  ELSE.
      lo_voos_sintetica->get_voos( ).
  ENDIF.


END-OF-SELECTION.
  IF rd_anli = 'X'.
      lo_voos_analitica->display_alv( ).
  ELSE.
      lo_voos_sintetica->display_alv( ).
  ENDIF.