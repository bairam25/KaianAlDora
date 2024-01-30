function WishList(sender,checked) {
    const ItemId = $(sender).data("itemId");
    WebService.WishList(ItemId,checked, function (res) {
        alert(res);
    });
}