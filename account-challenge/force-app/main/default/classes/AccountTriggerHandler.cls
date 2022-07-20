public with sharing class AccountTriggerHandler extends TriggerHandler {
    public AccountsService accountService = new AccountsService();

    private List<Account> newAccountList;


    public AccountTriggerHandler() {
        this.newAccountList = (List<Account>) Trigger.new;
    }

    public override void beforeInsert(){
    
        accountService.updateDescriptionBeforeInsertAccount(this.newAccountList);
        
    }
}
