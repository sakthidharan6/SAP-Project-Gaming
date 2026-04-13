CLASS zcl_gaming_tournament DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES ZIF_TOURNAMENT.

    ALIASES add_player
      FOR zif_tournament~add_player.
    ALIASES display_leaderboard
      FOR zif_tournament~display_leaderboard.

  PRIVATE SECTION.
    DATA gt_players TYPE STANDARD TABLE OF zif_tournament=>ty_player.

ENDCLASS.

CLASS zcl_gaming_tournament IMPLEMENTATION.

  METHOD zif_tournament~add_player.
    DATA(ls_player) = VALUE zif_tournament=>ty_player(
      player_id = iv_id
      username  = iv_name
      score     = iv_score ).
    APPEND ls_player TO gt_players.
  ENDMETHOD.

  METHOD zif_tournament~display_leaderboard.
    SORT gt_players BY score DESCENDING.
    LOOP AT gt_players INTO DATA(ls_player).
      DATA(lv_rank) = sy-tabix.
      IF ls_player-score > 120.
        DATA(lv_level) = `Elite`.
      ELSEIF ls_player-score > 80.
        lv_level = `Pro`.
      ELSE.
        lv_level = `Beginner`.
      ENDIF.
      out->write( |Rank: { lv_rank } Player: { ls_player-username } Score: { ls_player-score } Level: { lv_level }| ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
