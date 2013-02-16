<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">





    
    <!-- Showcase start -->
<link rel="stylesheet" type="text/css" href="CSS/Showcase/fullwidth.css" />
<link rel="stylesheet" type="text/css" href="CSS/Showcase/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="CSS/Showcase/settings.css" />





<script src=" Scripts/Showcase/froogaloop2.min.js"></script>

    <script src=" Scripts/Showcase/jquery.min.js"></script>

    <script type="text/javascript" src=" Scripts/Showcase/jquery-ui.min.js"></script>

    <script type="text/javascript" src=" jquery.youtubepopup.min.js"></script>

    <link type="text/css" href=" jquery-ui.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width">
    <link href="http://alteil.apphb.com/Content/css?v=O5nXjVq0POKEq9xiLqHONVLaP8WyxPCP-qSMVabL2M41"
        rel="stylesheet">

    <script src=" modernizr"></script>

    <link rel="icon" type="image/png" href="http://alteil.apphb.com/Views/Shared/images/sitelogo.png">

    <script src=" Scripts/Showcase/kendo.web.min.js"></script>

    <script src=" Scripts/Showcase/kendo.menu.min.js"></script>

    <link href="http://alteil.apphb.com/Content/Kendo/2012.3.1114/kendo.common.min.css"
        rel="stylesheet">
    <link href="http://alteil.apphb.com/Content/Kendo/2012.3.1114/kendo.black.min.css"
        rel="stylesheet">
    <!-- commented, remove this line to use IE & iOS favicons -->
    <link rel="shortcut icon" href="http://alteil.apphb.com/Views/Shared/images/favicon.ico">
    <!-- REVOLUTION BANNER CSS SETTINGS -->
    <link rel="stylesheet" type="text/css" href=" fullwidth.css" media="screen">
    <link rel="stylesheet" type="text/css" href=" settings.css" media="screen">
    <!-- jQuery KenBurn Slider  -->

    <script type="text/javascript" src=" Scripts/Showcase/jquery.themepunch.plugins.min.js"></script>

    <script type="text/javascript" src=" Scripts/Showcase/jquery.themepunch.revolution.min.js"></script>

    <link href=" css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src=" Scripts/Showcase/l.js"></script>

    <script type="text/javascript" src=" Scripts/Showcase/fs.js"></script>

    <script src=" Scripts/Showcase/w.js" type="text/javascript"></script>

      <!-- Showcase end -->


       <script type="text/javascript">



           var tpj = jQuery;

           tpj(document).ready(function () {

               jQuery("#myMenu").kendoMenu();
               if (tpj.fn.cssOriginal != undefined)
                   tpj.fn.css = tpj.fn.cssOriginal;

               tpj('.fullwidthbanner').revolution(
                {
                    delay: 9000,
                    startwidth: 960,
                    startheight: 500,

                    onHoverStop: "on", 					// Stop Banner Timet at Hover on Slide on/off

                    thumbWidth: 100, 						// Thumb With and Height and Amount (only if navigation Tyope set to thumb !)
                    thumbHeight: 50,
                    thumbAmount: 3,

                    hideThumbs: 0,
                    navigationType: "none", 				//bullet, thumb, none, both	 (No Shadow in Fullwidth Version !)
                    navigationArrows: "verticalcentered", 	//nexttobullets, verticalcentered, none
                    navigationStyle: "round", 			//round,square,navbar

                    touchenabled: "on", 					// Enable Swipe Function : on/off

                    navOffsetHorizontal: 0,
                    navOffsetVertical: 20,

                    stopAtSlide: -1, 						// Stop Timer if Slide "x" has been Reached. If stopAfterLoops set to 0, then it stops already in the first Loop at slide X which defined. -1 means do not stop at any slide. stopAfterLoops has no sinn in this case.
                    stopAfterLoops: -1, 					// Stop Timer if All slides has been played "x" times. IT will stop at THe slide which is defined via stopAtSlide:x, if set to -1 slide never stop automatic

                    hideCaptionAtLimit: 0, 				// It Defines if a caption should be shown under a Screen Resolution ( Basod on The Width of Browser)
                    hideAllCaptionAtLilmit: 0, 			// Hide all The Captions if Width of Browser is less then this value
                    hideSliderAtLimit: 0, 				// Hide the whole slider, and stop also functions if Width of Browser is less than this value


                    fullWidth: "on",

                    shadow: 0								//0 = no Shadow, 1,2,3 = 3 Different Art of Shadows -  (No Shadow in Fullwidth Version !)

                });



               jQuery("a.youtube").YouTubePopup();

           });
    </script>

    <script>
        $(document).ready(function () {

            jQuery("#myMenu").kendoMenu();
        });
    </script>
</asp:Content>

