trigger AccountTrigger on Account (before insert) {
    new MetadataTriggerHandler().run();
}