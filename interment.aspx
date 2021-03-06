﻿<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>DMP - Interments</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- font awesome CSS
		============================================ -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.css">
    <link rel="stylesheet" href="css/owl.transitions.css">
    <!-- meanmenu CSS
		============================================ -->
    <link rel="stylesheet" href="css/meanmenu/meanmenu.min.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="css/normalize.css">
	<!-- wave CSS
		============================================ -->
    <link rel="stylesheet" href="css/wave/waves.min.css">
    <link rel="stylesheet" href="css/wave/button.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- Notika icon CSS
		============================================ -->
    <link rel="stylesheet" href="css/notika-custom-icon.css">
    <!-- Data Table JS
		============================================ -->
    <link rel="stylesheet" href="css/jquery.dataTables.min.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="css/main.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>

  

</head>
<body>
    <div class="header-top-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                     <a href="index.aspx">
                        <div class="logo-area">
                            <%--<a href="#"><img src="img/logo/dmp_logo.jpg" alt="" /></a>--%>
                            <h2><span>Davao Memorial Park</span></h2>
                        </div>
                    </a>
                </div>
               <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                    <div class="header-top-menu">
                        <ul class="nav navbar-nav notika-top-nav">                            
                            <li class="nav-item nc-al"><a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><span><i class="notika-icon notika-support"></i> Account</span></a>
                                <div role="menu" class="dropdown-menu message-dd notification-dd animated zoomIn">                                    
                                    <div class="hd-message-info">   
                                        <a href="login.aspx">
                                            <div class="hd-message-sn">
                                                <div class="hd-mg-ctn">
                                                    <p>Change User</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="home.aspx">
                                            <div class="hd-message-sn">                                                
                                                <div class="hd-mg-ctn">
                                                    <p>Log Out</p>
                                                </div>
                                            </div>
                                        </a>                                        
                                    </div>
                                </div>
                            </li>                                                      
                        </ul>
                    </div>
                </div>
               
            </div>
        </div>
    </div>
    <div class="mobile-menu-area">
      <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <ul class="nav nav-tabs notika-menu-wrap menu-it-icon-pro">
                        <li><a href="clients.aspx"><i class="notika-icon notika-picture"></i> Deceased</a>
                        </li>
                        <%--<li><a href="map.aspx"><i class="notika-icon notika-map"></i> Map</a>
                        </li>--%>
                        <li><a href="interment.aspx"><i class="notika-icon notika-cloud"></i> Interment</a>
                        </li>                        
                        <li><a href="events.aspx"><i class="notika-icon notika-file"></i> Events</a>
                        </li>
                        <li><a href="announcements.aspx"><i class="notika-icon notika-alarm"></i> Announcement</a>
                        </li>                     
                        <li><a href="inquiries.aspx"><i class="notika-icon notika-mail"></i> Inquiries</a>
                        </li>                
                    </ul>                    
                </div>
            </div>
        </div>
    </div>
    <!-- Mobile Menu end -->
    <!-- Main Menu area start-->
    <div class="main-menu-area mg-tb-10">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <ul class="nav nav-tabs notika-menu-wrap menu-it-icon-pro">
                        <li><a href="clients.aspx"><i class="notika-icon notika-picture"></i> Deceased</a>
                        </li>
                        <%--<li><a href="map.aspx"><i class="notika-icon notika-map"></i> Map</a>
                        </li>--%>
                        <li><a href="interment.aspx"><i class="notika-icon notika-cloud"></i> Interment</a>
                        </li>                        
                        <li><a href="events.aspx"><i class="notika-icon notika-file"></i> Events</a>
                        </li>
                        <li><a href="announcements.aspx"><i class="notika-icon notika-alarm"></i> Announcement</a>
                        </li>                     
                        <li><a href="inquiries.aspx"><i class="notika-icon notika-add-todo"></i> Inquiries</a>
                        </li>                
                    </ul>                    
                </div>
            </div>
        </div>
    </div>
    
	<div class="container">
        <div class="widget-tabs-list tab-pt-mg">
            <ul class="nav nav-tabs tab-nav-center">
                <li class="active"><a data-toggle="tab" href="#tab1">Interment</a></li>
                <li><a data-toggle="tab" href="#tab2">Crematory</a></li>
            </ul>
        </div>
         <div class="tab-content tab-custom-st">
              <div id="tab1" class="tab-pane in active">
                    <div class="tab-ctn">
                        <div class="recent-post-ctn" style="">
                            <div class="recent-post-title btn notika-btn-gray btn-reco-mg btn-button-mg pageHeader">
                                <h2>Interment</h2><button id="regNewbtn" class="btn" data-toggle="modal" data-target="#myModalone" style="background-color: white"><i class="notika-icon notika-plus-symbol"></i></button>
                            </div>					
	                    </div>
                         <div class="data-table-area">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="data-table-list">                        
                                            <div class="table-responsive">
                                                <table id="data-table-basic" class="table table-striped">
                                                    <thead>                                   
                                                    </thead>
                                                    <tbody></tbody>                             
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
              </div>
             <div id="tab2" class="tab-pane in">
                  <div class="tab-ctn">
                      <div class="recent-post-ctn" style="">
                        <div class="recent-post-title btn notika-btn-gray btn-reco-mg btn-button-mg pageHeader">
                            <h2>Crematory</h2><button id="cremNewbtn" class="btn" data-toggle="modal" data-target="#myModalone2" style="background-color: white"><i class="notika-icon notika-plus-symbol"></i></button>
                        </div>	
                      </div>
                        <div class="data-table-area">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="data-table-list">                        
                                            <div class="table-responsive">
                                                <table id="data-table-basic2" class="table table-striped">
                                                    <thead>                                   
                                                    </thead>
                                                    <tbody></tbody>                             
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>	                    
                  </div>
             </div>
         </div>        
        <div class="row">
			<div class="col-lg-2 col-md-12 col-sm-12 col-xs-12">
                <div class="modal fade" id="myModalone2" role="dialog">
                    <div class="modal-dialog modals-default">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-example-int form-horizental">
                                    <div class="form-group">
                                         <h4>New Cremation</h4>
                                            <div class="nk-form" style="padding: 8px;">
                                                <div class="input-group">
                                                    <span class="input-group-addon nk-ic-st-pro"><i class="notika-icon notika-support"></i></span>
                                                    <div class="nk-int-st">
                                                        <input id="cname" type="text" class="form-control" placeholder="Enter Deceased Name"/>                                    
                                                    </div>  
                                                </div>
                                                <div class="input-group mg-t-15">
                                                    <span class="input-group-addon nk-ic-st-pro"><i class="notika-icon notika-calendar"></i></span>
                                                    <div class="nk-int-st">
                                                        <%--<input id="upass" type="password" class="form-control" placeholder="Password"/>--%>
                                                        <input id="cdateOfBirth" type="text" class="form-control" placeholder="Enter Date of Birth"/>
                                                    </div>
                                                </div>                         
                                                <div class="input-group mg-t-15">
                                                    <span class="input-group-addon nk-ic-st-pro"><i class="notika-icon notika-cloud"></i></span>
                                                    <div class="nk-int-st">
                                                        <%--<input id="upass" type="password" class="form-control" placeholder="Password"/>--%>
                                                        <input id="clocation" type="text" class="form-control"  placeholder="Enter Location"/>
	                                                    <%--<datalist id="intermentsList"></datalist>--%>
                                                    </div>
                                                </div>
                                                 <div class="input-group mg-t-15">
                                                    <span class="input-group-addon nk-ic-st-pro"><i class="notika-icon notika-calendar"></i></span>
                                                    <div class="nk-int-st">
                                                        <%--<input id="upass" type="password" class="form-control" placeholder="Password"/>--%>
                                                        <input id="cdateOfDeath" type="text" class="form-control" placeholder="Enter Date of Death"/>
                                                    </div>
                                                </div>                                                         
                                                <div class="input-group mg-t-10" style="float:right;">
                                                    <div id="saveNewCremate" class="recent-post-line rct-pt-mg btn notika-btn-gray btn-reco-mg btn-button-mg waves-effect" style="background-color:#4CAF50!important;">
				                                        <span style="color:#fff!important">Save</span>
			                                        </div>                                                 
                                                </div>                                            
                                            </div>                                            
                                    </div>
                                </div>
                            </div>        
                            <div class="modal-footer">                            
                            </div>   
                    </div>
                </div>
			</div>
		    </div>	
        </div>


		<div class="row">
			<div class="col-lg-2 col-md-12 col-sm-12 col-xs-12">                
                <div class="modal fade" id="myModalone" role="dialog">
                   <div class="modal-dialog modals-default">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <h2>New Interment</h2>
                            <div class="form-example-int form-horizental">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                            <label class="hrzn-fm">Area *:</label>
                                        </div>
                                        <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                            <div class="nk-int-st">
                                                <input type="text" id="area" class="form-control input-sm" placeholder="Enter Area Code/No."/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-example-int form-horizental mg-t-15">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <label class="hrzn-fm">Block *:</label>
                                            </div>
                                            <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                                <div class="nk-int-st">
                                                    <input type="text" id="blk" class="form-control input-sm" placeholder="Enter Block No."/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                     <div class="form-example-int form-horizental mg-t-15">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <label class="hrzn-fm">Lot *:</label>
                                            </div>
                                            <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                                <div class="nk-int-st">
                                                    <input type="text" id="lot" class="form-control input-sm" placeholder="Enter Lot No."/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-example-int form-horizental mg-t-15">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <label class="hrzn-fm">Street *:</label>
                                            </div>
                                            <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                                <div class="nk-int-st">
                                                    <input type="text" id="street" class="form-control input-sm" placeholder="Enter Street Name"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-example-int form-horizental mg-t-15">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <label class="hrzn-fm">Latitude *:</label>
                                            </div>
                                            <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                                <div class="nk-int-st">
                                                    <input type="text" id="LAT" class="form-control input-sm" placeholder="Enter Latitude"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-example-int form-horizental mg-t-15">
                                         <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <label class="hrzn-fm">Longitude *:</label>
                                            </div>
                                            <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                                <div class="nk-int-st">
                                                    <input type="text" id="LONG" class="form-control input-sm" placeholder="Enter Longitude"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                                  
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button id="saveInterment" type="button" class="btn btn-default" >Save changes</button>
                            <%--<button id="saveProceedInterment" type="button" class="btn btn-default"  data-toggle="modal" data-target="#myModaloneProceed" >Save and Proceed to Deceased Form</button>--%>
                             <a href="https://bit.ly/2WHP0tF" target="_blank">
                                <p id="saveProceedInterment" class="btn btn-default">Go to Google Map</p>
                            </a>
                        </div>                                
                    </div>
                   </div>
                </div>
                 <div class="modal fade" id="myModaloneProceed" role="dialog">
                    <div class="modal-dialog modals-default">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="nk-block toggled" style="width: 100%;">
                            <h4>New Deceased</h4>
                        <div class="nk-form" style="padding: 8px;">
                            <div class="input-group">
                                <span class="input-group-addon nk-ic-st-pro"><i class="notika-icon notika-support"></i></span>
                                <div class="nk-int-st">
                                    <input id="dname" type="text" class="form-control" list="deceasedclientList" placeholder="Enter Client Name"/>
                                    <datalist id="deceasedclientList"></datalist>
                                </div>  
                            </div>
                            <div class="input-group mg-t-15">
                                <span class="input-group-addon nk-ic-st-pro"><i class="notika-icon notika-edit"></i></span>
                                <div class="nk-int-st">
                                    <%--<input id="upass" type="password" class="form-control" placeholder="Password"/>--%>
                                    <input id="dInterment" type="text" class="form-control" list="intermentsList" placeholder="Select Location"/>
	                                <datalist id="intermentsList"></datalist>
                                </div>
                            </div>
                             <div class="input-group mg-t-15">
                                <span class="input-group-addon nk-ic-st-pro"><i class="notika-icon notika-calendar"></i></span>
                                <div class="nk-int-st">
                                    <%--<input id="upass" type="password" class="form-control" placeholder="Password"/>--%>
                                    <input id="dateOfDeath" type="text" class="form-control" placeholder="Enter Date of Death"/>
                                </div>
                            </div>                            
                            <%--<div class="input-group mg-t-15">
                                <div id="saveNewDeceased" class="recent-post-line rct-pt-mg btn notika-btn-gray btn-reco-mg btn-button-mg waves-effect" style="background-color:#4CAF50!important;">
				                    <span style="color:#fff!important">Save</span>
			                    </div>
                                    <div id="btnClearDeceased" class="recent-post-line rct-pt-mg btn notika-btn-gray btn-reco-mg btn-button-mg waves-effect" style="background-color:#4CAF50!important;margin-left:10px;">
				                    <span style="color:#fff!important">Clear</span>
			                    </div>
                            </div>--%>
                            <%--<a id="loginBtn" class="btn btn-login btn-success btn-float"><i class="notika-icon notika-right-arrow right-arrow-ant"></i></a>--%>
                        </div>
                    </div>
                        </div>
                        <div class="modal-footer">
                            <%--<button id="saveInterment" type="button" class="btn btn-default" >Save changes</button>--%>
                             <div class="input-group mg-t-15">
                                <div id="saveNewDeceased" class="recent-post-line rct-pt-mg btn notika-btn-gray btn-reco-mg btn-button-mg waves-effect" style="background-color:#4CAF50!important;">
				                    <span style="color:#fff!important">Save</span>
			                    </div>
                                    <div id="btnClearDeceased" class="recent-post-line rct-pt-mg btn notika-btn-gray btn-reco-mg btn-button-mg waves-effect" style="background-color:#4CAF50!important;margin-left:10px;">
				                    <span style="color:#fff!important">Clear</span>
			                    </div>
                            </div>
                        </div>             
                    </div>
                </div>
                 </div>
		    </div>	
        </div>
	</div>
    

     <div class="footer-copyright-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="footer-copy-right">
                        <p>Copyright © 2018 . All rights reserved.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/jquery-price-slider.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/meanmenu/jquery.meanmenu.js"></script>
    <script src="js/counterup/jquery.counterup.min.js"></script>
    <script src="js/counterup/waypoints.min.js"></script>
    <script src="js/counterup/counterup-active.js"></script>
    <script src="js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/sparkline/jquery.sparkline.min.js"></script>
    <script src="js/sparkline/sparkline-active.js"></script>
    <script src="js/flot/jquery.flot.js"></script>
    <script src="js/flot/jquery.flot.resize.js"></script>
    <script src="js/flot/flot-active.js"></script>
    <script src="js/knob/jquery.knob.js"></script>
    <script src="js/knob/jquery.appear.js"></script>
    <script src="js/knob/knob-active.js"></script>
    <script src="js/chat/jquery.chat.js"></script>
    <script src="js/todo/jquery.todo.js"></script>
	<script src="js/wave/waves.min.js"></script>
    <script src="js/wave/wave-active.js"></script>
    <script src="js/plugins.js"></script>   
    <script src="js/main.js"></script>
    
    <script src="js/notification/bootstrap-growl.min.js"></script>
    <script src="page_global.js"></script>
    <script src="PageJS/interment.js"></script>    
    <script type="text/javascript">
        $(document).ready(function () {
            ClientJS.init();
        });
    </script>    
</body>
</html>
