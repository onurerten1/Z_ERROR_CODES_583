@EndUserText.label: 'Maintain Error Code 583 Singleton'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_ErrorCode583_S
  provider contract transactional_query
  as projection on ZI_ErrorCode583_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _ErrorCode583 : redirected to composition child ZC_ErrorCode583
  
}
