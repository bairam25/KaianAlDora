#Region "Signature"

'################################### Signature ######################################
'############# Date:21-03-2019
'############# Form Name: Items
'############# Your Name: Mohamed Khaiallah
'################################ End of Signature ##################################

#End Region

#Region "Import"
Imports System.Data
Imports BusinessLayer.BusinessLayer
Imports System.Data.SqlClient
Imports clsMessages
#End Region

Partial Class Items
    Inherits System.Web.UI.Page

#Region "Global Variables"
    Dim pf As New PublicFunctions
    Dim ItemsImgs As New List(Of TblItemsPhotos)
    Dim daItemsImgs As New TblItemsPhotosFactory
    Dim UserId As String = "0"
    Dim Client_Id As String = "1001"
    Dim _sqlconn As New SqlConnection(DBContext.GetConnectionString)
    Dim _sqltrans As SqlTransaction
    Dim ItemSKUCode As String
    Dim ItemCode As String
    Dim ItemName As String
    Dim listedByID As String
    Dim listedByName As String
    Dim listedByMobile As String
    Dim ItemBarCode As String
    Dim ItemBrand As String
    Dim ItemBrandName As String
    Dim ItemModel As String
    Dim ItemModelName As String
    Dim ItemActive As Boolean
    Dim ItemDesc As String
    Dim ItemCategory As String
    Dim ItemCategoryName As String
    Dim ItemSubCategory As String
    Dim ItemSubCategoryName As String
    Dim ItemColor As String
    Dim ItemColorName As String
    Dim ItemSize As String
    Dim ItemSizeName As String
    Dim ItemReturnable As Boolean
    Dim ItemHot As Boolean
    Dim ItemQuantity As Integer
    Dim ItemRating As Double
    Dim ItemYouTubeURL As String
    Dim ItemSourceURL As String
    Dim ItemKeywords As String
    Dim ItemShippingCompany As String
    Dim ItemWeight As Double
    Dim ItemCost As Double
    Dim ItemCRMargin As Double
    Dim ItemCODMargin As Double
    Dim ItemCRPrice As Double
    Dim ItemCODPrice As Double
    Dim ItemVatPercent As Double
    Dim ItemVatAmount As Double
    Dim ItemBrochure As String
    Dim ItemCollection As String
    Dim ItemMaterial As String
    Dim ItemStyle As String
    Dim ItemCondition As String
    Dim ItemCity As String
    Dim ItemCityId As String
    Dim ItemArea As String
    Dim ItemAreaId As String
    Dim Itemlng As String
    Dim Itemlat As String
    Dim ItemType As String
    Dim IsService As Boolean
#End Region

#Region "Public_Functions"

    ''' <summary>
    ''' If b is true : hide gridview, Operation panel bar and show panel form, Confirmation panel bar.
    ''' If b is false : hide panel form, Confirmation panel bar and show gridview, Operation panel bar.
    ''' </summary>
    Protected Sub Enabler(ByVal b As Boolean)
        Try
            pnlConfirm.Visible = b
            pnlOps.Visible = Not b
            pnlForm.Enabled = b

            pnlForm.Visible = b
            Dim Display As String = "block"
            If Not b Then
                Display = "none"
            End If
            ScriptManager.RegisterClientScriptBlock(up, Me.[GetType](), "newfile", "document.getElementById('pnlPhotos').style.display='" + Display + "';", True)
            pnlGV.Visible = Not b
            cmdSave.Visible = b
            pnlForm.Enabled = b
            pnlPhotos.Enabled = b
            liSave.Visible = b

        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

    ''' <summary>
    ''' Update item to be activated or not.
    ''' </summary>
    Sub UpdateActive(sender As Object, e As EventArgs)
        Try
            Dim parent = sender.parent
            Dim ItemId As String = DirectCast(parent.FindControl("lblItemId"), Label).Text
            Dim StatusName As String = "Active"
            Dim chk As CheckBox = DirectCast(sender, CheckBox)

            Dim Updated As Integer = 0
            If chk.Checked Then
                Updated = DBContext.ExcuteQuery("Update tblItems set Active ='" + chk.Checked.ToString + "',ModifiedDate=getdate(),ModifiedBy='" + UserId + "' where Id='" + ItemId + "' ")
                StatusName = "Active"
            Else
                Updated = DBContext.ExcuteQuery("Update tblItems set Active ='" + chk.Checked.ToString + "',Hot='False',ModifiedDate=getdate(),ModifiedBy='" + UserId + "' where Id='" + ItemId + "' ")
                StatusName = "Deactive"
                ' Dim chkHot As CheckBox = DirectCast(parent.FindControl("chkHot"), CheckBox)
                ' chkHot.Checked = False
            End If

            If Updated = 1 Then

                clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.CUSTOMSuccess, Page, Nothing, "Active Status Updated Successfully")
            End If
            'clsGlobalApplication.UpdateApplicationItems()
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

    ''' <summary>
    ''' Update item to be hot.
    ''' </summary>
    Sub UpdateHot(sender As Object, e As EventArgs)
        Try
            Dim parent = sender.parent
            Dim ItemId As String = DirectCast(parent.FindControl("lblItemId"), Label).Text
            Dim chk As CheckBox = DirectCast(sender, CheckBox)

            Dim Updated As Integer = DBContext.ExcuteQuery("Update tblItems set Hot ='" + chk.Checked.ToString + "',ModifiedDate=getdate(),ModifiedBy='" + UserId + "' where Id='" + ItemId + "' ")
            If Updated = 1 Then
                clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.CUSTOMSuccess, Page, Nothing, "Hot Status Updated Successfully")
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

    ''' <summary>
    ''' Set Default controls Values 
    ''' </summary>
    Sub SetControlFields()
        Try
            ItemSKUCode = txtSKUCode.Text
            ItemCode = txtItemCode.Text
            ItemName = txtItemName.Text
            listedByID = CustomerId.Value
            listedByName = txtCustomer.Text.Trim
            listedByMobile = txtCustomerMobile.Text.Trim
            ItemBarCode = txtSKUCode.Text
            ItemBrand = BrandId.Value
            ItemBrandName = txtBrand.Text.Trim
            ItemModel = ModelId.Value
            ItemModelName = txtModel.Text.Trim
            ItemType = rblItemType.SelectedValue
            IsService = PublicFunctions.BoolFormat(rblIsService.SelectedValue)
            ItemActive = PublicFunctions.BoolFormat(rblActive.SelectedValue)
            ItemDesc = txtDescription.TextValue
            ItemCategory = ddlCategory.SelectedValue
            ItemCategoryName = ddlCategory.SelectedItem.Text
            ItemSubCategory = ddlSubCategory.SelectedValue
            ItemSubCategoryName = ddlSubCategory.SelectedItem.Text
            ItemColor = ddlColors.SelectedValue
            ItemColorName = ddlColors.SelectedItem.Text
            ItemSize = ddlSize.SelectedValue
            ItemSizeName = ddlSize.SelectedItem.Text
            ItemReturnable = PublicFunctions.BoolFormat(rblReturnable.SelectedValue)
            ItemHot = PublicFunctions.BoolFormat(rblHot.SelectedValue)
            ItemQuantity = PublicFunctions.DecimalFormat(txtQuantity.Text)
            ItemRating = PublicFunctions.DecimalFormat(txtRating.Text)
            ItemYouTubeURL = txtYoutubeURL.Text
            ItemSourceURL = txtSourceURL.Text
            ItemKeywords = txtKeywords.Text
            ItemShippingCompany = ddlShippingCompany.SelectedValue
            ItemWeight = PublicFunctions.DecimalFormat(txtWeight.Text)
            ItemCost = PublicFunctions.DecimalFormat(txtSupplierPrice.Text)
            ItemCRMargin = PublicFunctions.DecimalFormat(txtCRMargin.Text)
            ItemCODMargin = PublicFunctions.DecimalFormat(txtCODMargin.Text)
            ItemCRPrice = PublicFunctions.DecimalFormat(txtPrice.Text)
            ItemCODPrice = PublicFunctions.DecimalFormat(txtCODPrice.Text)
            ItemVatPercent = PublicFunctions.DecimalFormat(txtVATPercent.Text)
            ItemVatAmount = PublicFunctions.DecimalFormat(txtVAT.Text)
            ItemBrochure = HiddenBrochure.Text
            ItemCollection = ddlCollection.SelectedValue
            ItemMaterial = ddlMaterial.SelectedValue
            ItemStyle = ddlStyle.SelectedValue
            ItemCondition = ddlCondition.SelectedValue
            ItemCity = txtCity.Text.Trim
            ItemCityId = CityId.Value
            ItemArea = txtArea.Text.Trim
            ItemAreaId = AreaId.Value
            Itemlng = txtLongitude.Text
            Itemlat = txtLatitude.Text
            If Itemlng = String.Empty And Itemlat = String.Empty And ItemCity = String.Empty And ItemArea = String.Empty Then
                ScriptManager.RegisterStartupScript(up, GetType(Page), "SetCurrentPosition", "SetCurrentPos();", True)
            End If
            FillBrochureImage()
            CheckCollapse()
            SelectType()
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

    Sub SelectCustomer()
        Try
            If txtCustomer.Text <> String.Empty Then
                Dim FullName As String = txtCustomer.Text.Trim
                Dim Mobile As String = txtCustomer.Text.Trim
                If txtCustomer.Text.Contains("|") Then
                    FullName = txtCustomer.Text.Split("|")(0)
                    Mobile = txtCustomer.Text.Split("|")(1)

                End If
                FillCustomerDetails("( mobile='" + Mobile + "')")
                'FillCustomerDetails("(Fullname='" + FullName + "' or mobile='" + Mobile + "')")
            End If


        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    Sub SelectMobile()
        Try
            If txtCustomerMobile.Text <> String.Empty Then
                Dim Mobile As String = txtCustomerMobile.Text.Trim
                If FillCustomerDetails(" mobile='" + Mobile + "' ", True) Then
                    clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.CUSTOMInfo, Page, Nothing, "Customer Mobile already exist")
                End If
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    Function FillCustomerDetails(Filter As String, Optional Mobile As Boolean = False) As Boolean
        Try
            Dim dtCustomer As DataTable = DBContext.Getdatatable("select Id,FullName,Mobile from tblusers where clientId='" + Client_Id + "' and isnull(IsDeleted,0)=0 and " + Filter + "")
            If dtCustomer.Rows.Count > 0 Then
                CustomerId.Value = dtCustomer.Rows(0).Item("Id").ToString
                txtCustomer.Text = dtCustomer.Rows(0).Item("FullName").ToString
                txtCustomerMobile.Text = dtCustomer.Rows(0).Item("Mobile").ToString
                txtCustomerMobile.Enabled = False
            Else
                'clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.CUSTOMInfo, Page, Nothing, "Select Valid Customer")
                'hfCustomer.Visible = True
                CustomerId.Value = String.Empty
                txtCustomerMobile.Enabled = True
                'txtCustomer.Text = String.Empty
                If Not Mobile Then
                    txtCustomerMobile.Text = String.Empty
                    txtCustomerMobile.Focus()
                End If

                Return False
            End If
            Return True
        Catch ex As Exception
            Return False
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Function


    Sub SelectCity()
        Try
            If txtCity.Text <> String.Empty Then
                ItemCityId = PublicFunctions.GetLockupId(ItemCity, "City")
                If ItemCityId <> String.Empty Then
                    CityId.Value = ItemCityId
                    aceArea.ContextKey = ItemCityId
                    txtLongitude.Text = String.Empty
                    txtLatitude.Text = String.Empty
                    If Not IsCityArea() Then
                        txtArea.Text = String.Empty
                    End If

                    ScriptManager.RegisterStartupScript(up, GetType(Page), "setCity", "SetCustomLatLng('" + ItemCity + "')", True)
                Else
                    txtCity.Text = String.Empty
                    CityId.Value = String.Empty
                    aceArea.ContextKey = String.Empty
                    clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.CUSTOMInfo, Page, Nothing, "Select Valid City")
                End If
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    Sub SelectArea()
        Try
            If txtArea.Text <> String.Empty Then
                ItemAreaId = PublicFunctions.GetLockupId(ItemArea, "Area")
                If ItemAreaId <> String.Empty Then
                    AreaId.Value = ItemAreaId
                    txtLongitude.Text = String.Empty
                    txtLatitude.Text = String.Empty
                    ScriptManager.RegisterStartupScript(up, GetType(Page), "setArea", "SetCustomLatLng('" + ItemCity + " - " + ItemArea + "')", True)
                Else
                    txtArea.Text = String.Empty
                    AreaId.Value = String.Empty
                    clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.CUSTOMInfo, Page, Nothing, "Select Valid Area")
                End If
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    Private Function IsCityArea() As Boolean
        Try
            Dim dtArea As DataTable = DBContext.Getdatatable("select Id  from tblLookupValue where lookupId=(select top 1 ID from tbllookup where TYPE='Area') and RelatedValueId='" + ItemCityId + "' and Id='" + ItemAreaId + "' and (ISNULL(IsDeleted, 0) = 0) and ClientId='" + Client_Id + "' order by value ASC")
            If dtArea.Rows.Count > 0 Then
                Return True
            End If
            Return False
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
            Return False
        End Try
    End Function
#End Region

#Region "Page Load"
    ''' <summary>
    ''' Handle page_load event
    ''' </summary>
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblRes.Visible = False
        hfCustomer.Visible = False
        UserId = PublicFunctions.GetUserId(Page)
        Client_Id = PublicFunctions.Client_Id
        Try
            If Not Page.IsPostBack Then

                BindDDLs()
                FillGrid(sender, e)
                If PublicFunctions.GetUserType(UserId).ToLower = "admin" Then
                    pnlReported.Visible = True
                Else
                    pnlReported.Visible = False
                End If
            Else
                If pnlForm.Visible Then
                    ScriptManager.RegisterClientScriptBlock(up, Me.[GetType](), "MyAction", "document.getElementById('pnlPhotos').style.display='Block';", True)
                Else
                    ScriptManager.RegisterClientScriptBlock(up, Me.[GetType](), "MyAction", "document.getElementById('pnlPhotos').style.display='None';", True)
                End If
            End If
            SetControlFields()
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    ''' <summary>
    ''' Bind Drop down lists
    ''' </summary>
    Sub BindDDLs()
        Try
            clsBindDDL.BindCustomDDLs("select distinct countryId,Country from vw_CPItems where country <> ''", "Country", "CountryId", ddlCountry, True)
            'clsBindDDL.BindCustomDDLs("select Id,Brand from vw_Brands where clientID='" + Client_Id + "'", "Brand", "Id", ddlBrand, True)
            clsBindDDL.BindLookupDDLs("Item Category", ddlCategory, True)
            clsBindDDL.BindLookupDDLs("Item Color", ddlColors, True)
            clsBindDDL.BindLookupDDLs("Item Size", ddlSize, True)
            clsBindDDL.BindLookupDDLs("Collection", ddlCollection, True)
            clsBindDDL.BindLookupDDLs("Material", ddlMaterial, True)
            clsBindDDL.BindLookupDDLs("Style", ddlStyle, True)
            clsBindDDL.BindLookupDDLs("Condition", ddlCondition, True)
            clsBindDDL.BindCustomDDLs("select Id,CompanyName from tblShippingCompanies where  (ISNULL(IsDeleted, 0) = 0) and clientId='" + Client_Id + "' ", "CompanyName", "ID", ddlShippingCompany, True)
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
#End Region

#Region "Fill Grid"

    ''' <summary>
    ''' Fill gridview with data from tblItems.
    ''' </summary>
    Sub FillGrid(sender As Object, e As EventArgs)
        Try
            Dim dtItems As DataTable = DBContext.Getdatatable("select " & ddlRows.SelectedValue & " * from vw_CPItems where clientId='" & Client_Id & "' and " & CollectConditions(sender, e) & " order by CreatedDate DESC")
            If dtItems.Rows.Count > 0 Then

                pgPanel.Visible = True
                ' Initialize the sorting expression.
                If SortExpression.Value = String.Empty Then
                    SortExpression.Value = "CreatedDate DESC"
                End If
                ' Populate the GridView.
                Dim dv As New DataView(dtItems)

                ' Set the sort column and sort order.
                dv.Sort = SortExpression.Value.ToString()

                ' Bind the GridView control.
                lvItems.DataSource = dv
                lvItems.DataBind()
                If dtItems.Rows.Count > 0 Then
                    dpLvItems.Visible = True
                    dpLvItems.DataBind()
                End If
                lblSelectedItemsCount.Text = dtItems.Rows.Count.ToString
                If Val(lblSelectedItemsCount.Text) >= 10 Then
                    pnlRows.Visible = True
                Else
                    pnlRows.Visible = False
                End If
            Else
                pgPanel.Visible = False
                lvItems.DataSource = New DataTable
                lvItems.DataBind()
                lblSelectedItemsCount.Text = "0"
                dpLvItems.Visible = False
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    ''' <summary>
    ''' Collect condition string to fill gvItems
    ''' </summary>
    Public Function CollectConditions(sender As Object, e As EventArgs) As String
        Dim Search As String = " 1=1"
        txtSearch.Text = txtSearch.Text.Trim
        Try
            If txtSearch.Text <> String.Empty Then
                If sender.id = "cmdSearch" Then
                    dpLvItems.SetPageProperties(0, ddlPager.SelectedValue, True)
                End If
                If txtSearch.Text.Contains("|") Then
                    Search = IIf(txtSearch.Text = "", "1=1", " (SKU = '" + txtSearch.Text.Split("|")(1) + "')")
                Else
                    Search = IIf(txtSearch.Text = "", "1=1", " (Name Like '%" + txtSearch.Text + "%' or SKU Like '%" + txtSearch.Text + "%' or ItemCode Like '%" + txtSearch.Text + "%' or BrandName Like '%" + txtSearch.Text + "%' or salesman Like '%" + txtSearch.Text + "%' or CityName like '%" + txtSearch.Text + "%'  or AreaName like '%" + txtSearch.Text + "%' ) ")
                End If
            End If

            Dim CreatedDateFrom As String = IIf(txtDateFrom.Text = "", "1=1", "  CreatedDate >= '" + PublicFunctions.DateFormat(txtDateFrom.Text, "yyyy/MM/dd") + " 00:00:00'")
            Dim CreatedDateTo As String = IIf(txtDateTo.Text = "", "1=1", "  CreatedDate <= '" + PublicFunctions.DateFormat(txtDateTo.Text, "yyyy/MM/dd") + " 23:59:59'")
            Dim Reported As String = IIf(rblReported.SelectedValue = "-1", "1=1", "  Reported = '" + rblReported.SelectedValue + "'")
            Dim Country As String = IIf(ddlCountry.SelectedValue = "0", "1=1", "  CountryId = '" + ddlCountry.SelectedValue + "'")
            Dim ShowTo As String = IIf(PublicFunctions.GetUserType(UserId).ToLower = "admin", "1=1", " (CreatedBy = '" + UserId + "')")

            Dim result As String = Search + " and " + CreatedDateFrom + " and " + CreatedDateTo + " and " + ShowTo + " and " + Reported + " and " + Country
            Return result
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
            Return Search
        End Try
    End Function


#End Region

#Region "Sorting"

    ''' <summary>
    ''' Sorting Listview
    ''' </summary>
    Protected Sub lv_Sorting(sender As Object, e As ListViewSortEventArgs)
        Try
            Dim strSortExpression As String() = SortExpression.Value.ToString().Split(" "c)

            ' If the sorting column is the same as the previous one, 
            ' then change the sort order.
            If strSortExpression(0) = e.SortExpression Then
                If strSortExpression(1) = "ASC" Then
                    SortExpression.Value = Convert.ToString(e.SortExpression) & " " & "DESC"
                Else
                    SortExpression.Value = Convert.ToString(e.SortExpression) & " " & "ASC"
                End If
            Else
                ' If sorting column is another column, 
                ' then specify the sort order to "Ascending".
                SortExpression.Value = Convert.ToString(e.SortExpression) & " " & "DESC"
            End If

            ' Rebind the listview control to show sorted data.
            FillGrid(sender, New EventArgs)

            ' reset sorting Arrows.
            ResetArrows()

            If strSortExpression(1) = "ASC" Then
                CType(lvItems.FindControl(e.SortExpression), HtmlTableCell).Attributes.Add("class", "faDown")
            Else
                CType(lvItems.FindControl(e.SortExpression), HtmlTableCell).Attributes.Add("class", "faUp")
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)

        End Try

    End Sub
    ''' <summary>
    ''' Reset Rows
    ''' </summary>
    Sub ResetArrows()
        Try
            Dim i As Integer = 0
            While i < lvItems.Items.Count

                CType(lvItems.FindControl("Name"), HtmlTableCell).Attributes.Add("class", "upnDownArrow")
                CType(lvItems.FindControl("ListedByName"), HtmlTableCell).Attributes.Add("class", "upnDownArrow")
                CType(lvItems.FindControl("CategoryName"), HtmlTableCell).Attributes.Add("class", "upnDownArrow")
                CType(lvItems.FindControl("SubCategoryName"), HtmlTableCell).Attributes.Add("class", "upnDownArrow")
                CType(lvItems.FindControl("BrandName"), HtmlTableCell).Attributes.Add("class", "upnDownArrow")
                CType(lvItems.FindControl("CreatedDate"), HtmlTableCell).Attributes.Add("class", "upnDownArrow")
                CType(lvItems.FindControl("Active"), HtmlTableCell).Attributes.Add("class", "upnDownArrow")

                i += 1
            End While

        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)

        End Try

    End Sub
#End Region

#Region "Paging"

    ''' <summary>
    ''' Set Number of rows at every page
    ''' </summary>
    Protected Sub PageSize_Changed(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            dpLvItems.SetPageProperties(0, ddlPager.SelectedValue, True)
            FillGrid(sender, New EventArgs)
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)

        End Try
    End Sub
    ''' <summary>
    ''' set Pager
    ''' </summary>
    Protected Sub OnPagePropertiesChanging(sender As Object, e As PagePropertiesChangingEventArgs)
        Try
            dpLvItems.SetPageProperties(e.StartRowIndex, e.MaximumRows, False)
            FillGrid(sender, New EventArgs)
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)

        End Try
    End Sub



#End Region

#Region "Fill Lists"
    ''' <summary>
    ''' Bind Drop Down Lists of category and sub category.
    ''' </summary>
    Sub BindLists()
        Try
            clsBindDDL.BindLookupDDLs("Item Category", ddlCategory, True)
            clsBindDDL.BindLookupDDLs("Item Category", ddlCategory, True)

        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub


#End Region

#Region "New"

    ''' <summary>
    ''' Handle add button(form grid) click event.
    ''' </summary>
    Protected Sub Add(ByVal Sender As Object, ByVal e As System.EventArgs)
        Try
            cmdSave.CommandArgument = "add"
            pf.ClearAll(pnlForm)
            SetDefaultValues()
            txtVATPercent.Text = "5"
            Enabler(True)

        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

    ''' <summary>
    ''' set Default values for controls
    ''' </summary>
    Sub SetDefaultValues()
        Try
            'ddlBrand.SelectedIndex = 0
            ' ddlModel.SelectedIndex = 0
            ddlCollection.SelectedIndex = 0
            ddlMaterial.SelectedIndex = 0
            ddlStyle.SelectedIndex = 0
            ddlCondition.SelectedIndex = 0
            ddlCategory.SelectedIndex = 0
            ddlSubCategory.SelectedIndex = 0
            ddlColors.SelectedIndex = 0
            ddlSize.SelectedIndex = 0
            ddlShippingCompany.SelectedIndex = 0
            rblItemType.SelectedIndex = 0
            rblIsService.SelectedIndex = 0
            txtDescription.TextValue = String.Empty
            lblItemId.Text = String.Empty
            gvItemsImgs.DataSource = Nothing
            gvItemsImgs.DataBind()
            lvRelatedItems.DataSource = Nothing
            lvRelatedItems.DataBind()
            ddlCategory.Enabled = True
            ddlSubCategory.Enabled = True
            ddlColors.Enabled = True
            ddlSize.Enabled = True
            ddlCollection.Enabled = True
            lblBarCode.Text = String.Empty
            CityId.Value = String.Empty
            aceCity.ContextKey = String.Empty
            AreaId.Value = String.Empty
            ddlSubCategory.Enabled = False
            txtModel.Enabled = False
            txtCustomerMobile.Enabled = True
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    Sub GenerateSkuCode()
        Try
            txtSKUCode.Text = GetItemSKU("sku")
            txtItemCode.Text = GetItemSKU("code")
            lblBarCode.Text = txtSKUCode.Text
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    ''' <summary>
    ''' Check Item Exist Before
    ''' </summary>
    Sub CheckItemCode(sender As Object, e As EventArgs)
        Try
            Dim KeyValue As String = "1=1"
            Select Case sender.id
                Case "txtSKUCode"
                    KeyValue = "Code='" & txtSKUCode.Text & "'"
                Case "txtItemCode"
                    KeyValue = "SupplierCode='" & txtItemCode.Text & "'"
            End Select
            Dim dt As DataTable
            dt = DBContext.Getdatatable("select Id from tblItems where isnull(IsDeleted,0)=0 and " & KeyValue & " and clientId='" & Client_Id & "'")
            If dt.Rows.Count > 0 Then
                Dim itemId As String = dt.Rows(0).Item("Id").ToString
                If lblItemId.Text <> itemId Then
                    clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.CUSTOMInfo, Page, Nothing, "This Item Code Entered Before")
                End If
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    Sub SelectType()
        Try
            Select Case rblItemType.SelectedValue
                Case "A", "S"
                    pnlPrice.Visible = True
                Case "B"
                    txtPrice.Text = String.Empty
                    pnlPrice.Visible = False
            End Select
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    Sub SelectIsService()
        Try
            Select Case rblIsService.SelectedValue
                Case "0"
                    rfvBrand.Enabled = True
                    lblBrandRequired.Attributes.Add("class", "required")
                Case "1"
                    rfvBrand.Enabled = False
                    lblBrandRequired.Attributes.Remove("class")
            End Select
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    ''' <summary>
    ''' Handle Brand textbox select Change event.
    ''' </summary>
    Sub SelectBrand()
        Try
            'clsBindDDL.BindCustomDDLs("select Id,Name from vw_models where BrandId='" + ddlBrand.SelectedValue + "' and clientID='" + Client_Id + "'", "Name", "ID", ddlModel, True,,,)
            'If ddlBrand.SelectedValue = "0" Then
            '    ddlModel.Enabled = False
            'Else
            '    ddlModel.Enabled = True
            'End If
            txtModel.Text = String.Empty
            ModelId.Value = String.Empty
            txtModel.Enabled = False
            ItemBrandName = txtBrand.Text.Trim
            If ItemBrandName <> String.Empty Then
                txtModel.Enabled = True
                Dim dtBrand As DataTable = DBContext.Getdatatable("select Id from tblItemsBrands where Brand='" + ItemBrandName + "' and isnull(Isdeleted,0)=0 and ClientId='" + Client_Id + "'")
                If dtBrand.Rows.Count > 0 Then
                    BrandId.Value = dtBrand.Rows(0).Item(0).ToString
                Else
                    BrandId.Value = String.Empty
                End If
                aclModels.ContextKey = BrandId.Value
                txtBrand.Text = ItemBrandName
            Else
                BrandId.Value = String.Empty
                ItemBrandName = String.Empty
                aclModels.ContextKey = String.Empty
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

    Sub SelectModel()
        Try
            ItemModelName = txtModel.Text.Trim
            If ItemModelName <> String.Empty Then
                Dim dtModel As DataTable = DBContext.Getdatatable("select Id from tblItemsModels where Name='" + ItemModelName + "' and BrandId='" + BrandId.Value + "' and isnull(Isdeleted,0)=0 and ClientId='" + Client_Id + "'")
                If dtModel.Rows.Count > 0 Then
                    ModelId.Value = dtModel.Rows(0).Item(0).ToString
                Else
                    ModelId.Value = String.Empty
                End If
                txtModel.Text = ItemModelName
            Else
                ModelId.Value = String.Empty
                ItemModelName = String.Empty
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

    ''' <summary>
    ''' Handle Category textbox select Change event.
    ''' </summary>
    Sub SelectCategory()
        Try
            clsBindDDL.BindLookupDDLs("Item Sub Category", ddlSubCategory, True,,, ddlCategory.SelectedValue)
            GenerateSkuCode()
            If ddlCategory.SelectedValue = "0" Then
                ddlSubCategory.Enabled = False
            Else
                ddlSubCategory.Enabled = True
            End If

        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

    ''' <summary>
    ''' fill Keyowrds from name, brand, category, sub category
    ''' </summary>
    Sub FillKeywords()
        Try
            Dim Name As String = IIf(ItemName = "", "", ItemName & ",")
            Dim Brand As String = IIf(ItemBrandName = "", "", ItemBrandName & ",")
            Dim Category As String = IIf(ItemCategory = "0", "", ItemCategoryName & ",")
            Dim SubCategory As String = IIf(ItemSubCategory = "0", "", ItemSubCategoryName & ",")
            Dim Result As String = Name & Brand & Category & SubCategory
            txtKeywords.Text = Result
            If Result <> String.Empty Then
                txtKeywords.Text = Result.Substring(0, Result.Length - 1)
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

#End Region

#Region "Copy"
    ''' <summary>
    ''' Handle Copy button click event.
    ''' </summary>
    Protected Sub Details(ByVal Sender As Object, ByVal e As System.EventArgs)
        Try
            pf.ClearAll(pnlForm)
            SetDefaultValues()
            lblItemId.Text = Sender.commandargument.ToString
            If FillForm() Then
                Enabler(True)
                pnlForm.Enabled = False
                pnlPhotos.Enabled = False
                ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "details", "document.getElementById('pnlPhotos').style.display='none';", True)
                liSave.Visible = False
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
#End Region

#Region "Edit"

    ''' <summary>
    ''' Handle edit button click event.
    ''' </summary>
    Protected Sub Edit(ByVal Sender As Object, ByVal e As System.EventArgs)
        Try
            cmdSave.CommandArgument = "edit"
            pf.ClearAll(pnlForm)
            SetDefaultValues()
            lblItemId.Text = Sender.commandargument.ToString
            If FillForm() Then
                Enabler(True)
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

    ''' <summary>
    ''' Fill controls in the panel form with item details of updated item.
    ''' </summary>
    Private Function FillForm() As Boolean
        Try
            'Read item details of updated item
            Dim dt As New DataTable
            dt = DBContext.Getdatatable("select * from vw_CPItems where clientId='" & Client_Id & "' and id='" & lblItemId.Text & "'")
            If dt.Rows.Count <> 0 Then
                'set general details

                txtItemName.Text = dt.Rows(0).Item("Name").ToString
                CustomerId.Value = dt.Rows(0).Item("ListedBy").ToString
                FillCustomerDetails("Id='" + CustomerId.Value + "'")

                BrandId.Value = dt.Rows(0).Item("Brand").ToString
                txtBrand.Text = dt.Rows(0).Item("BrandName").ToString

                SelectBrand()
                ModelId.Value = dt.Rows(0).Item("Model").ToString
                txtModel.Text = dt.Rows(0).Item("ModelName").ToString
                txtDescription.TextValue = dt.Rows(0).Item("Description").ToString

                Dim ItemType As String = dt.Rows(0).Item("Type").ToString
                If rblItemType.Items.FindByValue(ItemType) IsNot Nothing Then
                    rblItemType.SelectedValue = ItemType
                End If

                Dim IsService As Boolean = PublicFunctions.BoolFormat(dt.Rows(0).Item("IsService").ToString)
                If IsService = True Then
                    rblIsService.SelectedValue = "1"
                Else
                    rblIsService.SelectedValue = "0"
                End If
                SelectIsService()
                Dim Collection As String = dt.Rows(0).Item("Collection").ToString
                If ddlCollection.Items.FindByValue(Collection) IsNot Nothing Then
                    ddlCollection.SelectedValue = Collection
                End If

                Dim Material As String = dt.Rows(0).Item("Material").ToString
                If ddlMaterial.Items.FindByValue(Material) IsNot Nothing Then
                    ddlMaterial.SelectedValue = Material
                End If

                Dim Style As String = dt.Rows(0).Item("Style").ToString
                If ddlStyle.Items.FindByValue(Style) IsNot Nothing Then
                    ddlStyle.SelectedValue = Style
                End If


                Dim Condition As String = dt.Rows(0).Item("Condition").ToString
                If ddlCondition.Items.FindByValue(Condition) IsNot Nothing Then
                    ddlCondition.SelectedValue = Condition
                End If


                'Set Category and sub category details
                Dim Category As String = dt.Rows(0).Item("Category").ToString
                If ddlCategory.Items.FindByValue(Category) IsNot Nothing Then
                    ddlCategory.SelectedValue = Category
                End If
                SelectCategory()
                Dim SubCategory As String = dt.Rows(0).Item("SubCategory").ToString
                If ddlSubCategory.Items.FindByValue(SubCategory) IsNot Nothing Then
                    ddlSubCategory.SelectedValue = SubCategory
                    ddlSubCategory.Enabled = True
                End If

                'set Color and size details
                Dim Color As String = dt.Rows(0).Item("Color").ToString
                If ddlColors.Items.FindByValue(Color) IsNot Nothing Then
                    ddlColors.SelectedValue = Color
                End If

                Dim Size As String = dt.Rows(0).Item("Size").ToString
                If ddlSize.Items.FindByValue(Size) IsNot Nothing Then
                    ddlSize.SelectedValue = Size
                End If

                'Set Active, Hot and returnable details
                rblActive.SelectedValue = PublicFunctions.BoolFormat(dt.Rows(0).Item("Active").ToString)
                rblHot.SelectedValue = PublicFunctions.BoolFormat(dt.Rows(0).Item("Hot").ToString)
                rblReturnable.SelectedValue = PublicFunctions.BoolFormat(dt.Rows(0).Item("Returnable").ToString)

                'Set other item fields details
                txtRating.Text = dt.Rows(0).Item("Rating").ToString
                txtYoutubeURL.Text = dt.Rows(0).Item("YoutubeURL").ToString
                txtSourceURL.Text = dt.Rows(0).Item("SourceURL").ToString
                txtKeywords.Text = dt.Rows(0).Item("Keywords").ToString
                HiddenBrochure.Text = dt.Rows(0).Item("PDFURL").ToString
                FillBrochureImage()

                'set qunatity and shipping details
                txtQuantity.Text = PublicFunctions.IntFormat(dt.Rows(0).Item("Quantity").ToString)
                Dim ShippingCompany As String = dt.Rows(0).Item("ShippingCourier").ToString
                If ddlShippingCompany.Items.FindByValue(ShippingCompany) IsNot Nothing Then
                    ddlShippingCompany.SelectedValue = ShippingCompany
                End If
                txtWeight.Text = PublicFunctions.DecimalFormat(dt.Rows(0).Item("Weight").ToString)

                'set item price details
                txtSupplierPrice.Text = PublicFunctions.DecimalFormat(dt.Rows(0).Item("SupplierPrice").ToString)
                txtTotalCost.Text = PublicFunctions.DecimalFormat(dt.Rows(0).Item("Cost").ToString)
                txtVAT.Text = PublicFunctions.DecimalFormat(dt.Rows(0).Item("VAT").ToString)
                txtVATPercent.Text = PublicFunctions.DecimalFormat(dt.Rows(0).Item("VATPercent").ToString)

                txtPrice.Text = PublicFunctions.DecimalFormat(dt.Rows(0).Item("CreditPrice").ToString)
                txtCRMargin.Text = PublicFunctions.DecimalFormat(dt.Rows(0).Item("CreditMargin").ToString)


                txtCODPrice.Text = PublicFunctions.DecimalFormat(dt.Rows(0).Item("CashPrice").ToString)
                txtCODMargin.Text = PublicFunctions.DecimalFormat(dt.Rows(0).Item("CashMargin").ToString)


                'set item photos
                FillPhotos(lblItemId.Text)
                'fill related item
                FillRelatedItems()


                txtSKUCode.Text = dt.Rows(0).Item("SKU").ToString
                txtItemCode.Text = dt.Rows(0).Item("ItemCode").ToString
                lblBarCode.Text = txtSKUCode.Text

                CityId.Value = dt.Rows(0).Item("City").ToString
                txtCity.Text = PublicFunctions.GetLockupValue(CityId.Value)
                AreaId.Value = dt.Rows(0).Item("Area").ToString
                txtArea.Text = PublicFunctions.GetLockupValue(AreaId.Value)

                txtLongitude.Text = dt.Rows(0).Item("Longitude").ToString
                txtLatitude.Text = dt.Rows(0).Item("Latitude").ToString

                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
            Return False
        End Try
    End Function
    ''' <summary>
    ''' fill list view of items that have same Item Code.
    ''' </summary>
    Sub FillRelatedItems()
        Try
            Dim dtItems As DataTable
            If cmdSave.CommandArgument = "add" Then
                dtItems = DBContext.Getdatatable("select * from tblItems where isnull(IsDeleted,0)=0 and clientId='" + Client_Id + "' and SupplierCode='" + txtItemCode.Text + "'")
            Else
                dtItems = DBContext.Getdatatable("select * from tblItems where isnull(IsDeleted,0)=0 and clientId='" + Client_Id + "' and SupplierCode='" + txtItemCode.Text + "' and Id <> '" + lblItemId.Text + "'")
            End If

            lvRelatedItems.DataSource = dtItems
            lvRelatedItems.DataBind()
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
#End Region

#Region "Delete"

    ''' <summary>
    ''' Handle delete button form listview.
    ''' </summary>
    Protected Sub Delete(ByVal Sender As Object, ByVal e As System.EventArgs)
        Try
            Dim ItemId As String = Sender.commandargument.ToString
            Dim dtOrders As DataTable = DBContext.Getdatatable("select Id from tblOrderDetails where isnull(IsDeleted,0)=0 and clientId='" + Client_Id + "' and ItemId='" + ItemId + "'")
            If dtOrders.Rows.Count > 0 Then
                clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.CUSTOMInfo, Page, Nothing, "This item already sold before, can't delete it")
                Return
            End If

            _sqlconn.Open()
            _sqltrans = _sqlconn.BeginTransaction
            ExecuteQuery.ExecuteQueryAndReturnDataTable("update tblItems SET IsDeleted = 'True',DeletedBy='" + UserId + "',DeletedDate=getdate() where Id= '" + ItemId + "'", _sqlconn, _sqltrans)
            ExecuteQuery.ExecuteQueryAndReturnDataTable("update tblItemsPhotos SET IsDeleted = 'True',DeletedBy='" + UserId + "',DeletedDate=getdate() where ItemId= '" + ItemId + "'", _sqlconn, _sqltrans)
            _sqltrans.Commit()
            _sqlconn.Close()

            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.Delete, Page)
            FillGrid(Sender, New EventArgs)

            'clsGlobalApplication.UpdateApplicationItems()
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

#End Region

#Region "Save"

    ''' <summary>
    ''' Generate sku code and item code
    ''' </summary>
    Function GetItemSKU(ByVal Type As String) As String
        Try

            Dim BrandPrefix As String = String.Empty
            If ItemBrandName <> String.Empty Then
                BrandPrefix = ItemBrandName.Trim.Substring(0, 2)
            End If

            Dim CatPrefix As String = String.Empty
            If ItemCategory <> String.Empty Then
                CatPrefix = ItemCategoryName.Trim.Substring(0, 2)
            End If

            Dim SubCatPrefix As String = String.Empty
            If ItemSubCategoryName <> String.Empty Then
                SubCatPrefix = ItemSubCategoryName.Trim.Substring(0, 2)
            End If

            Dim CityPrefix As String = String.Empty
            If ItemCity <> String.Empty Then
                CityPrefix = ItemCity.Trim.Substring(0, 2)
            End If

            Dim AreaPrefix As String = String.Empty
            If ItemArea <> String.Empty Then
                AreaPrefix = ItemArea.Trim.Substring(0, 2)
            End If

            Dim SKUCode As String = ItemSKUCode
            Dim ItemCode As String = CatPrefix & SubCatPrefix & BrandPrefix  '& CityPrefix & AreaPrefix
            Select Case Type.ToLower
                Case "sku"
                    Return SKUCode.ToUpper.Trim
                Case "code"
                    Return ItemCode.ToUpper.Trim
            End Select
            Return ""
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
            Return Nothing
        End Try
    End Function
    ''' <summary>
    ''' Check SKU Code not exist
    ''' </summary>
    Function CheckSKU(ByVal SKUCode As String, ByVal Operation As String) As Boolean
        Try
            Dim dtItems As DataTable = New DataTable
            Select Case Operation.ToLower
                Case "insert"
                    dtItems = DBContext.Getdatatable("select Id from tblItems where isnull(IsDeleted,0)=0 and clientId='" & Client_Id & "' and Code ='" & SKUCode & "'")
                Case "update"
                    dtItems = DBContext.Getdatatable("select Id from tblItems where isnull(IsDeleted,0)=0 and clientId='" & Client_Id & "' and Code ='" & SKUCode & "' and Id <> '" & lblItemId.Text & "'")
            End Select
            If dtItems.Rows.Count > 0 Then
                Return False
            End If
            Return True
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
            Return False
        End Try
    End Function
    ''' <summary>
    ''' Check Item Code not exist with color and size
    ''' </summary>
    Function CheckItemCode(ByVal Operation As String) As Boolean
        Try
            Dim dtItems As DataTable = New DataTable
            Select Case Operation.ToLower
                Case "insert"
                    dtItems = DBContext.Getdatatable("select Id from tblItems where isnull(IsDeleted,0)=0 and clientId='" & Client_Id & "' and SupplierCode ='" & ItemCode & "' and Size='" & ItemSize & "' and Color='" & ItemColor & "'")
                Case "update"
                    dtItems = DBContext.Getdatatable("select Id from tblItems where isnull(IsDeleted,0)=0 and clientId='" & Client_Id & "' and Id <> '" & lblItemId.Text & "' and SupplierCode ='" & ItemCode & "' and Size='" & ItemSize & "' and Color='" & ItemColor & "'")
            End Select
            If dtItems.Rows.Count > 0 Then
                Return False
            End If
            Return True
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
            Return False
        End Try
    End Function

    ''' <summary>
    ''' Get Brand id if exist and if new insert it then reurn brandid
    ''' </summary>
    Private Function GetBrandId() As String
        Try

            If ItemBrand = String.Empty Then
                ItemBrand = Nothing
                If ItemBrandName <> String.Empty Then
                    Dim dtBrand As DataTable = ExecuteQuery.ExecuteQueryAndReturnDataTable("insert into tblItemsBrands(Brand,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate,IsDeleted,ClientId) values ('" + ItemBrandName + "','" + UserId + "',getdate(),'" + UserId + "',getdate(),0,'" + Client_Id + "');select id from tblItemsBrands where brand='" + ItemBrandName + "' and clientId='" + Client_Id + "' and isnull(IsDeleted,0)=0", _sqlconn, _sqltrans)
                    If dtBrand.Rows.Count > 0 Then
                        ItemBrand = dtBrand.Rows(0).Item(0)
                    End If
                End If
            End If
            Return ItemBrand
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
            Return Nothing
        End Try
    End Function
    ''' <summary>
    ''' Get Model id if exist and if new insert it then reurn ModelId
    ''' </summary>
    Private Function GetModelId() As String
        Try

            If ItemModel = String.Empty Then
                ItemModel = Nothing
                If ItemModelName <> String.Empty Then
                    Dim dtModel As DataTable = ExecuteQuery.ExecuteQueryAndReturnDataTable("insert into tblItemsModels(BrandId,Name,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate,IsDeleted,ClientId) values ('" + ItemBrand + "','" + ItemModelName + "','" + UserId + "',getdate(),'" + UserId + "',getdate(),0,'" + Client_Id + "');select id from tblItemsModels where BrandId='" + ItemBrand + "' and Name='" + ItemModelName + "' and clientId='" + Client_Id + "' and isnull(IsDeleted,0)=0", _sqlconn, _sqltrans)
                    If dtModel.Rows.Count > 0 Then
                        ItemModel = dtModel.Rows(0).Item(0)
                    End If
                End If
            End If
            Return ItemModel
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' Get Listed By id if exist and if new insert it then reurn CustomerId
    ''' </summary>
    Private Function GetListedById() As String
        Try
            If listedByID = String.Empty Then
                listedByID = Nothing
                If listedByName <> String.Empty Then
                    Dim dtCustomers As DataTable = ExecuteQuery.ExecuteQueryAndReturnDataTable("insert into tblusers(Username,FullName,Mobile,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate,IsDeleted,ClientId) values ('','" + listedByName + "','" + listedByMobile + "','" + UserId + "',getdate(),'" + UserId + "',getdate(),0,'" + Client_Id + "');select id from tblusers where Mobile='" + listedByMobile + "' and clientId='" + Client_Id + "' and isnull(IsDeleted,0)=0", _sqlconn, _sqltrans)
                    If dtCustomers.Rows.Count > 0 Then
                        listedByID = dtCustomers.Rows(0).Item(0)
                    End If
                End If
            End If
            Return listedByID
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' Handle save button(form grid) click event.
    ''' </summary>
    Protected Sub Save(ByVal Sender As Object, ByVal e As System.EventArgs)
        Try
            'SelectCity()
            'SelectArea()
            'SelectBrand()
            'SelectModel()

            If Not PublicFunctions.IsGroupValid("vProduct", Page) Then
                Return
            End If
            ItemSKUCode = GetItemSKU("sku")
            ItemCode = GetItemSKU("code")
            Dim daTabeFactory As New TblItemsFactory
            Dim dtTable As New TblItems
            If cmdSave.CommandArgument.ToLower = "add" Then
                'Insert Case

                'Fill dtItems with its details
                If Not FillDT(dtTable, "insert") Then
                    Return
                End If

                'Open sql transaction
                _sqlconn.Open()
                _sqltrans = _sqlconn.BeginTransaction

                dtTable.ListedBy = GetListedById()
                dtTable.Brand = GetBrandId()
                ' dtTable.Model = GetModelId()

                'save Item details at tblitems
                If daTabeFactory.InsertTrans(dtTable, _sqlconn, _sqltrans) Then
                    Dim ItemId As String = PublicFunctions.GetIdentity(_sqlconn, _sqltrans)
                    'save item images at tblitemPhotos
                    If SaveImgs(ItemId, "insert", _sqlconn, _sqltrans) Then

                        ShowMessage(lblRes, clsMessages.MessageTypesEnum.Insert, Me.Page)
                    Else
                        Return
                    End If
                Else
                    clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, Nothing)
                    _sqltrans.Rollback()
                    Return
                End If

                _sqltrans.Commit()
                _sqlconn.Close()

            Else
                'Update Case

                'Get Item details 
                dtTable = daTabeFactory.GetAllBy(TblItems.TblItemsFields.ID, lblItemId.Text)(0)

                'fill dtitems with new details
                If Not FillDT(dtTable, "update") Then
                    Return
                End If

                'open sql transaction
                _sqlconn.Open()
                _sqltrans = _sqlconn.BeginTransaction

                dtTable.ListedBy = GetListedById()
                dtTable.Brand = GetBrandId()
                'dtTable.Model = GetModelId()

                'Update item details at tblItems
                If daTabeFactory.UpdateTrans(dtTable, _sqlconn, _sqltrans) Then
                    'save item images at tblitemPhotos
                    If SaveImgs(lblItemId.Text, "update", _sqlconn, _sqltrans) Then

                        ShowMessage(lblRes, clsMessages.MessageTypesEnum.Update, Me.Page)
                    Else
                        Return
                    End If
                Else
                    _sqltrans.Rollback()
                    clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, Nothing)
                    Return
                End If

                _sqltrans.Commit()
                _sqlconn.Close()
            End If
            Cancel(Sender, New EventArgs)
            'clsGlobalApplication.UpdateApplicationItems()
        Catch ex As Exception
            _sqltrans.Rollback()
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

    ''' <summary>
    ''' Fill dtItems from controls in the panel form.
    ''' </summary>
    Protected Function FillDT(ByRef dtItems As TblItems, ByVal Operation As String) As Boolean
        Try

            'If Not CheckSKU(ItemSKUCode, Operation) Then
            '    clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.CUSTOMInfo, Page, Nothing, "This Item SKU already exist")
            '    Return False
            'End If
            'If Not CheckItemCode(Operation) Then
            '    clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.CUSTOMInfo, Page, Nothing, "This Item already exist with same color and size")
            '    Return False
            'End If
            Select Case Operation
                Case "insert"
                    dtItems.Code = ItemCode + "-" + DBContext.SelectMax("Id", "tblItems").ToString
                    dtItems.CreatedBy = UserId
                    dtItems.CreatedDate = DateTime.Now
                    dtItems.ModifiedBy = UserId
                    dtItems.ModifiedDate = DateTime.Now
                    dtItems.IsDeleted = False
                    dtItems.ClientId = Client_Id

                Case "update"
                    dtItems.Code = ItemSKUCode
                    dtItems.ID = lblItemId.Text
                    dtItems.ModifiedBy = UserId
                    dtItems.ModifiedDate = DateTime.Now
                    dtItems.ClientId = Client_Id
            End Select



            'dtItems.SupplierCode = ItemCode
            'dtItems.BarCode = ItemBarCode
            dtItems.Name = ItemName

            dtItems.IsService = IsService
            dtItems.Type = ItemType
            dtItems.Description = ItemDesc
            dtItems.Category = ItemCategory
            dtItems.SubCategory = ItemSubCategory
            dtItems.Collection = ItemCollection
            dtItems.Material = ItemMaterial
            dtItems.Style = ItemStyle
            ' dtItems.Condition = ItemCondition
            dtItems.Color = ItemColor
            dtItems.Size = ItemSize
            dtItems.Keywords = ItemKeywords

            dtItems.Active = ItemActive
            dtItems.Returnable = ItemReturnable
            dtItems.Hot = ItemHot

            dtItems.Quantity = ItemQuantity
            dtItems.Rating = ItemRating

            'Dim ValidYoutubeURL = PublicFunctions.GetEmbedYoutubeVideo(ItemYouTubeURL)
            'If txtYoutubeURL.Text <> "" AndAlso ValidYoutubeURL = "" Then
            '    clsMessages.ShowInfoMessgage(lblRes, "Not Valid Youtube URL!", Me)
            '    txtYoutubeURL.Focus()
            '    txtYoutubeURL.Text = String.Empty
            '    Return False
            'End If
            'dtItems.YoutubeURL = ValidYoutubeURL
            dtItems.SourceURL = ItemSourceURL
            dtItems.PDFURL = ItemBrochure

            'dtItems.ShippingCourier = ItemShippingCompany
            dtItems.Weight = ItemWeight

            'dtItems.SupplierPrice = ItemCost

            'dtItems.Cost = ItemQuantity * ItemCost
            'dtItems.CreditPrice = ItemCRPrice
            'dtItems.CashPrice = ItemCODPrice
            'dtItems.CreditMargin = ItemCRMargin
            'dtItems.CashMargin = ItemCODMargin
            'dtItems.VAT = ItemVatAmount
            'dtItems.VATPercent = ItemVatPercent

            dtItems.City = ItemCityId
            dtItems.Area = ItemAreaId
            dtItems.Longitude = Itemlng
            dtItems.Latitude = Itemlat
            If getMainImg() = "0" Then
                clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.CUSTOMInfo, Page, Nothing, "You must upload Photo and select Main Photo from the list")
                Return False
            Else
                dtItems.Photo = getMainImg()
                dtItems.PhotoThumb = dtItems.Photo.Replace(dtItems.Photo.Split("/").Last, "Thumb_" & dtItems.Photo.Split("/").Last)
            End If
            Return True
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
            Return False
        End Try
    End Function

    ''' <summary>
    ''' Save Images of item
    ''' </summary>
    Function SaveImgs(ByVal ItemId As String, ByVal Operation As String, _sqlconn As SqlConnection, _sqltrans As SqlTransaction) As Boolean
        Try
            Dim daImgs As New TblItemsPhotosFactory
            Dim dtImgs As New TblItemsPhotos
            If Operation.ToLower = "update" Then
                daImgs.DeleteTrans(TblItemsPhotos.TblItemsPhotosFields.ItemId, ItemId, _sqlconn, _sqltrans)
            End If
            For Each gvRow As GridViewRow In gvItemsImgs.Rows
                dtImgs.ItemId = ItemId
                dtImgs.Photo = CType(gvRow.FindControl("lblImg"), System.Web.UI.WebControls.Image).ImageUrl
                dtImgs.PhotoThumb = dtImgs.Photo.Replace(dtImgs.Photo.Split("/").Last, "Thumb_" + dtImgs.Photo.Split("/").Last)
                dtImgs.Main = CType(gvRow.FindControl("rblSelect"), RadioButton).Checked
                dtImgs.Type = CType(gvRow.FindControl("ddlImgType"), DropDownList).SelectedValue
                dtImgs.CreatedDate = Date.Now
                dtImgs.ModifiedDate = Date.Now
                dtImgs.CreatedBy = UserId
                dtImgs.ModifiedBy = UserId
                dtImgs.IsDeleted = False
                dtImgs.ClientId = Client_Id
                If daImgs.InsertTrans(dtImgs, _sqlconn, _sqltrans) = False Then
                    _sqltrans.Rollback()
                    clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, Nothing)
                    Return False
                End If
            Next
            Return True
        Catch ex As Exception
            _sqltrans.Rollback()
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
            Return False
        End Try
    End Function
#End Region

#Region "Cancel"

    ''' <summary>
    ''' Handle cancel button click event
    ''' </summary>
    Protected Sub Cancel(ByVal Sender As Object, ByVal e As System.EventArgs)
        Try
            SetDefaultValues()
            Enabler(False)
            FillGrid(Sender, New EventArgs)
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub


#End Region

#Region "Photos"
    ''' <summary>
    '''Fill Photos gridview.
    ''' </summary>
    Sub FillPhotos(ByVal ItemId As String)
        Try
            Dim dtItemImgs As DataTable = DBContext.Getdatatable("select * from TblItemsPhotos where isnull(IsDeleted,0)=0 and ItemId='" + ItemId + "' and clientId='" + Client_Id + "'")
            If dtItemImgs.Rows.Count > 0 Then
                gvItemsImgs.DataSource = dtItemImgs
                gvItemsImgs.DataBind()
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    ''' <summary>
    '''Add Uploaded photos to the gridview.
    ''' </summary>
    Protected Sub AddFiles(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            Dim dt As DataTable = MultiFileUpload.getUploadedFilesDetails(lblUploadedFilesDetails.Value)
            If dt IsNot Nothing Then
                ItemsImgs = GetItemImgs()
                If dt.Rows.Count > 0 Then
                    Dim i As Integer = 0
                    While i < dt.Rows.Count
                        Dim dtDoc As New TblItemsPhotos
                        dtDoc.Photo = "~/" & dt(i)("URL").ToString
                        dtDoc.ID = i + 1
                        ItemsImgs.Add(dtDoc)
                        i += 1
                    End While
                    gvItemsImgs.Visible = True
                    gvItemsImgs.DataSource = ItemsImgs
                    gvItemsImgs.DataBind()

                End If
                lblUploadedFilesDetails.Value = ""
                BindMainImg()
            Else
                gvItemsImgs.DataSource = Nothing
                gvItemsImgs.DataBind()
            End If

        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    ''' <summary>
    '''Check radio button with main photo
    ''' </summary>
    Sub BindMainImg()
        Try
            Dim dtItems As New DataTable
            dtItems = DBContext.Getdatatable("select Photo from TblItemsPhotos where Main='1' and ItemId='" + lblItemId.Text + "' and clientId='" + Client_Id + "'")
            If dtItems.Rows.Count <> 0 Then
                Dim Photo = dtItems.Rows(0).Item("Photo").ToString
                SelectMainImg(Photo)
            Else
                SelectMainImg("0")
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    Sub SelectMainImg(ByVal img As String)
        Try
            Dim Count As Integer = 0
            For Each gvRow As GridViewRow In gvItemsImgs.Rows
                Dim chk As RadioButton = DirectCast(gvRow.FindControl("rblSelect"), RadioButton)
                If CType(gvRow.FindControl("lblImg"), System.Web.UI.WebControls.Image).ImageUrl = img Then
                    chk.Checked = True
                    Count += 1
                End If
            Next
            If Count = 0 And gvItemsImgs.Rows.Count > 0 Then
                Dim chk As RadioButton = DirectCast(gvItemsImgs.Rows(0).FindControl("rblSelect"), RadioButton)
                chk.Checked = True
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    ''' <summary>
    '''check if there are exist photos and get them to add the new photos above them
    ''' </summary>
    Private Function GetItemImgs() As List(Of TblItemsPhotos)
        Dim DocList As New List(Of TblItemsPhotos)
        Try
            Dim AttObj As TblItemsPhotos
            Dim DaAtt As New TblItemsPhotosFactory
            For Each gvRow As GridViewRow In gvItemsImgs.Rows
                AttObj = New TblItemsPhotos
                AttObj.ID = CType(gvRow.FindControl("lblId"), Label).Text
                AttObj.Photo = CType(gvRow.FindControl("lblImg"), System.Web.UI.WebControls.Image).ImageUrl
                DocList.Add(AttObj)
            Next
            Return DocList
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
            Return DocList
        End Try
    End Function
    ''' <summary>
    '''Delete Image from gridview.
    ''' </summary>
    Protected Sub DeleteImg(ByVal sender As Object, ByVal e As EventArgs)
        Try
            Dim parent As GridViewRow = sender.parent.parent.parent
            Dim dt As New List(Of TblItemsPhotos)
            Try
                dt = GetItemImgs()
                dt.Remove(dt.Item(parent.RowIndex))
                gvItemsImgs.DataSource = dt
                gvItemsImgs.DataBind()
                BindMainImg()
            Catch ex As Exception
                clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
            End Try
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    ''' <summary>
    '''return Main Image to save it at tblitems.
    ''' </summary>
    Function getMainImg() As String
        Try
            If gvItemsImgs.Rows.Count > 0 Then
                For Each gvRow As GridViewRow In gvItemsImgs.Rows
                    Dim chk As RadioButton = DirectCast(gvRow.FindControl("rblSelect"), RadioButton)
                    If chk.Checked Then
                        Return CType(gvRow.FindControl("lblImg"), System.Web.UI.WebControls.Image).ImageUrl
                    End If
                Next
            End If
            Return "0"
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
            Return "0"
        End Try
    End Function
    ''' <summary>
    '''allow user to select only one image.
    ''' </summary>
    Protected Sub SelectRBL(ByVal sender As Object, ByVal e As EventArgs)
        Try
            For Each row As GridViewRow In gvItemsImgs.Rows
                Dim chk As RadioButton = DirectCast(row.FindControl("rblSelect"), RadioButton)
                If chk.ClientID <> sender.ClientID Then
                    chk.Checked = False
                End If
            Next
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    ''' <summary>
    ''' View Photos of news.
    ''' </summary>
    Protected Sub ViewPhotos(ByVal sender As Object, ByVal e As EventArgs)
        Try
            Dim parent = sender.parent
            Dim ItemId As String = sender.CommandArgument
            Dim ImgbigPhoto As Image = DirectCast(parent.FindControl("ImgbigPhoto"), Image)
            imgMain.ImageUrl = ImgbigPhoto.ImageUrl
            Dim dtItemImgs As DataTable = DBContext.Getdatatable("select Photo,PhotoThumb from TblItemsPhotos where isnull(IsDeleted,0)=0 and ItemId='" + ItemId + "'")
            lvImages.DataSource = dtItemImgs
            lvImages.DataBind()
            mpPopupImgs.Show()
            ScriptManager.RegisterStartupScript(up, GetType(Page), "topFunction", "topFunction();", True)
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    Private Sub gvItemsImgs_DataBound(sender As Object, e As EventArgs) Handles gvItemsImgs.DataBound
        Try
            For Each gvRow As GridViewRow In gvItemsImgs.Rows
                Dim ImgType As String = DirectCast(gvRow.FindControl("lblImgType"), Label).Text
                Dim ddlImgType As DropDownList = DirectCast(gvRow.FindControl("ddlImgType"), DropDownList)
                If ddlImgType.Items.FindByValue(ImgType) IsNot Nothing Then
                    ddlImgType.SelectedValue = ImgType
                End If
            Next
        Catch ex As Exception
            ShowMessage(lblRes, MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
#End Region

#Region "Brochure Uploader"
    Protected Sub BrochureUploaded(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim Path As String = ""
        Dim fu As New AjaxControlToolkit.AsyncFileUpload
        Try
            fu = fuPhoto
            Path = Server.MapPath("~/Items_Brochures/")
            Dim contentType1 As String = fu.ContentType
            If contentType1 = "image/jpeg" OrElse contentType1 = "image/gif" OrElse contentType1 = "image/png" OrElse contentType1 = "application/vnd.openxmlformats-officedocument.wordprocessingml.document" OrElse contentType1 = "application/msword" OrElse contentType1 = "application/pdf" Then
                HiddenBrochure.Text = "~/Items_Brochures/" & fu.FileName
                fu.SaveAs(Path & fu.FileName)
            Else
                HiddenBrochure.Text = ""
            End If

        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    Sub FillBrochureImage()
        Try
            If HiddenBrochure.Text IsNot Nothing And HiddenBrochure.Text <> "" Then
                If HiddenBrochure.Text.ToString.Split(".").Last.ToLower = "pdf" Then
                    imgBrochure.ImageUrl = "~/images/pdf_icon.jpg"
                ElseIf HiddenBrochure.Text.ToString.Split(".").Last.ToLower = "doc" Then
                    imgBrochure.ImageUrl = "~/images/word.png"
                ElseIf HiddenBrochure.Text.ToString.Split(".").Last.ToLower = "docx" Then
                    imgBrochure.ImageUrl = "~/images/word.png"
                Else
                    imgBrochure.ImageUrl = HiddenBrochure.Text
                End If
            Else
                HiddenBrochure.Text = ""
                imgBrochure.ImageUrl = "~/images/noDoc.png"
            End If

        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    Sub ClearBrochure(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            HiddenBrochure.Text = ""
            imgBrochure.ImageUrl = "~/images/noDoc.png"
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
#End Region



#Region "Collapse"
    Private Sub CheckCollapse()
        CheckCollapse1()
        CheckCollapse2()
        CheckCollapse3()
        CheckCollapse4()
    End Sub
    Private Sub CheckCollapse1()
        If Collapse1Status.Value <> "" Then
            ScriptManager.RegisterStartupScript(up, GetType(Page), "col1", "CollapseInDiv('collapse1');", True)
        Else
            ScriptManager.RegisterStartupScript(up, GetType(Page), "col1", "ExpandInDiv('collapse1');", True)
        End If
    End Sub
    Private Sub CheckCollapse2()
        If Collapse2Status.Value <> "" Then
            ScriptManager.RegisterStartupScript(up, GetType(Page), "col2", "CollapseInDiv('collapse2');", True)
        Else
            ScriptManager.RegisterStartupScript(up, GetType(Page), "col2", "ExpandInDiv('collapse2');", True)
        End If
    End Sub
    Private Sub CheckCollapse3()
        If Collapse3Status.Value <> "" Then
            ScriptManager.RegisterStartupScript(up, GetType(Page), "col3", "CollapseInDiv('collapse3');", True)
        Else
            ScriptManager.RegisterStartupScript(up, GetType(Page), "col3", "ExpandInDiv('collapse3');", True)
        End If
    End Sub
    Private Sub CheckCollapse4()
        If Collapse4Status.Value <> "" Then
            ScriptManager.RegisterStartupScript(up, GetType(Page), "col4", "CollapseInDiv('collapse4');", True)
        Else
            ScriptManager.RegisterStartupScript(up, GetType(Page), "col4", "ExpandInDiv('collapse4');", True)
        End If
    End Sub



#End Region


End Class
