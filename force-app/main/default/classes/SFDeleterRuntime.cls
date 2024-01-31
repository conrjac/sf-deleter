public inherited sharing class SFDeleterRuntime {

  static final Map<string, List<Retention_Rule__mdt>> RETENTIONRULES = new Map<string, List<Retention_Rule__mdt>>();

  static {
    // Grab all of the Autovalue settings, put into a Map<String, List<>> to provide easy access.
    List<Retention_Rule__mdt> avss = [
      SELECT
        Object__c,
       WHERE_Clause__c
      FROM Retention_Rule__mdt
      WITH USER_MODE
    ];

    for (Retention_Rule__mdt avs : avss) {
      // Populate the <Map,List<>>
      if (RETENTIONRULES.containsKey(avs.Object__c)) {
        RETENTIONRULES.get(avs.Object__c).add(avs);
      } else {
        RETENTIONRULES.put(
          avs.Object__c,
          new List<Retention_Rule__mdt>{ avs }
        );
      }
    }
  }







}