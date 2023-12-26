window.LINKINSOFT = window.LINKINSOFT || {};
window.LINKINSOFT.DCM = window.LINKINSOFT.DCM || {};
window.LINKINSOFT.DCM.Messages = window.LINKINSOFT.DCM.Messages || {};
window.LINKINSOFT.DCM.Messages = {
    Success: function (divID, msg) {
        if ($('#' + divID).length) {
            //$('#' + divID).clone();
            $('#' + divID).html('');
            var msgDiv = '<div class="alert alert-success"><strong>' + msg + ' </strong> </div>';
            $('#' + divID).html(msgDiv);
            $('#' + divID).show();
        }
    },
   
    Info: function (divID, msg) {
        if ($('#' + divID).length) {
            $('#' + divID).html('');
            var msgDiv = '<div class="alert alert-info"><strong>' + msg + ' </strong> </div>';
            $('#' + divID).html(msgDiv);
            $('#' + divID).show();

        }
    },
    Alert: function (divID, msg) {
        if ($('#' + divID).length) {
            $('#' + divID).html('');
            var msgDiv = '<div class="alert alert-warning"><strong>' + msg + ' </strong> </div>';
            $('#' + divID).html(msgDiv);
            $('#' + divID).show();

        }
    },
    Error: function (divID, msg) {
        if ($('#' + divID).length) {
            $('#' + divID).html('');
            var msgDiv = '<div class="alert alert-danger"><strong>' + msg + ' </strong> </div>';
            $('#' + divID).html(msgDiv);
            $('#' + divID).show();
         

        }
    }
}