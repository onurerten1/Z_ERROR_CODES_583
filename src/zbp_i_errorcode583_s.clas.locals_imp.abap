CLASS lhc_rap_tdat_cts DEFINITION FINAL.
  PUBLIC SECTION.
    CLASS-METHODS get
      RETURNING VALUE(result) TYPE REF TO if_mbc_cp_rap_table_cts.

ENDCLASS.


CLASS lhc_rap_tdat_cts IMPLEMENTATION.
  METHOD get.
    result = mbc_cp_api=>rap_table_cts( table_entity_relations = VALUE #(
                                            ( entity = 'ErrorCode583' table = 'ZERRCODE_583' )
                                            ( entity = 'ErrorCode583Text' table = 'ZERRCODET_583' ) ) )
                                       ##NO_TEXT.
  ENDMETHOD.
ENDCLASS.


CLASS lhc_zi_errorcode583_s DEFINITION FINAL INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING
                        keys   REQUEST requested_features FOR ErrorCode583All
              RESULT    result.

    METHODS selectcustomizingtransptreq FOR MODIFY
      IMPORTING
                        keys   FOR ACTION ErrorCode583All~SelectCustomizingTransptReq
              RESULT    result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING
              REQUEST requested_authorizations FOR ErrorCode583All
              RESULT result.
ENDCLASS.


CLASS lhc_zi_errorcode583_s IMPLEMENTATION.
  METHOD get_instance_features.
    DATA selecttransport_flag TYPE abp_behv_flag VALUE if_abap_behv=>fc-o-enabled.
    DATA edit_flag            TYPE abp_behv_flag VALUE if_abap_behv=>fc-o-enabled.

    IF cl_bcfg_cd_reuse_api_factory=>get_cust_obj_service_instance(
           iv_objectname = 'ZERRCODE_583'
           iv_objecttype = cl_bcfg_cd_reuse_api_factory=>simple_table )->is_editable( ) = abap_false.
      edit_flag = if_abap_behv=>fc-o-disabled.
    ENDIF.
    DATA(transport_service) = cl_bcfg_cd_reuse_api_factory=>get_transport_service_instance(
                                  iv_objectname = 'ZERRCODE_583'
                                  iv_objecttype = cl_bcfg_cd_reuse_api_factory=>simple_table ).
    IF transport_service->is_transport_allowed( ) = abap_false.
      selecttransport_flag = if_abap_behv=>fc-o-disabled.
    ENDIF.
    READ ENTITIES OF ZI_ErrorCode583_S IN LOCAL MODE
         ENTITY ErrorCode583All
         ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT DATA(all).
    IF all[ 1 ]-%is_draft = if_abap_behv=>mk-off.
      selecttransport_flag = if_abap_behv=>fc-o-disabled.
    ENDIF.
    result = VALUE #( ( %tky                                = all[ 1 ]-%tky
                        %action-edit                        = edit_flag
                        %assoc-_ErrorCode583                = edit_flag
                        %action-SelectCustomizingTransptReq = selecttransport_flag ) ).
  ENDMETHOD.

  METHOD selectcustomizingtransptreq.
    MODIFY ENTITIES OF ZI_ErrorCode583_S IN LOCAL MODE
           ENTITY ErrorCode583All
           UPDATE FIELDS ( TransportRequestID HideTransport )
           WITH VALUE #( FOR key IN keys
                         ( %tky               = key-%tky
                           TransportRequestID = key-%param-transportrequestid
                           HideTransport      = abap_false ) ).

    READ ENTITIES OF ZI_ErrorCode583_S IN LOCAL MODE
         ENTITY ErrorCode583All
         ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT DATA(entities).
    result = VALUE #( FOR entity IN entities
                      ( %tky   = entity-%tky
                        %param = entity ) ).
  ENDMETHOD.

  METHOD get_global_authorizations.
*    AUTHORITY-CHECK OBJECT 'S_TABU_NAM' ID 'TABLE' FIELD 'ZI_ERRORCODE583' ID 'ACTVT' FIELD '02'.
*    DATA(is_authorized) = COND #( WHEN sy-subrc = 0 THEN if_abap_behv=>auth-allowed
*                                  ELSE if_abap_behv=>auth-unauthorized ).
*    result-%UPDATE      = is_authorized.
*    result-%ACTION-Edit = is_authorized.
*    result-%ACTION-SelectCustomizingTransptReq = is_authorized.
  ENDMETHOD.
ENDCLASS.


CLASS lsc_zi_errorcode583_s DEFINITION FINAL INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.
    METHODS save_modified    REDEFINITION.
    METHODS cleanup_finalize REDEFINITION.
ENDCLASS.


CLASS lsc_zi_errorcode583_s IMPLEMENTATION.
  METHOD save_modified.
*    READ TABLE update-ErrorCode583All INDEX 1 INTO DATA(all).
*    IF all-TransportRequestID IS NOT INITIAL.
*      lhc_rap_tdat_cts=>get( )->record_changes(
*                                  transport_request = all-TransportRequestID
*                                  create            = REF #( create )
*                                  update            = REF #( update )
*                                  delete            = REF #( delete ) ).
*    ENDIF.
  ENDMETHOD.

  METHOD cleanup_finalize ##NEEDED.
  ENDMETHOD.
ENDCLASS.


CLASS lhc_zi_errorcode583 DEFINITION FINAL INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS validatetransportrequest FOR VALIDATE ON SAVE
      IMPORTING
                keys FOR ErrorCode583~ValidateTransportRequest.

    METHODS get_global_features FOR GLOBAL FEATURES
      IMPORTING
              REQUEST requested_features FOR ErrorCode583
              RESULT result.
ENDCLASS.


CLASS lhc_zi_errorcode583 IMPLEMENTATION.
  METHOD validatetransportrequest.
*    DATA change TYPE REQUEST FOR CHANGE ZI_ErrorCode583_S.
*    SELECT SINGLE TransportRequestID
*      FROM ZERRCODE_583_D_S
*      WHERE SingletonID = 1
*      INTO @DATA(TransportRequestID).
*    lhc_rap_tdat_cts=>get( )->validate_changes(
*                                transport_request = TransportRequestID
*                                table             = 'ZERRCODE_583'
*                                keys              = REF #( keys )
*                                reported          = REF #( reported )
*                                failed            = REF #( failed )
*                                change            = REF #( change-ErrorCode583 ) ).
  ENDMETHOD.

  METHOD get_global_features.
    DATA edit_flag TYPE abp_behv_flag VALUE if_abap_behv=>fc-o-enabled.

    IF cl_bcfg_cd_reuse_api_factory=>get_cust_obj_service_instance(
           iv_objectname = 'ZERRCODE_583'
           iv_objecttype = cl_bcfg_cd_reuse_api_factory=>simple_table )->is_editable( ) = abap_false.
      edit_flag = if_abap_behv=>fc-o-disabled.
    ENDIF.
    result-%update = edit_flag.
    result-%delete = edit_flag.
    result-%assoc-_ErrorCode583Text = edit_flag.
  ENDMETHOD.
ENDCLASS.


CLASS lhc_zi_errorcode583text DEFINITION FINAL INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS validatetransportrequest FOR VALIDATE ON SAVE
      IMPORTING
                keys FOR ErrorCode583Text~ValidateTransportRequest.

    METHODS get_global_features FOR GLOBAL FEATURES
      IMPORTING
              REQUEST requested_features FOR ErrorCode583Text
              RESULT result.
ENDCLASS.


CLASS lhc_zi_errorcode583text IMPLEMENTATION.
  METHOD validatetransportrequest.
*    DATA change TYPE REQUEST FOR CHANGE ZI_ErrorCode583_S.
*    SELECT SINGLE TransportRequestID
*      FROM zerrcode_583_d_s
*      WHERE SingletonID = 1
*      INTO @DATA(TransportRequestID).
*    lhc_rap_tdat_cts=>get( )->validate_changes(
*                                transport_request = TransportRequestID
*                                table             = 'ZERRCODET_583'
*                                keys              = REF #( keys )
*                                reported          = REF #( reported )
*                                failed            = REF #( failed )
*                                change            = REF #( change-ErrorCode583Text ) ).
  ENDMETHOD.

  METHOD get_global_features.
    DATA edit_flag TYPE abp_behv_flag VALUE if_abap_behv=>fc-o-enabled.

    IF cl_bcfg_cd_reuse_api_factory=>get_cust_obj_service_instance(
           iv_objectname = 'ZERRCODET_583'
           iv_objecttype = cl_bcfg_cd_reuse_api_factory=>simple_table )->is_editable( ) = abap_false.
      edit_flag = if_abap_behv=>fc-o-disabled.
    ENDIF.
    result-%update = edit_flag.
    result-%delete = edit_flag.
  ENDMETHOD.
ENDCLASS.
