
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
    Dim ItemName As String
    Dim ItemBrand As String
    Dim ItemBrandName As String
    Dim ItemActive As Boolean
    Dim ItemDesc As String
    Dim ItemCategory As String
    Dim ItemCategoryName As String
    Dim ItemSubCategory As String
    Dim ItemSubCategoryName As String
    Dim ItemColor As String
    Dim ItemColorName As String
    Dim ItemSize As String
    Dim ItemReturnable As Boolean
    Dim ItemHot As Boolean
    Dim ItemQuantity As Integer
    Dim ItemRating As Double
    Dim ItemYouTubeURL As String
    Dim ItemSourceURL As String
    Dim ItemKeywords As String

    Dim ItemPrice As Decimal
    Dim ItemDiscountPercent As Double
    Dim ItemDiscountAmt As Double
    Dim ItemNetPRice As Double

    Dim ProdYear As String
    Dim Designer As String
    Dim ItemBrochure As String
    Dim ItemCollection As String
    Dim ItemMaterial As String
    Dim ItemStyle As String

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
            ItemName = txtItemName.Text
            ItemBrand = ddlBrand.SelectedValue
            ItemBrandName = ddlBrand.SelectedItem.Text
            ItemActive = PublicFunctions.BoolFormat(rblActive.SelectedValue)
            ItemDesc = txtDescription.TextValue
            ItemCategory = ddlCategory.SelectedValue
            ItemCategoryName = ddlCategory.SelectedItem.Text
            ItemSubCategory = ddlSubCategory.SelectedValue
            ItemSubCategoryName = ddlSubCategory.SelectedItem.Text
            ItemColor = ddlColors.SelectedValue
            ItemColorName = ddlColors.SelectedItem.Text
            ItemSize = txtItemSize.Text
            ItemReturnable = PublicFunctions.BoolFormat(rblReturnable.SelectedValue)
            ItemHot = PublicFunctions.BoolFormat(rblHot.SelectedValue)
            ItemQuantity = PublicFunctions.DecimalFormat(txtQuantity.Text)
            ItemRating = PublicFunctions.DecimalFormat(txtRating.Text)
            ItemYouTubeURL = txtYoutubeURL.Text
            ItemSourceURL = txtSourceURL.Text
            ItemKeywords = txtKeywords.Text

            ItemBrochure = HiddenBrochure.Text
            ItemCollection = ddlCollection.SelectedValue
            ItemMaterial = ddlMaterial.SelectedValue
            ItemStyle = ddlStyle.SelectedValue
            ProdYear = txtProdYear.Text
            Designer = txtDesigner.Text

            ItemPrice = PublicFunctions.DecimalFormat(txtPrice.Text)

            FillBrochureImage()
            CheckCollapse()
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

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
            clsBindDDL.BindLookupDDLs("Item Brand", ddlBrand, True)
            clsBindDDL.BindLookupDDLs("Item Category", ddlCategory, True)
            clsBindDDL.BindLookupDDLs("Item Color", ddlColors, True)
            clsBindDDL.BindLookupDDLs("Collection", ddlCollection, True)
            clsBindDDL.BindLookupDDLs("Material", ddlMaterial, True)
            clsBindDDL.BindLookupDDLs("Style", ddlStyle, True)
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
            Search = "1=1"
            If txtSearch.Text <> String.Empty Then
                If sender.id = "cmdSearch" Then
                    dpLvItems.SetPageProperties(0, ddlPager.SelectedValue, True)
                End If
                If txtSearch.Text.Contains("|") Then
                    Search = IIf(txtSearch.Text = "", "1=1", " (SKU = '" + txtSearch.Text.Split("|")(1) + "')")
                Else
                    Search = IIf(txtSearch.Text = "", "1=1", " (Name Like '%" + txtSearch.Text + "%' or SKU Like '%" + txtSearch.Text + "%' or BrandName Like '%" + txtSearch.Text + "%' ) ")
                End If
            End If

            Dim CreatedDateFrom As String = IIf(txtDateFrom.Text = "", "1=1", "  CreatedDate >= '" + PublicFunctions.DateFormat(txtDateFrom.Text, "yyyy/MM/dd") + " 00:00:00'")
            Dim CreatedDateTo As String = IIf(txtDateTo.Text = "", "1=1", "  CreatedDate <= '" + PublicFunctions.DateFormat(txtDateTo.Text, "yyyy/MM/dd") + " 23:59:59'")

            Dim result As String = Search + " and " + CreatedDateFrom + " and " + CreatedDateTo

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
            ddlCollection.SelectedIndex = 0
            ddlMaterial.SelectedIndex = 0
            ddlStyle.SelectedIndex = 0
            ddlBrand.SelectedIndex = 0
            ddlCategory.SelectedIndex = 0
            ddlSubCategory.SelectedIndex = 0
            ddlColors.SelectedIndex = 0
            txtDescription.TextValue = String.Empty
            lblItemId.Text = String.Empty
            gvItemsImgs.DataSource = Nothing
            gvItemsImgs.DataBind()
            lvRelatedItems.DataSource = Nothing
            lvRelatedItems.DataBind()
            ddlCategory.Enabled = True
            ddlColors.Enabled = True
            ddlCollection.Enabled = True
            ddlSubCategory.Enabled = False

        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    Sub GenerateSkuCode()
        Try
            txtSKUCode.Text = GetItemSKU("sku")
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


                'Set Brand
                Dim Brand As String = dt.Rows(0).Item("Brand").ToString
                If ddlBrand.Items.FindByValue(Brand) IsNot Nothing Then
                    ddlBrand.SelectedValue = Brand
                End If


                txtDescription.TextValue = dt.Rows(0).Item("Description").ToString

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

                txtItemSize.Text = dt.Rows(0).Item("Size").ToString
                txtProdYear.Text = dt.Rows(0).Item("ProdYear").ToString
                txtDesigner.Text = dt.Rows(0).Item("Designer").ToString
                'Set Active, Hot and returnable details
                rblActive.SelectedValue = PublicFunctions.BoolFormat(dt.Rows(0).Item("Active").ToString)
                rblHot.SelectedValue = PublicFunctions.BoolFormat(dt.Rows(0).Item("Hot").ToString)
                rblReturnable.SelectedValue = PublicFunctions.BoolFormat(dt.Rows(0).Item("Returnable").ToString)

                'Set other item fields details
                txtRating.Text = dt.Rows(0).Item("Rating").ToString
                txtYoutubeURL.Text = dt.Rows(0).Item("YoutubeURL").ToString
                txtSourceURL.Text = dt.Rows(0).Item("SourceURL").ToString
                txtKeywords.Text = dt.Rows(0).Item("Keywords").ToString
                HiddenBrochure.Text = dt.Rows(0).Item("SketchPhoto").ToString
                FillBrochureImage()

                'set qunatity and shipping details
                txtQuantity.Text = PublicFunctions.IntFormat(dt.Rows(0).Item("Quantity").ToString)

                txtWeight.Text = PublicFunctions.DecimalFormat(dt.Rows(0).Item("Weight").ToString)

                'set item price details

                txtPrice.Text = PublicFunctions.DecimalFormat(dt.Rows(0).Item("Price").ToString)

                'set item photos
                FillPhotos(lblItemId.Text)
                'fill related item
                'FillRelatedItems()

                txtSKUCode.Text = dt.Rows(0).Item("SKU").ToString

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
    'Sub FillRelatedItems()
    '    Try
    '        Dim dtItems As DataTable
    '        If cmdSave.CommandArgument = "add" Then
    '            dtItems = DBContext.Getdatatable("select * from tblItems where isnull(IsDeleted,0)=0 and clientId='" + Client_Id + "' and SupplierCode='" + txtItemCode.Text + "'")
    '        Else
    '            dtItems = DBContext.Getdatatable("select * from tblItems where isnull(IsDeleted,0)=0 and clientId='" + Client_Id + "' and SupplierCode='" + txtItemCode.Text + "' and Id <> '" + lblItemId.Text + "'")
    '        End If

    '        lvRelatedItems.DataSource = dtItems
    '        lvRelatedItems.DataBind()
    '    Catch ex As Exception
    '        clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
    '    End Try
    'End Sub
#End Region

#Region "Delete"

    ''' <summary>
    ''' Handle delete button form listview.
    ''' </summary>
    Protected Sub Delete(ByVal Sender As Object, ByVal e As System.EventArgs)
        Try
            Dim ItemId As String = Sender.commandargument.ToString

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
    'Function CheckItemCode(ByVal Operation As String) As Boolean
    '    Try
    '        Dim dtItems As DataTable = New DataTable
    '        Select Case Operation.ToLower
    '            Case "insert"
    '                dtItems = DBContext.Getdatatable("select Id from tblItems where isnull(IsDeleted,0)=0 and clientId='" & Client_Id & "' and SupplierCode ='" & ItemCode & "' and Size='" & ItemSize & "' and Color='" & ItemColor & "'")
    '            Case "update"
    '                dtItems = DBContext.Getdatatable("select Id from tblItems where isnull(IsDeleted,0)=0 and clientId='" & Client_Id & "' and Id <> '" & lblItemId.Text & "' and SupplierCode ='" & ItemCode & "' and Size='" & ItemSize & "' and Color='" & ItemColor & "'")
    '        End Select
    '        If dtItems.Rows.Count > 0 Then
    '            Return False
    '        End If
    '        Return True
    '    Catch ex As Exception
    '        clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
    '        Return False
    '    End Try
    'End Function

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
    ''' Handle save button(form grid) click event.
    ''' </summary>
    Protected Sub Save(ByVal Sender As Object, ByVal e As System.EventArgs)
        Try

            If Not PublicFunctions.IsGroupValid("vProduct", Page) Then
                Return
            End If
            ItemSKUCode = GetItemSKU("sku")

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

                dtTable.Brand = GetBrandId()

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


                dtTable.Brand = GetBrandId()

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
                    dtItems.Code = ItemSKUCode
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
            dtItems.ProdYear = ProdYear
            dtItems.Designer = Designer
            'Dim ValidYoutubeURL = PublicFunctions.GetEmbedYoutubeVideo(ItemYouTubeURL)
            'If txtYoutubeURL.Text <> "" AndAlso ValidYoutubeURL = "" Then
            '    clsMessages.ShowInfoMessgage(lblRes, "Not Valid Youtube URL!", Me)
            '    txtYoutubeURL.Focus()
            '    txtYoutubeURL.Text = String.Empty
            '    Return False
            'End If
            'dtItems.YoutubeURL = ValidYoutubeURL
            dtItems.SourceURL = ItemSourceURL
            dtItems.SketchPhoto = ItemBrochure

            'dtItems.ShippingCourier = ItemShippingCompany

            dtItems.Price = ItemPrice
            dtItems.NetPrice = ItemPrice

            'dtItems.Cost = ItemQuantity * ItemCost
            'dtItems.CreditPrice = ItemCRPrice
            'dtItems.CashPrice = ItemCODPrice
            'dtItems.CreditMargin = ItemCRMargin
            'dtItems.CashMargin = ItemCODMargin
            'dtItems.VAT = ItemVatAmount
            'dtItems.VATPercent = ItemVatPercent


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
                    imgBrochure.ImageUrl = "images/pdf_icon.jpg"
                ElseIf HiddenBrochure.Text.ToString.Split(".").Last.ToLower = "doc" Then
                    imgBrochure.ImageUrl = "images/word.png"
                ElseIf HiddenBrochure.Text.ToString.Split(".").Last.ToLower = "docx" Then
                    imgBrochure.ImageUrl = "images/word.png"
                Else
                    imgBrochure.ImageUrl = HiddenBrochure.Text
                End If
            Else
                HiddenBrochure.Text = ""
                imgBrochure.ImageUrl = "images/noDoc.png"
            End If

        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    Sub ClearBrochure(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            HiddenBrochure.Text = ""
            imgBrochure.ImageUrl = "images/noDoc.png"
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
