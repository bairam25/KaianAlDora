function WishList(sender) {
    const ItemId = $(sender).parent().data('itemid');
 
    const isChecked = $(sender).is(":checked") || false;
    const senderId = sender.id;
     WebService.WishList(ItemId, isChecked, function (res) {
        const result = res[0] === 'True';
        const count = res[1];
        document.getElementById("lblFavCount").innerText = count;
        document.getElementById("lblFavCount").style.display = 'block';
        if (count == 0) {
             document.getElementById('lblFavCount').style.display = 'none';
        }
        if (!result) {
            document.location.href = "../Login.aspx";
        } else {
           
            switch (senderId) {
                case "btnDeleteFav":
                    document.getElementById("btnFillWishList").click();
                default:
            }
        }
 
    });
}