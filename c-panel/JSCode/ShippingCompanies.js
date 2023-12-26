var Messages = window.LINKINSOFT.DCM.Messages;
function CheckWeight(sender) {
    var MinWeight = parseFloat(document.getElementById("txtMinWeight").value);
    var MaxWeight = parseFloat(document.getElementById("txtMaxWeight").value);
    if (MaxWeight < MinWeight) {
        sender.value = "";
        Messages.Alert("lblResjs", "Max Weight should be greater than Min Weight");
    }
    else {
        document.getElementById("lblResjs").innerHTML = "";
        document.getElementById("lblResjs").style.display = "none";
    }
}