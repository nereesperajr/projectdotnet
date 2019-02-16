<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Dashboard One | Notika - Notika Admin Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.css">
    <link rel="stylesheet" href="css/owl.transitions.css">
    <link rel="stylesheet" href="css/meanmenu/meanmenu.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/scrollbar/jquery.mCustomScrollbar.min.css">
    <link rel="stylesheet" href="css/jvectormap/jquery-jvectormap-2.0.3.css">
    <link rel="stylesheet" href="css/notika-custom-icon.css">
    <link rel="stylesheet" href="css/wave/waves.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
    <script type="text/javascript">
        var GoogleMap = {};
        var GoogleMarkers = [];
    </script>
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
                            <li class="nav-item dropdown">
                                <a href="" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><span><i class="notika-icon notika-search"></i></span></a>
                                <div role="menu" class="dropdown-menu search-dd animated flipInX">
                                    <div class="search-input">
                                        <i class="notika-icon notika-left-arrow"></i>
                                        <input type="text" />
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><span><i class="notika-icon notika-mail"></i></span></a>
                                <%--<div role="menu" class="dropdown-menu message-dd animated zoomIn">
                                    <div class="hd-mg-tt">
                                        <h2>Messages</h2>
                                    </div>
                                    <div class="hd-message-info">
                                        <a href="#">
                                            <div class="hd-message-sn">
                                                <div class="hd-message-img">
                                                    <img src="img/post/1.jpg" alt="" />
                                                </div>
                                                <div class="hd-mg-ctn">
                                                    <h3>David Belle</h3>
                                                    <p>Cum sociis natoque penatibus et magnis dis parturient montes</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="hd-message-sn">
                                                <div class="hd-message-img">
                                                    <img src="img/post/2.jpg" alt="" />
                                                </div>
                                                <div class="hd-mg-ctn">
                                                    <h3>Jonathan Morris</h3>
                                                    <p>Cum sociis natoque penatibus et magnis dis parturient montes</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="hd-message-sn">
                                                <div class="hd-message-img">
                                                    <img src="img/post/4.jpg" alt="" />
                                                </div>
                                                <div class="hd-mg-ctn">
                                                    <h3>Fredric Mitchell</h3>
                                                    <p>Cum sociis natoque penatibus et magnis dis parturient montes</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="hd-message-sn">
                                                <div class="hd-message-img">
                                                    <img src="img/post/1.jpg" alt="" />
                                                </div>
                                                <div class="hd-mg-ctn">
                                                    <h3>David Belle</h3>
                                                    <p>Cum sociis natoque penatibus et magnis dis parturient montes</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="hd-message-sn">
                                                <div class="hd-message-img">
                                                    <img src="img/post/2.jpg" alt="" />
                                                </div>
                                                <div class="hd-mg-ctn">
                                                    <h3>Glenn Jecobs</h3>
                                                    <p>Cum sociis natoque penatibus et magnis dis parturient montes</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="hd-mg-va">
                                        <a href="#">View All</a>
                                    </div>
                                </div>--%>
                            </li>
                            <li class="nav-item nc-al"><a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><span><i class="notika-icon notika-alarm"></i></span><div class="spinner4 spinner-4"></div><div class="ntd-ctn"><span>3</span></div></a>
                                <div role="menu" class="dropdown-menu message-dd notification-dd animated zoomIn">
                                    <div class="hd-mg-tt">
                                        <h2>Notification</h2>
                                    </div>
                                    <div class="hd-message-info">
                                        <a href="#">
                                            <div class="hd-message-sn">
                                                <div class="hd-message-img">
                                                    <img src="img/post/1.jpg" alt="" />
                                                </div>
                                                <div class="hd-mg-ctn">
                                                    <h3>David Belle</h3>
                                                    <p>Cum sociis natoque penatibus et magnis dis parturient montes</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="hd-message-sn">
                                                <div class="hd-message-img">
                                                    <img src="img/post/2.jpg" alt="" />
                                                </div>
                                                <div class="hd-mg-ctn">
                                                    <h3>Jonathan Morris</h3>
                                                    <p>Cum sociis natoque penatibus et magnis dis parturient montes</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="hd-message-sn">
                                                <div class="hd-message-img">
                                                    <img src="img/post/4.jpg" alt="" />
                                                </div>
                                                <div class="hd-mg-ctn">
                                                    <h3>Fredric Mitchell</h3>
                                                    <p>Cum sociis natoque penatibus et magnis dis parturient montes</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="hd-message-sn">
                                                <div class="hd-message-img">
                                                    <img src="img/post/1.jpg" alt="" />
                                                </div>
                                                <div class="hd-mg-ctn">
                                                    <h3>David Belle</h3>
                                                    <p>Cum sociis natoque penatibus et magnis dis parturient montes</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="hd-message-sn">
                                                <div class="hd-message-img">
                                                    <img src="img/post/2.jpg" alt="" />
                                                </div>
                                                <div class="hd-mg-ctn">
                                                    <h3>Glenn Jecobs</h3>
                                                    <p>Cum sociis natoque penatibus et magnis dis parturient montes</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="hd-mg-va">
                                        <a href="#">View All</a>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item"><a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><span><i class="notika-icon notika-menus"></i></span><div class="spinner4 spinner-4"></div><div class="ntd-ctn"><span>2</span></div></a>
                                <div role="menu" class="dropdown-menu message-dd task-dd animated zoomIn">
                                    <div class="hd-mg-tt">
                                        <h2>Tasks</h2>
                                    </div>
                                    <div class="hd-message-info hd-task-info">
                                        <div class="skill">
                                            <div class="progress">
                                                <div class="lead-content">
                                                    <p>HTML5 Validation Report</p>
                                                </div>
                                                <div class="progress-bar wow fadeInLeft" data-progress="95%" style="width: 95%;" data-wow-duration="1.5s" data-wow-delay="1.2s"> <span>95%</span>
                                                </div>
                                            </div>
                                            <div class="progress">
                                                <div class="lead-content">
                                                    <p>Google Chrome Extension</p>
                                                </div>
                                                <div class="progress-bar wow fadeInLeft" data-progress="85%" style="width: 85%;" data-wow-duration="1.5s" data-wow-delay="1.2s"><span>85%</span> </div>
                                            </div>
                                            <div class="progress">
                                                <div class="lead-content">
                                                    <p>Social Internet Projects</p>
                                                </div>
                                                <div class="progress-bar wow fadeInLeft" data-progress="75%" style="width: 75%;" data-wow-duration="1.5s" data-wow-delay="1.2s"><span>75%</span> </div>
                                            </div>
                                            <div class="progress">
                                                <div class="lead-content">
                                                    <p>Bootstrap Admin</p>
                                                </div>
                                                <div class="progress-bar wow fadeInLeft" data-progress="93%" style="width: 65%;" data-wow-duration="1.5s" data-wow-delay="1.2s"><span>65%</span> </div>
                                            </div>
                                            <div class="progress progress-bt">
                                                <div class="lead-content">
                                                    <p>Youtube App</p>
                                                </div>
                                                <div class="progress-bar wow fadeInLeft" data-progress="55%" style="width: 55%;" data-wow-duration="1.5s" data-wow-delay="1.2s"><span>55%</span> </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="hd-mg-va">
                                        <a href="#">View All</a>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item"><a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><span><i class="notika-icon notika-chat"></i></span></a>
                                <div role="menu" class="dropdown-menu message-dd chat-dd animated zoomIn">
                                    <div class="hd-mg-tt">
                                        <h2>Chat</h2>
                                    </div>
                                    <div class="search-people">
                                        <i class="notika-icon notika-left-arrow"></i>
                                        <input type="text" placeholder="Search People" />
                                    </div>
                                    <div class="hd-message-info">
                                        <a href="#">
                                            <div class="hd-message-sn">
                                                <div class="hd-message-img chat-img">
                                                    <img src="img/post/1.jpg" alt="" />
                                                    <div class="chat-avaible"><i class="notika-icon notika-dot"></i></div>
                                                </div>
                                                <div class="hd-mg-ctn">
                                                    <h3>David Belle</h3>
                                                    <p>Available</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="hd-message-sn">
                                                <div class="hd-message-img chat-img">
                                                    <img src="img/post/2.jpg" alt="" />
                                                </div>
                                                <div class="hd-mg-ctn">
                                                    <h3>Jonathan Morris</h3>
                                                    <p>Last seen 3 hours ago</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="hd-message-sn">
                                                <div class="hd-message-img chat-img">
                                                    <img src="img/post/4.jpg" alt="" />
                                                </div>
                                                <div class="hd-mg-ctn">
                                                    <h3>Fredric Mitchell</h3>
                                                    <p>Last seen 2 minutes ago</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="hd-message-sn">
                                                <div class="hd-message-img chat-img">
                                                    <img src="img/post/1.jpg" alt="" />
                                                    <div class="chat-avaible"><i class="notika-icon notika-dot"></i></div>
                                                </div>
                                                <div class="hd-mg-ctn">
                                                    <h3>David Belle</h3>
                                                    <p>Available</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#">
                                            <div class="hd-message-sn">
                                                <div class="hd-message-img chat-img">
                                                    <img src="img/post/2.jpg" alt="" />
                                                    <div class="chat-avaible"><i class="notika-icon notika-dot"></i></div>
                                                </div>
                                                <div class="hd-mg-ctn">
                                                    <h3>Glenn Jecobs</h3>
                                                    <p>Available</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="hd-mg-va">
                                        <a href="#">View All</a>
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
                        <li><a href="clients.aspx"><i class="notika-icon notika-picture"></i> Clients</a>
                        </li>
                        <li><a href="map.aspx"><i class="notika-icon notika-map"></i> Map</a>
                        </li>
                        <li><a href="interment.aspx"><i class="notika-icon notika-cloud"></i> Interment Property</a>
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
                        <li><a href="clients.aspx"><i class="notika-icon notika-picture"></i> Clients</a>
                        </li>
                        <li><a href="map.aspx"><i class="notika-icon notika-map"></i> Map</a>
                        </li>
                        <li><a href="interment.aspx"><i class="notika-icon notika-cloud"></i> Interment Property</a>
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
                            <div class="form-example-int form-horizental mg-t-15">
                                 <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                        <label class="hrzn-fm">Status*:</label>
                                    </div>
                                    <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                        <div class="nk-int-st">
                                            <select class="form-control" id="status">
                                                <option value="vacant">Vacant</option>
                                                <option value="occupied">Occupied</option>
                                            </select>                                                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="saveInterment" type="button" class="btn btn-default" >Save changes</button>
                </div>                                
            </div>
        </div>
    </div>
    <div class="modal fade" id="myModaloneClient" role="dialog">
            <div class="modal-dialog modals-default">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-example-int form-horizental">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                        <label class="hrzn-fm">Fullname:</label>
                                    </div>
                                    <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                        <div class="nk-int-st">
                                            <input type="text" id="clientName" class="form-control input-sm" placeholder="Enter Fullname"/>
                                        </div>
                                    </div>
                                </div>
                                    <div class="form-example-int form-horizental mg-t-15">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                            <label class="hrzn-fm">Contact No.:</label>
                                        </div>
                                        <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                            <div class="nk-int-st">
                                                <input type="text" id="cellNo" class="form-control input-sm" placeholder="Enter Contact No."/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    <div class="form-example-int form-horizental mg-t-15">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                            <label class="hrzn-fm">Birthday:</label>
                                        </div>
                                        <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                            <div class="nk-int-st">
                                                <input type="text" id="bday" class="form-control input-sm" placeholder="Enter Birthday"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    <div class="form-example-int form-horizental mg-t-15">
                                        <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                            <label class="hrzn-fm">Address:</label>
                                        </div>
                                        <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                            <div class="nk-int-st">
                                                <input type="text" id="address" class="form-control input-sm" placeholder="Enter Address"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-example-int form-horizental mg-t-15">
                                        <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                            <label class="hrzn-fm">Registration Date:</label>
                                        </div>
                                        <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                            <div class="nk-int-st">
                                                <input type="text" id="regDate" class="form-control input-sm" placeholder="Enter Registration Date"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button id="saveClient" type="button" class="btn btn-default" >Save changes</button>
                    </div>                                
            </div>
        </div>
    </div>
    <div class="container">
       
    </div>
    <!-- Main Menu area End-->
    <!-- Start Status area -->
    <div class="container">
        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="padding-left:4px;float:left;">
            <div class="recent-post">      
                <datalist id="searchdeceasedList"></datalist>
	            <div class="nk-int-st">
                    <%--<input id="upass" type="password" class="form-control" placeholder="Password"/>--%>
                    <input id="searchDeceased" class="form-control" list="searchdeceasedList" placeholder="Enter / Select Deceased Name">
                </div>            
                
            </div>
        </div>
        <button id="searchdeceasedbtn" type="button" class="btn btn-default" >Search</button>                             
        <button id="refreshsearchbtn" type="button" class="btn btn-default" >Refresh</button>                             
        <div class="recent-post-signle" style="margin-top:-2%;float:right!important;" >
	            <div class="recent-post-flex rc-ps-vw">
			        <div id="btnNewInterment" class="recent-post-line rct-pt-mg btn notika-btn-gray btn-reco-mg btn-button-mg waves-effect" style="background-color:#4CAF50!important;" data-toggle="modal" data-target="#myModalone">
				        <p style="color:#fff!important">New Interment</p>
			        </div>
                    <div id="regNewbtn" class="recent-post-line rct-pt-mg btn notika-btn-gray btn-reco-mg btn-button-mg waves-effect" style="background-color:#4CAF50!important;" data-toggle="modal" data-target="#myModaloneClient">
				        <p style="color:#fff!important">Register New Client</p>
			        </div>
		        </div>	        
        </div>
    </div>    
     <div class="google-map-area">
        <div class="container">            
            <div class="row">
                <div class="col-lg-9 col-md-6 col-sm-6 col-xs-12" style="padding:0;">
                    <div class="google-map-single">
                        <div id="map2"></div>
                    </div>                    
                </div>  
                 <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <%-- <div class="panel-heading">
                       
                        <div class="form-example-int form-horizental">

                        </div>
                     </div>   --%>
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
                                    <input id="dInterment" type="text" class="form-control" list="intermentsList" placeholder="Select Location">
	                                <datalist id="intermentsList"></datalist>
                                </div>
                            </div>
                             <div class="input-group mg-t-15">
                                <span class="input-group-addon nk-ic-st-pro"><i class="notika-icon notika-calendar"></i></span>
                                <div class="nk-int-st">
                                    <%--<input id="upass" type="password" class="form-control" placeholder="Password"/>--%>
                                    <input id="dateOfDeath" type="text" class="form-control" placeholder="Enter Date of Death">
                                </div>
                            </div>                             
                            <div class="input-group mg-t-15">
                                <div id="saveNewDeceased" class="recent-post-line rct-pt-mg btn notika-btn-gray btn-reco-mg btn-button-mg waves-effect" style="background-color:#4CAF50!important;">
				                    <span style="color:#fff!important">Save</span>
			                    </div>
                                    <div id="btnClearDeceased" class="recent-post-line rct-pt-mg btn notika-btn-gray btn-reco-mg btn-button-mg waves-effect" style="background-color:#4CAF50!important;margin-left:10px;">
				                    <span style="color:#fff!important">Clear</span>
			                    </div>
                            </div>
                            <%--<a id="loginBtn" class="btn btn-login btn-success btn-float"><i class="notika-icon notika-right-arrow right-arrow-ant"></i></a>--%>
                        </div>
                    </div>
                     <div class="nk-block toggled" style="width: 100%;">
                        <h4>Legend</h4>
                        <div class="nk-form" style="padding: 8px;">
                            <div class="input-group">
                                <span style="text-align:left;font-size: 15px;" class="input-group-addon nk-ic-st-pro"><img src="images/tomb.png"/> - Occupied </span>                                
                            </div>
                            <div class="input-group mg-t-15">
                                <span style="text-align:left;font-size: 15px;" class="input-group-addon nk-ic-st-pro"><img src="images/tomb_2.png"/> - Vacant  </span>                                
                            </div>                            
                            <%--<a id="loginBtn" class="btn btn-login btn-success btn-float"><i class="notika-icon notika-right-arrow right-arrow-ant"></i></a>--%>
                        </div>
                    </div>
                </div>    
             </div>
        </div>
    </div>
    <div class="notika-email-post-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                   <div class="recent-post-wrapper notika-shadow sm-res-mg-t-30 tb-res-ds-n dk-res-ds">
                        <div class="recent-post-ctn">
                            <div class="recent-post-title btn notika-btn-gray btn-reco-mg btn-button-mg waves-effect" style="background-color:#444!important;">
                                <h2 style="color:#fff!important">Clients</h2>
                            </div>
                        </div>
                       <div id="client_list" class="recent-post-items">                           
                        </div>
                    </div>
                </div>               
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="recent-post-wrapper notika-shadow sm-res-mg-t-30 tb-res-ds-n dk-res-ds">
                        <div class="recent-post-ctn">
                            <div class="recent-post-title btn notika-btn-gray btn-reco-mg btn-button-mg waves-effect" style="background-color:#8BC34A!important;">
                                <h2 style="color:#fff!important">Inquiries</h2>
                            </div>
                        </div>
                       <div id="inquiries_list" class="recent-post-items">                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="recent-post-wrapper notika-shadow sm-res-mg-t-30 tb-res-ds-n dk-res-ds">
                        <div class="recent-post-ctn">
                            <div class="recent-post-title btn notika-btn-gray btn-reco-mg btn-button-mg waves-effect" style="background-color:#CDDC39!important;">
                                <h2 style="color:#fff!important">Events</h2>
                            </div>
                        </div>
                       <div id="events_list" class="recent-post-items">                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Realtime sts area-->
    <!-- Start Footer area-->
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
    <script src="js/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="js/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="js/jvectormap/jvectormap-active.js"></script>
    <script src="js/sparkline/jquery.sparkline.min.js"></script>
    <script src="js/sparkline/sparkline-active.js"></script>
    <script src="js/flot/jquery.flot.js"></script>
    <script src="js/flot/jquery.flot.resize.js"></script>
    <script src="js/flot/curvedLines.js"></script>
    <script src="js/flot/flot-active.js"></script>
    <script src="js/knob/jquery.knob.js"></script>
    <script src="js/knob/jquery.appear.js"></script>
    <script src="js/knob/knob-active.js"></script>
    <script src="js/wave/waves.min.js"></script>
    <script src="js/wave/wave-active.js"></script>
    <script src="js/todo/jquery.todo.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/chat/moment.min.js"></script>
    <script src="js/chat/jquery.chat.js"></script>
    <script src="js/main.js"></script>
    <script src="js/google.maps/google.maps2-active.js"></script>
    <%--<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCVOIQ3qXUCmKVVV7DVexPzlgBcj5mQJmQ&callback=initMap"></script>--%>
    <script src="Scripts/app.js"></script>
    <script src="js/notification/bootstrap-growl.min.js"></script>
    <script src="page_global.js"></script>
    <script src="PageJS/index.js"></script>    
    <script src="PageJS/client.js"></script>    
    <script type="text/javascript">
        $(document).ready(function () {
            IndexJS.init();
            ClientJS.init();
        });
    </script>    
    <script>        
        function initMap() {
            GoogleMap = new google.maps.Map(document.getElementById('map2'), {
                zoom: 17,
                center: { lat: 7.0625, lng: 125.585 },
                mapTypeId: google.maps.MapTypeId.HYBRID,
                mapTypeControl: true,
                mapTypeControlOptions: {
                    style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
                    position: google.maps.ControlPosition.TOP_CENTER
                },
                zoomControl: true,
                zoomControlOptions: {
                    position: google.maps.ControlPosition.LEFT_CENTER
                },
                scaleControl: true,
                streetViewControl: true,
                streetViewControlOptions: {
                    position: google.maps.ControlPosition.LEFT_TOP
                },
                fullscreenControl: true
            });

            GoogleMap.setTilt(100);
            var result = [];

            $.ajax({
                type: 'POST',
                url: 'WebService/Index.asmx/GetInterments',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {
                    result = response.d;
                },
                error: function (error) {
                    console.log(error);
                },
                complete: function () {                  

                    var _iList = ""

                    $.each(result.Interment,
                        function (i, val) {
                            var marker = new google.maps.Marker({
                                position: { lat: val.LAT, lng: val.LONG },
                                map: GoogleMap,
                                icon: new google.maps.MarkerImage("images/" + (val.status == 'occupied' ? 'tomb.png' : 'tomb_2.png'))
                            });

                            var _details = "Area " + val.area + ", Blk " + val.blk + ", lot " + val.lot + ", " + val.street;

                            var _detailsMarker = (val.status == 'occupied' ? val.name :  "Area " + val.area + ", Blk " + val.blk + ", lot " + val.lot + ", " + val.street);

                            var infowindow = new google.maps.InfoWindow({
                                content: _detailsMarker
                            });

                            google.maps.event.addListener(marker, 'click', function () {
                                //alert("Hello World");
                                infowindow.open(GoogleMap, marker);
                            });                            

                            _iList += '<option value="' + val.id + " " + _details + '"></option>';
                            GoogleMarkers.push(marker);
                        });
                    $("#intermentsList").html(_iList);
                }
            });  
        }
	  //AIzaSyCVOIQ3qXUCmKVVV7DVexPzlgBcj5mQJmQ
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCVOIQ3qXUCmKVVV7DVexPzlgBcj5mQJmQ&callback=initMap">
    </script>
    <%--<script src="js/tawk-chat.js"></script>--%>
</body>
</html>
