public with sharing class AccountsSelector {
    // public Map<Id, AccountInfo> wrapAccountMap  {get;set;}

    public List<Account> selectByIds(Set<Id> accountIds){
        return [
            SELECT Id
            FROM Account
            WHERE Id IN :accountIds
           
        ];
    }

    public Map<Id,AccountInfo> getAccountsInfo(Set<Id> ids){
        Map<Id, AccountInfo> wrapAccountMap = new Map<Id,AccountInfo>();

        for(AggregateResult result :[SELECT AccountId , COUNT(Id) contactsTotal,  MIN(Birthdate) oldestContact, MAX(Birthdate) youngestContact from Contact WHERE AccountId In :ids group by Accountid]){
            
                
                wrapAccountMap.put( (Id) result.get('AccountId'), new AccountInfo(result));
        }
        
    return wrapAccountMap;
    }

    public class AccountInfo {
        /*public AggregateResult result;	
        public Id accId {
            get { return (Id) result.get('accId');} }		
		public Integer contactsTotal { 
			get { return (Integer) result.get('contactsTotal'); } }	
		public Date oldestContact { 
			get { return (Date) result.get('oldestContact'); } }	
		public Date youngestContact { 
			get { return (Date) result.get('youngestContact'); } }	
		public AccountInfo(AggregateResult result) { 
			this.result = result; }*/

            	
            
            public Integer contactsTotal;
            public Date oldestContact ;
            public Date youngestContact;
            
            public AccountInfo(AggregateResult result){
                this.contactsTotal = (Integer) result.get('contactsTotal');
                this.oldestContact = (Date) result.get('oldestContact');
                this.youngestContact = (Date) result.get('youngestContact');
                
            }

        
    }
}
