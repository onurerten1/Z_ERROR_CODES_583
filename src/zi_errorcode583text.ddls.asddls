@EndUserText.label: 'Error Code 583 Text'
@AccessControl.authorizationCheck: #CHECK
@ObjectModel.dataCategory: #TEXT
define view entity ZI_ErrorCode583Text
  as select from ZERRCODET_583
  association [1..1] to ZI_ErrorCode583_S as _ErrorCode583All on $projection.SingletonID = _ErrorCode583All.SingletonID
  association to parent ZI_ErrorCode583 as _ErrorCode583 on $projection.ErrorCode = _ErrorCode583.ErrorCode
  association [0..*] to I_LanguageText as _LanguageText on $projection.Langu = _LanguageText.LanguageCode
{
  @Semantics.language: true
  key LANGU as Langu,
  key ERROR_CODE as ErrorCode,
  @Semantics.text: true
  DESCRIPTION as Description,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _ErrorCode583All,
  _ErrorCode583,
  _LanguageText
  
}
