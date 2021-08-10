<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ArtistAlbums.aspx.cs" Inherits="ArtistAlbums" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<!-- set the viewport width and initial-scale on mobile devices -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />

	<!-- set the encoding of your site -->
	<meta charset="utf-8">
	<title>MultiTracks.com</title>
	<!-- include the site stylesheet -->
	
	<link media="all" rel="stylesheet" href="Assets/css/index.css">
</head>
	<body class="premium standard u-fix-fancybox-iframe">
		<form>
			<noscript>
				<div>Javascript must be enabled for the correct page display</div>
			</noscript>

			<!-- allow a user to go to the main content of the page -->
			<a class="accessibility" href="#main" tabindex="21">Skip to Content</a>
       
			<div class="wrapper mod-standard mod-gray">
				<div class="details-banner">
					<div class="details-banner--overlay"></div>
					<div class="details-banner--hero">
						<asp:Image  class="details-banner--hero--img"  id="heroUrl" runat="server" />
					</div>
					<div class="details-banner--info">
						<a href="#" class="details-banner--info--box">
							<asp:Image class="details-banner--info--box--img" id="imgUrl" runat="server" AlternateText="alt" />
						</a>

						<h1 class="details-banner--info--name"><a class="details-banner--info--name--link" href="#" id="artistName" runat="server"></a></h1>
					</div>
				</div>
			
				<nav class="discovery--nav">
					<ul class="discovery--nav--list tab-filter--list u-no-scrollbar">
						<li class="discovery--nav--list--item tab-filter--item">
							<a class="tab-filter" href="ArtistDetails?Id=<%=Id %>">Overview</a>
						</li>
						<li class="discovery--nav--list--item tab-filter--item">
							<a class="tab-filter" href="ArtistSongs?Id=<%=Id %>">Songs</a>
						</li>
						<li class="discovery--nav--list--item tab-filter--item is-active">
							<a class="tab-filter" href="ArtistAlbums?Id=<%=Id %>">Albums</a>
						</li>
					</ul> <!-- /.browse-header-filters -->
				</nav>

				<div class="discovery--container u-container">
							<main class="discovery--section">

								<div class="discovery--space-saver">
									<section class="standard--holder">
										<div class="discovery--section--header">
											<h2>Albums</h2>
										</div><!-- /.discovery-select -->

										<div class="discovery--grid-holder">

											<div class="ly-grid ly-grid-cranberries">
												<asp:Repeater runat="server" ID="topAlbums">
													<ItemTemplate>
														<div class="media-item">
															<a class="media-item--img--link" href="#" tabindex="0">
																<img class="media-item--img" alt="<%#Eval("AlbumTitle") %>" src="<%#Eval("imageURL") %>">
																<span class="image-tag"><%#Eval("year") %></span>
															</a>
															<a class="media-item--title" href="#" tabindex="0"><%#Eval("AlbumTitle") %></a>
															<a class="media-item--subtitle" href="#" tabindex="0"><%#Eval("ArtistName") %></a>
														</div>
													</ItemTemplate>
												</asp:Repeater>


											</div><!-- /.grid -->
										</div><!-- /.discovery-grid-holder -->
									</section><!-- /.songs-section -->
								</div>

								
							</main><!-- /.discovery-section -->
				</div><!-- /.standard-container -->
			</div><!-- /.wrapper -->

			
			

			<a class="accessibility" href="#wrapper" tabindex="20">Back to top</a>
		</form>
	</body>
</html>
