@EndUserText.label: 'Maintain Error Code 583'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_ErrorCode583
  as projection on ZI_ErrorCode583
{
  key ErrorCode,
  LastChangedAt,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _ErrorCode583All : redirected to parent ZC_ErrorCode583_S,
  _ErrorCode583Text : redirected to composition child ZC_ErrorCode583Text,
  _ErrorCode583Text.Description : localized
  
}
