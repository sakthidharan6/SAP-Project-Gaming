CLASS zcl_gaming_run DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.

CLASS zcl_gaming_run IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA(lo_game) = NEW zcl_gaming_tournament( ).

    lo_game->add_player( iv_id    = 1
                         iv_name  = 'ShadowNinja'
                         iv_score = 130 ).

    lo_game->add_player( iv_id    = 2
                         iv_name  = 'PixelWarrior'
                         iv_score = 90 ).

    lo_game->add_player( iv_id    = 3
                         iv_name  = 'DragonSlayer'
                         iv_score = 150 ).

    lo_game->add_player( iv_id    = 4
                         iv_name  = 'CyberKnight'
                         iv_score = 70 ).

    lo_game->display_leaderboard( out = out ).

  ENDMETHOD.

ENDCLASS.
