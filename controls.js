/* Anlegen eines Controls. Momentan sind ein Button und ein Textfeld zur Auswahl. */
function addButton(id,buttonName,callText)

{    
    //var placeholder = document.getElementById('controlAddIn');    
    var button = document.createElement('button');
    button.textContent = buttonName;
    button.id = id;
    button.className = "button";
    button.onclick = function() {    
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ButtonPressed',[callText]);    
    }    
    //placeholder.appendChild(button);
    document.getElementById('controlAddIn').appendChild(button);
    
}
    
function modifyStyle(id, stylename, value)
{
    document.getElementById(id).style[stylename] = value;
}

function Ping(name, timeout)
{
    if(name == null || name == ""){
        alert("Ping - name error(" + name.toString()  + ")");
        return;   
    }
    if(timeout == null || timeout == 0){
        alert("Ping - timeout error(" + timeout.toString()  + ")");
        return;
    }
    
    setTimeout(function(){ Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Pong',[name]); }, timeout);
}
