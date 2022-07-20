trigger ContactTrigger on Contact (after insert,after update,after delete) {
    new MetadataTriggerHandler().run();
}