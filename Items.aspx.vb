#Region "Import"
Imports System.Data
Imports BusinessLayer.BusinessLayer
Imports clsMessages
Imports clsGlobalApplication
#End Region
Partial Class Items
    Inherits clsLang
#Region "Global Variables"
    Dim UserId As String
    Dim OriginalURL As String = ""
    Dim PageNotFoundURL As String = "~/PageNotFound"
#End Region
#Region "Global Functions"
    ''' <summary>
    ''' Get Categories datatable
    ''' </summary>
    Function GetCategories() As DataTable
        Dim dtCat As DataTable = Nothing
        Try
            Dim dvCat As New DataView(GetItemsDT)
            If dvCat.Count > 0 Then
                dvCat.Sort = "CategoryName ASC"
                dtCat = dvCat.ToTable(True, "CategoryName", "Category")
            End If
            Return dtCat
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
            Return dtCat
        End Try
    End Function
    ''' <summary>
    ''' Get Sub Categories datatable
    ''' </summary>
    Function GetSubCategories() As DataTable
        Dim dtSubCat As DataTable = Nothing
        Try
            Dim dvSubCat As New DataView(GetItemsDT)
            If dvSubCat.Count > 0 Then
                pnlSubCategory.Visible = False
                Dim SelectedCategories As String = FilterByCategory(0)
                If SelectedCategories <> "1=1" Then
                    dvSubCat.RowFilter = SelectedCategories
                    dvSubCat.Sort = "SubCategoryName ASC"
                    dtSubCat = dvSubCat.ToTable(True, "SubCategoryName", "SubCategory", "CatSubCatName")
                    Dim NotEmptySubCat As DataRow() = dtSubCat.Select("ISNULL(SubCategoryName,'') <> ''")
                    If NotEmptySubCat.Count > 0 Then
                        dtSubCat = NotEmptySubCat.CopyToDataTable
                        pnlSubCategory.Visible = True
                    End If

                End If
            End If
            Return dtSubCat
        Catch ex As Exception
            Return dtSubCat
        End Try

    End Function
    ''' <summary>
    ''' Get Brands Datatable
    ''' </summary>
    Function GetBrands() As DataTable
        Dim dtBrand As DataTable = Nothing
        Try
            Dim dvBrand As New DataView(GetItemsDT)
            If dvBrand.Count > 0 Then
                dvBrand.RowFilter = "BrandName <> ''"
                dvBrand.Sort = "BrandName ASC"
                dtBrand = dvBrand.ToTable(True, "BrandName", "Brand")
            End If
            Return dtBrand
        Catch
            Return dtBrand
        End Try
    End Function


#End Region
#Region "Page Load"
    ''' <summary>
    ''' Handle page_load event
    ''' </summary>
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            lblRes.Visible = False
            If Not Page.IsPostBack Then
                OriginalURL = Request.Url.AbsoluteUri
                CheckPageIsValid()
                FillLeftSide()
                FillItems(sender, New EventArgs)

            End If

        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    ''' <summary>
    ''' Check URL On Page Load to check page is valid or not.
    ''' </summary>
    Sub CheckPageIsValid()
        Try

            If OriginalURL.Contains("/") Then
                Dim ItemsUrl As String = OriginalURL.ToLower.Split("/").Last
                If ItemsUrl <> String.Empty Then
                    Select Case ItemsUrl.ToLower
                        Case "items", "items.aspx"
                            Return
                        Case Else
                            If Not ItemsUrl.Contains("category=") AndAlso Not ItemsUrl.Contains("subcategory=") AndAlso Not ItemsUrl.Contains("brand=") AndAlso Not ItemsUrl.Contains("search") AndAlso Not ItemsUrl.Contains("page=") AndAlso Not ItemsUrl.Contains("sort=") Then
                                Response.Redirect(PageNotFoundURL, False)
                                Return
                            End If
                    End Select
                End If
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    ''' <summary>
    ''' Check URL On Page Load depending on URL parameters
    ''' </summary>
    Function CheckURL(ByVal FilterType As String, ByRef chk As CheckBox, ByRef lblCode As Label) As Boolean
        Dim count As Integer = 0
        FilterType = FilterType.ToLower
        OriginalURL = OriginalURL.ToLower
        Dim FilterValue As String = chk.Text.ToLower 'String.Empty
        Try
            'Select Case FilterType
            '    Case "" '"subcategory" , "area", "model"
            '        FilterValue = lblCode.Text.ToLower
            '    Case Else
            '        FilterValue = chk.Text.ToLower
            'End Select
            If OriginalURL.Contains(FilterType) Then
                Dim FilterURL As String = OriginalURL.Split(New String() {"" & FilterType & "="}, StringSplitOptions.None)(1)
                If FilterURL.Contains("/") Then
                    FilterURL = FilterURL.Split("/")(0)
                    Dim words As String() = FilterURL.Split(New Char() {"!"c})
                    Dim word As String
                    For Each word In words
                        If FilterValue = Server.UrlDecode(word).Replace("-", " ") Then
                            chk.Checked = True
                            count += 1
                        End If
                    Next

                Else
                    Dim words As String() = FilterURL.Split(New Char() {"!"c})
                    Dim word As String
                    For Each word In words
                        If FilterValue = Server.UrlDecode(word).Replace("-", " ") Then
                            chk.Checked = True
                            count += 1
                        End If
                    Next
                End If

            Else
                count += 1
            End If
            If count > 0 Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            Return False
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Function


#End Region
#Region "Fill Left Side Search"
    Sub FillLeftSide()
        Try
            FillCategories()
            FillSubCategories()
            FillBrands()
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    ''' <summary>
    ''' Fill Categories
    ''' </summary>
    Sub FillCategories()
        Try
            Dim dtCat As DataTable = GetCategories()
            lvCategories.DataSource = dtCat
            lvCategories.DataBind()
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    ''' <summary>
    ''' Fill SubCategories
    ''' </summary>
    Sub FillSubCategories()
        Try
            Dim dtSubCat As DataTable = GetSubCategories()
            lvSubCategory.DataSource = dtSubCat
            lvSubCategory.DataBind()
            SetCheckedSubCats(lvSubCategory)
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

    ''' <summary>
    ''' Fill Brand
    ''' </summary>
    Sub FillBrands()
        Try
            Dim dtBrand As DataTable = GetBrands()
            lvBrand.DataSource = dtBrand
            lvBrand.DataBind()
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub


    Sub SetCheckedSubCats(ByVal lvSubCategory As ListView)
        Try
            Dim SubCats As String = lblSubCategories.Text
            For Each dr As ListViewItem In lvSubCategory.Items
                Dim chkSubCategory As CheckBox = DirectCast(dr.FindControl("chkSubCategory"), CheckBox)
                Dim SubCategory As String = DirectCast(dr.FindControl("lblSubCategory"), Label).Text
                If SubCats.Contains(SubCategory) Then
                    chkSubCategory.Checked = True
                Else
                    chkSubCategory.Checked = False
                End If
            Next
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub


#End Region
#Region "Fill Items"
    ''' <summary>
    ''' Fill Sub Categories and Fill Items
    ''' </summary>
    Sub CheckCategory(sender As Object, e As EventArgs)
        Try
            FillSubCategories()
            FillItems(sender, New EventArgs)
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    ''' <summary>
    ''' Fill Sub Categories and Fill Items
    ''' </summary>
    Sub CheckBrand(sender As Object, e As EventArgs)
        Try
            FillItems(sender, New EventArgs)
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub

    ''' <summary>
    ''' Fill Items
    ''' </summary>
    Sub FillItems(sender As Object, e As EventArgs)
        Try
            Dim actionType As String = sender.id
            lblCheckedControl.Text = actionType
            'Dim dvListItems As New DataView(GetCompactItemsDT)
            Dim dvListItems As New DataView(GetItemsDT) '.AsEnumerable().Take(20).CopyToDataTable()

            dvListItems.RowFilter = "" & FilterItemsDv(sender, e) & ""

            ' dvListItems.Sort = "" + FilterByBestMatch(0) + ""
            'If dvListItems.Count = 0 Then
            '    dvListItems = New DataView(GetItemsDT)

            '    dvListItems.RowFilter = "" & FilterItemsDv() & ""
            'End If

            Dim dtListItems As DataTable = dvListItems.ToTable()
            BindPager(actionType)
            'lvItems.DataSource = dtListItems
            'lvItems.DataBind()



            'If dtListItems.Rows.Count > 0 Then
            '    Pager.Visible = True
            'Else
            '    Pager.Visible = False
            'End If
            If OriginalURL = String.Empty Then
                FillItemsURL()
            End If


        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub


    ''' <summary>
    ''' Bind Pager Depending on URL Or Checked(category,sub category,.....)
    ''' </summary>
    Sub BindPager(ByVal actionType As String)
        Try
            'If actionType <> "lvItems" Then
            '    lblPage.Text = String.Empty
            'End If
            'If FilterByPage(0) <> String.Empty Then
            '    Dim PStartIndex As Double = CDbl(CInt(lblPage.Text) - 1) * Pager.PageSize
            '    Pager.SetPageProperties(PStartIndex, Pager.PageSize, False)
            'Else
            '    Pager.SetPageProperties(0, Pager.PageSize, False)
            'End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    ''' <summary>
    ''' Set URL depend on Left Side search
    ''' </summary>
    Sub FillItemsURL()
        Try
            If FilterItemsURL() <> String.Empty Then
                ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "MyAction", "ChangeUrl('Items','" & PublicFunctions.ServerURL & FilterItemsURL() & "');", True)
            Else
                ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "MyAction", "ChangeUrl('Items','/Items');", True)
            End If
        Catch ex As Exception
            clsMessages.ShowMessage(lblRes, clsMessages.MessageTypesEnum.ERR, Page, ex)
        End Try
    End Sub
    ''' <summary>
    ''' Filter Items depend on Left Side search
    ''' </summary>
    Function FilterItemsDv(sender As Object, e As EventArgs) As String
        Try
            Dim filter As String = FilterByCategory()(0) & " and " & FilterBySubCategory(0) &
                " and " & FilterByBrand(0) & "  and " & FilterBySearch(0)

            Return filter
        Catch ex As Exception
            Return "1=1"
        End Try
    End Function
    ''' <summary>
    ''' Filter Items URL depend on Left Side search
    ''' </summary>
    Function FilterItemsURL() As String
        Dim Result As String = ""
        Try

            If FilterByCategory(1) <> "" Then
                If Result = "" Then
                    Result = FilterByCategory(1)
                Else
                    Result += "/" & FilterByCategory(1)
                End If
            End If
            If FilterBySubCategory(1) <> "" Then
                If Result = "" Then
                    Result = FilterBySubCategory(1)
                Else
                    Result += "/" & FilterBySubCategory(1)
                End If
            End If
            If FilterByBrand(1) <> "" Then
                If Result = "" Then
                    Result = FilterByBrand(1)
                Else
                    Result += "/" & FilterByBrand(1)
                End If
            End If

            'If FilterBySearch(1) <> "" Then
            '    If Result = "" Then
            '        Result = FilterBySearch(1)
            '    Else
            '        Result += "/" & FilterBySearch(1)
            '    End If
            'End If
            If FilterByPage(1) <> "" Then
                If Result = "" Then
                    Result = FilterByPage(1)
                Else
                    Result += "/" & FilterByPage(1)
                End If
            End If
            'If FilterByBestMatch(1) <> "" Then
            '    If Result = "" Then
            '        Result = FilterByBestMatch(1)
            '    Else
            '        Result += "/" + FilterByBestMatch(1)
            '    End If
            'End If
            Return Result

        Catch ex As Exception
            Return "1=1"
        End Try
    End Function

    ''' <summary>
    ''' Filter by Best Match
    ''' </summary>
    Function FilterByBestMatch() As String()
        Dim SortingStr As String = ""
        Dim SortingURL As String = ""
        Dim SortingArr As New List(Of String)
        Try
            'If OriginalURL.Contains("sort") Then
            '    Dim FilterURL As String = OriginalURL.Split(New String() {"sort="}, StringSplitOptions.None)(1)
            '    If FilterURL.Contains("/") Then
            '        FilterURL = FilterURL.Split("/")(0)
            '    End If
            '    'lbBestMatch.Text = FilterURL.Replace("-", " ") '+ "<span class='caret'>"
            '    lblSortExperssion.Text = FilterURL.Replace("-", " ")
            '    If ddlSort.Items.FindByValue(lblSortExperssion.Text) IsNot Nothing Then
            '        ddlSort.SelectedValue = lblSortExperssion.Text
            '    End If

            'End If
            'If lblSortExperssion.Text <> String.Empty Then
            '    'Dim sort As String = ddlSort.SelectedValue.ToLower
            '    'Select Case sort.ToLower
            '    '    Case "newest"
            '    '        sort = " ModifiedDate Desc"
            '    '    Case "oldest"
            '    '        sort = " ModifiedDate ASC"
            '    'End Select

            '    Select Case lblSortExperssion.Text.ToLower
            '        Case "newest to oldest"
            '            'Dim dvListItems As New DataView(dtItems)
            '            'Dim MaxPrice As Double = CDbl(dvListItems.ToTable().Compute("Max(CreditPrice)", String.Empty))
            '            'Dim MinPrice As Double = CDbl(dvListItems.ToTable().Compute("Min(CreditPrice)", String.Empty))
            '            SortingStr = "ModifiedDate DESC"
            '            SortingURL = "Newest to Oldest"
            '        Case "oldest to newest"
            '            SortingStr = "ModifiedDate ASC"
            '            SortingURL = "Oldest to Newest"
            '            'Case "Top Rated"
            '            '    SortingStr = "Rating DESC"
            '            '    SortingURL = "Top Rated"
            '        Case "best match"
            '            SortingStr = "ViewCount DESC"
            '            SortingURL = "Best Match"

            '    End Select
            '    SortingArr.Add(SortingStr)
            '    SortingArr.Add("Sort=" + SortingURL.Replace(" ", "-") + "")
            '    Return SortingArr.ToArray

            'End If

        Catch ex As Exception
            SortingArr.Add("ModifiedDate DESC")
            SortingArr.Add("")
            Return SortingArr.ToArray
        End Try
    End Function
#End Region
#Region "Filter Items"

    ''' <summary>
    ''' Filter by Categories
    ''' </summary>
    Function FilterByCategory() As String()
        Dim CatStr As String = ""
        Dim CatURL As String = ""
        Dim Categories As New List(Of String)
        Dim Count As Integer = 0
        Try
            For Each dr As ListViewItem In lvCategories.Items
                Dim chkCategory As CheckBox = DirectCast(dr.FindControl("chkCategory"), CheckBox)
                Dim lblCategory As Label = DirectCast(dr.FindControl("lblCategory"), Label)
                If CheckURL("Category", chkCategory, lblCategory) Then
                    Count += 1
                End If
                If chkCategory.Checked Then
                    If CatStr = String.Empty Then
                        CatStr = lblCategory.Text
                        CatURL = chkCategory.Text
                    Else
                        CatStr += "," & lblCategory.Text
                        CatURL += "!" & chkCategory.Text
                    End If
                End If

            Next

            If CatStr <> String.Empty Then
                Categories.Add("Category In (" & CatStr & ")")
                Categories.Add("Category=" & CatURL.Replace(" ", "-") & "")
                If lblCheckedControl.Text = "chkCategory" Or lblCheckedControl.Text.ToLower.Contains("page") Then
                    OrderCheckedCategory(CatStr)
                End If

                Return Categories.ToArray
            Else
                If Count > 0 Then
                    Categories.Add("1=1")
                    Categories.Add("")
                    Return Categories.ToArray
                Else
                    Categories.Add("1<>1")
                    Categories.Add("")
                    Return Categories.ToArray
                End If
            End If
        Catch ex As Exception
            Categories.Add("")
            Categories.Add("")
            Return Categories.ToArray
        End Try
    End Function
    Sub OrderCheckedCategory(ByVal CatStr As String)
        Try
            'Reorder Items in Datasource
            'Bind LvCats

            Dim dtCats As DataTable = GetCategories()

            ' create array of Cats
            Dim CatArray As String() = CatStr.Split(",")

            'swap Cats values and ids at datatable ordered by selected
            For i As Integer = 0 To CatArray.Length - 1
                Dim checkedCat As String = CatArray(i)
                'Find it in DT
                Dim Checkedindex As Integer = PublicFunctions.FindIndex(dtCats, checkedCat, "Category")
                Dim CurrentIndex As Integer = i

                Dim CatId As String = dtCats.Rows(i).Item("Category")
                Dim Cat As String = dtCats.Rows(i).Item("Categoryname")

                Dim SelectedCatID As String = dtCats.Rows(Checkedindex).Item("Category")
                Dim SelectedCat As String = dtCats.Rows(Checkedindex).Item("Categoryname")
                'Move Item in i Position to CheckedCat position
                dtCats.Rows(i).Item("Category") = SelectedCatID
                dtCats.Rows(i).Item("Categoryname") = SelectedCat

                'Move item in CheckedCat to i position
                dtCats.Rows(Checkedindex).Item("Category") = CatId
                dtCats.Rows(Checkedindex).Item("Categoryname") = Cat
            Next
            lvCategories.DataSource = dtCats
            lvCategories.DataBind()
            ' set checked after bind
            For Each item As ListViewItem In lvCategories.Items
                Dim lblCat As Label = DirectCast(item.FindControl("lblCategory"), Label)
                Dim chkCat As CheckBox = DirectCast(item.FindControl("chkCategory"), CheckBox)
                For i As Integer = 0 To CatArray.Length - 1
                    If lblCat.Text = CatArray(i) Then
                        chkCat.Checked = True
                    End If
                Next
            Next
        Catch ex As Exception
            clsMessages.ShowErrorMessgage(lblRes, "Error: " & ex.ToString, Me.Page)
        End Try
    End Sub
    ''' <summary>
    ''' Filter by SubCategories
    ''' </summary>
    Function FilterBySubCategory() As String()
        Dim SubCatStr As String = ""
        Dim SubCatURL As String = ""
        Dim SubCategories As New List(Of String)
        Dim Count As Integer = 0
        Try
            For Each dr As ListViewItem In lvSubCategory.Items
                Dim chkSubCategory As CheckBox = DirectCast(dr.FindControl("chkSubCategory"), CheckBox)
                Dim lblSubCategory As Label = DirectCast(dr.FindControl("lblSubCategory"), Label)
                'Dim lblCatSubCategory As Label = DirectCast(dr.FindControl("lblCatSubCategory"), Label)
                If CheckURL("SubCategory", chkSubCategory, lblSubCategory) Then
                    Count += 1
                End If
                If chkSubCategory.Checked Then
                    If SubCatStr = String.Empty Then
                        SubCatStr = lblSubCategory.Text
                        SubCatURL = chkSubCategory.Text
                    Else
                        SubCatStr += "," & lblSubCategory.Text
                        SubCatURL += "!" & chkSubCategory.Text
                    End If
                End If
            Next
            If SubCatStr <> String.Empty Then
                lblSubCategories.Text = SubCatStr
                SubCategories.Add("SubCategory In (" & SubCatStr & ")")
                SubCategories.Add("SubCategory=" & SubCatURL.Replace(" ", "-") & "")
                If lblCheckedControl.Text = "chkSubCategory" Or lblCheckedControl.Text.ToLower.Contains("page") Then
                    OrderCheckedSubCategory(SubCatStr)
                End If

                Return SubCategories.ToArray
            Else
                lblSubCategories.Text = String.Empty
                SubCategories.Add("1=1")
                SubCategories.Add("")
                Return SubCategories.ToArray
            End If
        Catch ex As Exception
            SubCategories.Add("1=1")
            SubCategories.Add("")
            Return SubCategories.ToArray
        End Try
    End Function
    Sub OrderCheckedSubCategory(ByVal SubCatStr As String)
        Try
            'Reorder Items in Datasource
            'Bind LvSubCats

            Dim dtSubCats As DataTable = GetSubCategories()

            ' create array of SubCats
            Dim SubCatArray As String() = SubCatStr.Split(",")

            'swap SubCats values and ids at datatable ordered by selected
            For i As Integer = 0 To SubCatArray.Length - 1
                Dim checkedSubCat As String = SubCatArray(i)
                'Find it in DT
                Dim Checkedindex As Integer = PublicFunctions.FindIndex(dtSubCats, checkedSubCat, "SubCategory")
                Dim CurrentIndex As Integer = i

                Dim SubCatId As String = dtSubCats.Rows(i).Item("SubCategory")
                Dim SubCat As String = dtSubCats.Rows(i).Item("SubCategoryname")

                Dim SelectedSubCatID As String = dtSubCats.Rows(Checkedindex).Item("SubCategory")
                Dim SelectedSubCat As String = dtSubCats.Rows(Checkedindex).Item("SubCategoryname")
                'Move Item in i Position to CheckedSubCat position
                dtSubCats.Rows(i).Item("SubCategory") = SelectedSubCatID
                dtSubCats.Rows(i).Item("SubCategoryname") = SelectedSubCat

                'Move item in CheckedSubCat to i position
                dtSubCats.Rows(Checkedindex).Item("SubCategory") = SubCatId
                dtSubCats.Rows(Checkedindex).Item("SubCategoryname") = SubCat
            Next
            lvSubCategory.DataSource = dtSubCats
            lvSubCategory.DataBind()
            ' set checked after bind
            For Each item As ListViewItem In lvSubCategory.Items
                Dim lblSubCat As Label = DirectCast(item.FindControl("lblSubCategory"), Label)
                Dim chkSubCat As CheckBox = DirectCast(item.FindControl("chkSubCategory"), CheckBox)
                For i As Integer = 0 To SubCatArray.Length - 1
                    If lblSubCat.Text = SubCatArray(i) Then
                        chkSubCat.Checked = True
                    End If
                Next
            Next
        Catch ex As Exception
            clsMessages.ShowErrorMessgage(lblRes, "Error: " & ex.ToString, Me.Page)
        End Try
    End Sub

    ''' <summary>
    ''' Filter by Brand
    ''' </summary>
    Function FilterByBrand() As String()
        Dim BrandStr As String = ""
        Dim BrandURL As String = ""
        Dim Brands As New List(Of String)
        Dim Count As Integer = 0
        Try
            For Each dr As ListViewItem In lvBrand.Items
                Dim chkBrand As CheckBox = DirectCast(dr.FindControl("chkBrand"), CheckBox)
                Dim lblBrand As Label = DirectCast(dr.FindControl("lblBrand"), Label)
                If CheckURL("Brand", chkBrand, lblBrand) Then
                    Count += 1
                End If
                If chkBrand.Checked Then
                    If BrandStr = String.Empty Then
                        BrandStr = lblBrand.Text
                        BrandURL = chkBrand.Text
                    Else
                        BrandStr += "," & lblBrand.Text
                        BrandURL += "!" & chkBrand.Text
                    End If
                End If
            Next
            'If pnlModel.Visible = False Then
            '    FillModels()
            'End If
            If BrandStr <> String.Empty Then
                Brands.Add("Brand In (" & BrandStr & ")")
                Brands.Add("Brand=" & BrandURL.Replace(" ", "-") & "")
                If lblCheckedControl.Text = "chkBrand" Or lblCheckedControl.Text.ToLower.Contains("page") Then
                    OrderCheckedBrands(BrandStr)
                End If

                Return Brands.ToArray
            Else
                Brands.Add("1=1")
                Brands.Add("")
                Return Brands.ToArray

            End If
        Catch ex As Exception
            Brands.Add("")
            Brands.Add("")
            Return Brands.ToArray
        End Try
    End Function
    Sub OrderCheckedBrands(ByVal BrandStr As String)
        Try
            'Reorder Items in Datasource
            'Bind LvBrands

            Dim dtBrands As DataTable = GetBrands()

            ' create array of brands
            Dim BrandArray As String() = BrandStr.Split(",")

            'swap brands values and ids at datatable ordered by selected
            For i As Integer = 0 To BrandArray.Length - 1
                Dim checkedBrand As String = BrandArray(i)
                'Find it in DT
                Dim Checkedindex As Integer = PublicFunctions.FindIndex(dtBrands, checkedBrand, "Brand")
                Dim CurrentIndex As Integer = i

                Dim BrandId As String = dtBrands.Rows(i).Item("Brand")
                Dim Brand As String = dtBrands.Rows(i).Item("Brandname")

                Dim SelectedBrandID As String = dtBrands.Rows(Checkedindex).Item("Brand")
                Dim SelectedBrand As String = dtBrands.Rows(Checkedindex).Item("Brandname")
                'Move Item in i Position to CheckedBrand position
                dtBrands.Rows(i).Item("brand") = SelectedBrandID
                dtBrands.Rows(i).Item("brandname") = SelectedBrand

                'Move item in CheckedBrand to i position
                dtBrands.Rows(Checkedindex).Item("brand") = BrandId
                dtBrands.Rows(Checkedindex).Item("brandname") = Brand
            Next
            lvBrand.DataSource = dtBrands
            lvBrand.DataBind()
            ' set checked after bind
            For Each item As ListViewItem In lvBrand.Items
                Dim lblBrand As Label = DirectCast(item.FindControl("lblBrand"), Label)
                Dim chkBrand As CheckBox = DirectCast(item.FindControl("chkBrand"), CheckBox)
                For i As Integer = 0 To BrandArray.Length - 1
                    If lblBrand.Text = BrandArray(i) Then
                        chkBrand.Checked = True
                    End If
                Next
            Next
        Catch ex As Exception
            clsMessages.ShowErrorMessgage(lblRes, "Error: " & ex.ToString, Me.Page)
        End Try
    End Sub

    ''' <summary>
    ''' Filter by Search
    ''' </summary>
    Function FilterBySearch() As String()
        Dim SearchStr As String = ""
        Dim SearchURL As String = ""
        Dim SearchArr As New List(Of String)
        Dim FilterURL As String = lblSearch.Text
        Dim SearchType As String = lblSearchType.Text
        Try
            If OriginalURL.ToLower.Contains("search") Then
                SearchType = OriginalURL.ToLower.Split(New String() {"search"}, StringSplitOptions.None)(1).Split("=")(0)
                FilterURL = OriginalURL.ToLower.Split(New String() {"search" & SearchType & "="}, StringSplitOptions.None)(1)
                FilterURL = Server.UrlDecode(FilterURL)
                If FilterURL.Contains("/") Then
                    FilterURL = FilterURL.Split("/")(0)
                End If
                lblSearch.Text = FilterURL.Replace("-", " ")
                lblSearchType.Text = SearchType
                If lblSearch.Text <> String.Empty Then
                    SearchStr = " (Name like '%" & FilterURL.Replace("-", " ") & "%' Or SKU like '%" & FilterURL & "%'  Or CategoryName like '%" & FilterURL.Replace("-", " ") & "%'  Or SubCategoryName like '%" & FilterURL.Replace("-", " ") & "%') "
                    SearchURL = "Search=" & FilterURL
                    SearchArr.Add(SearchStr)
                    SearchArr.Add(SearchURL.Replace(" ", "-"))
                    Return SearchArr.ToArray
                Else
                    SearchArr.Add("1=1")
                    SearchArr.Add("")
                    Return SearchArr.ToArray
                End If
            Else
                SearchArr.Add("1=1")
                SearchArr.Add("")
                Return SearchArr.ToArray
            End If
        Catch ex As Exception
            SearchArr.Add("1=1")
            SearchArr.Add("")
            Return SearchArr.ToArray
        End Try
    End Function
    ''' <summary>
    ''' Filter by Page
    ''' </summary>
    Function FilterByPage() As String()
        Dim PageArr As New List(Of String)
        Try
            If OriginalURL.ToLower.Contains("page") Then
                Dim FilterURL As String = OriginalURL.ToLower.Split(New String() {"page="}, StringSplitOptions.None)(1)
                If FilterURL.Contains("/") Then
                    FilterURL = FilterURL.Split("/")(0)
                End If
                lblPage.Text = FilterURL
            End If
            If lblPage.Text <> String.Empty Then
                PageArr.Add(lblPage.Text)
                PageArr.Add("Page=" + lblPage.Text + "")
                Return PageArr.ToArray
            Else
                PageArr.Add("")
                PageArr.Add("")
                Return PageArr.ToArray
            End If

        Catch ex As Exception
            PageArr.Add("")
            PageArr.Add("")
            Return PageArr.ToArray
        End Try
    End Function
#End Region
End Class
