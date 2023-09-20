@EndUserText.label: 'Error Code 583'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_ErrorCode583
  as select from ZERRCODE_583
  association to parent ZI_ErrorCode583_S as _ErrorCode583All on $projection.SingletonID = _ErrorCode583All.SingletonID
  composition [0..*] of ZI_ErrorCode583Text as _ErrorCode583Text
{
  key ERROR_CODE as ErrorCode,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _ErrorCode583All,
  _ErrorCode583Text
  
}
