@EndUserText.label: 'Maintain Error Code 583 Text'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_ErrorCode583Text
  as projection on ZI_ErrorCode583Text
{
  @ObjectModel.text.element: [ 'LanguageName' ]
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'I_Language', 
      element: 'Language'
    }
  } ]
  key Langu,
  key ErrorCode,
  Description,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _LanguageText.LanguageName : localized,
  _ErrorCode583 : redirected to parent ZC_ErrorCode583,
  _ErrorCode583All : redirected to ZC_ErrorCode583_S
  
}
