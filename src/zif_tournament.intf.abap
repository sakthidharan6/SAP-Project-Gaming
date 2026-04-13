INTERFACE zif_tournament
  PUBLIC.

  TYPES:
    BEGIN OF ty_player,
      player_id TYPE i,
      username  TYPE string,
      score     TYPE i,
    END OF ty_player.

  METHODS:
    add_player
      IMPORTING
        iv_id    TYPE i
        iv_name  TYPE string
        iv_score TYPE i,
    display_leaderboard
      IMPORTING
        out TYPE REF TO if_oo_adt_classrun_out.

ENDINTERFACE.
