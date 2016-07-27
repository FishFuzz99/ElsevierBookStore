/**
 * Created by tuffb on 7/27/16.
 */

registerValidation=function(){
if(document.getElementbyId(email1).value!=document.getElementbyId(email2).value){
    alert('Emails do not match');
    return false;
}
else
    return true;
}