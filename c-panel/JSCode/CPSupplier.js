function UploadStarted(sender, args) {
    var fileName = args.get_fileName();
    var img = document.getElementById('imgLoader');
    img.style.display = 'block';
}
function UploadComplete(sender, args) {
    var fileLength = args.get_length();
    var fileType = args.get_contentType();
    var url = args.get_fileName();
    var img = document.getElementById('imgLoader');
    if (url.split(".").pop().toLowerCase() != "jpg" && url.split(".").pop().toLowerCase() != "png" && url.split(".").pop().toLowerCase() != "jpeg" && url.split(".").pop().toLowerCase() != "gif") {
        alert("File Type Error");
        img.style.display = 'none';

        return
    }
    document.getElementById('hlViewSupplierPhoto').href = 'SupplierLogo/' + args.get_fileName();
    document.getElementById('imgSupplier').src = 'SupplierLogo/' + args.get_fileName();
    document.getElementById('HiddenSupplierPhoto').value = '~/SupplierLogo/' + args.get_fileName();
    img.style.display = 'none';
    switch (true) {
        case (fileLength > 1000000):
            fileLength = fileLength / 1000000 + 'MB';
            break;
        case (fileLength < 1000000):
            fileLength = fileLength / 1000000 + 'KB';
            break;
        default:
            fileLength = '1 MB';
            break;
    }
}
function UploadError() {
}