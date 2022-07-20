public with sharing class MetadataTriggerHandler extends TriggerHandler {
    @testVisible
    private MetadataTriggerService mts;

    @testVisible
    private List<Metadata_Driven_Trigger__mdt> tryggers;

    @testVisible
    private TriggerHandler activeHandler;

    /**
     * @description Constructor used by live triggers.
     */
    public MetadataTriggerHandler() {
        this.mts = new MetadataTriggerService(
            MetadataTriggerService.getSobjectType()
        );
    }

    public MetadataTriggerHandler(MetadataTriggerService mts) {
        this.mts = mts;
    }

    /**
     * @description Overrides the standard Run() method, which allows this
     * metadata based trigger handler can be an incremental update / sit beside
     * other trigger handlers classes that are directly invoked by a trigger
     */
    @SuppressWarnings('PMD.ApexCRUDViolation')
    override public void run() {
        /**
         * This is standard validation checking for triggers / triggerhandlers
         */
        if (!validateRun()) {
            return;
        }

        addToLoopCount();

        /**
         * End standard validation
         */

        this.tryggers = this.mts.getMetadataTriggers();

        /**
         * @description This loop is responsible for instantiating the trigger
         * handler classes identified by the query above, and then calling the
         * proper context methods.
         */
        for (Metadata_Driven_Trigger__mdt trygger : tryggers) {
            try {
                activeHandler = (TriggerHandler) Type.forName(trygger.class__c)
                    .newInstance();
            } catch (Exception e) {
                continue;
            }

            switch on context {
                when BEFORE_INSERT {
                    activeHandler.beforeInsert();
                }
                when BEFORE_UPDATE {
                    activeHandler.beforeUpdate();
                }
                when AFTER_INSERT {
                    activeHandler.afterInsert();
                }
                when AFTER_UPDATE {
                    activeHandler.afterUpdate();
                }
                when BEFORE_DELETE {
                    activeHandler.beforeDelete();
                }
                when AFTER_DELETE {
                    activeHandler.afterDelete();
                }
                when AFTER_UNDELETE {
                    activeHandler.afterUndelete();
                }
            }
        }
    }
}