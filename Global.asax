<%@ Application Language="VB" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
        System.Web.Routing.RouteTable.Routes.Ignore("c-panel/ScriptResource.axd")
        System.Web.Routing.RouteTable.Routes.Ignore("c-panel/ScriptResource.axd/{*pathInfo}")
        System.Web.Routing.RouteTable.Routes.Ignore("c-panel/{resource}.axd/{*pathInfo}")
        System.Web.Routing.RouteTable.Routes.Ignore("c-panel/{css}.css/{*pathInfo}")
        System.Web.Routing.RouteTable.Routes.Ignore("c-panel/{styles}.css/{*pathInfo}")

        System.Web.Routing.RouteTable.Routes.Ignore("ScriptResource.axd")
        System.Web.Routing.RouteTable.Routes.Ignore("ScriptResource.axd/{*pathInfo}")
        System.Web.Routing.RouteTable.Routes.Ignore("{resource}.axd/{*pathInfo}")
        System.Web.Routing.RouteTable.Routes.Ignore("{css}.css/{*pathInfo}")
        System.Web.Routing.RouteTable.Routes.Ignore("{styles}.css/{*pathInfo}")

        System.Web.Routing.RouteTable.Routes.MapPageRoute("Home", "Home", "~/Home.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("About", "About", "~/About.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Favorites", "Favorites", "~/Favorites.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Contact", "Contact", "~/Contact.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Login", "Login", "~/Login.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("SignIn", "SignIn", "~/SignIn.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("EmailConfirmation", "EmailConfirmation", "~/EmailConfirmation.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Register", "Register", "~/SignIn.aspx?qid=1")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("MyItems", "MyItems", "~/MyItems.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Account", "Account", "~/Account.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Chat", "Chat", "~/Messages.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Brands", "Brands", "~/Brands.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("BrowsingHistory", "BrowsingHistory", "~/BrowsingHistory.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("ReturnPolicy", "ReturnPolicy", "~/ReturnPolicy.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("DeliveryPolicy", "DeliveryPolicy", "~/DeliveryPolicy.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("PrivacyPolicy", "PrivacyPolicy", "~/PrivacyPolicy.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("TermsConditions", "TermsConditions", "~/TermsConditions.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("PrivacyPolicyAR", "PrivacyPolicyAR", "~/PrivacyPolicyAR.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("TermsConditionsAR", "TermsConditionsAR", "~/TermsConditionsAR.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("ComingSoon", "ComingSoon", "~/ComingSoon.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("PageNotFound", "PageNotFound", "~/PageNotFound.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("UserAds", "User/{UserAdsId}", "~/UserAds.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Items-Details", "Item/{Id}", "~/Item_Details.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Items-DetailsView", "ItemView/{SKU}", "~/ItemQuick.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Categories", "Categories", "~/Categories.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Items0", "{Parameter1}/{Parameter2}/{Parameter3}/{Parameter4}/{Parameter5}/{Parameter6}/{Parameter7}/{Parameter8}/{Parameter9}/{Parameter10}", "~/Items.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Items1", "{Parameter1}/{Parameter2}/{Parameter3}/{Parameter4}/{Parameter5}/{Parameter6}/{Parameter7}/{Parameter8}/{Parameter9}", "~/Items.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Items2", "{Parameter1}/{Parameter2}/{Parameter3}/{Parameter4}/{Parameter5}/{Parameter6}/{Parameter7}/{Parameter8}", "~/Items.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Items3", "{Parameter1}/{Parameter2}/{Parameter3}/{Parameter4}/{Parameter5}/{Parameter6}/{Parameter7}", "~/Items.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Items4", "{Parameter1}/{Parameter2}/{Parameter3}/{Parameter4}/{Parameter5}/{Parameter6}", "~/Items.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Items5", "{Parameter1}/{Parameter2}/{Parameter3}/{Parameter4}/{Parameter5}", "~/Items.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Items6", "{Parameter1}/{Parameter2}/{Parameter3}/{Parameter4}", "~/Items.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Items7", "{Parameter1}/{Parameter2}/{Parameter3}", "~/Items.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Items8", "{Parameter1}/{Parameter2}", "~/Items.aspx")
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Items9", "{Parameter1}", "~/Items.aspx")


    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub

</script>