<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<script type="text/javascript" src="${javascript_folder}/pojs.js"></script>

	<@liferay_util["include"] page=top_head_include />
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<div class="container-fluid" id="wrapper">
	<header id="banner" role="banner">

		<#--
		<div id="heading">
			<h1 class="site-title">
				<a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
					<img alt="${logo_description}" height="${site_logo_height}" src="${site_logo}" width="${site_logo_width}" />
				</a>

				<#if show_site_name>
					<span class="site-name" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
						${site_name}
					</span>
				</#if>
			</h1>
		</div>

		<#if !is_signed_in>
			<a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
		</#if>

		<#if has_navigation && is_setup_complete>
			<#include "${full_templates_path}/navigation.ftl" />
		</#if>
		-->

		<a href="#mobileMenuTrigger" id="mobileMenuTrigger">
	        <span class="sr-only">Meny</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	    </a>


		<div id="topBar">
			<div class="container-normal">

				<a class="logo-vgr ${logo_css_class}" href="/">

					<#assign logo_src = images_folder + "/theme/logo/vgr-logo-white.png" />

					<#if layout.layoutSet.isLogo()>
						<#assign logo_src = site_logo />
					</#if>

					<img src="${logo_src}" alt="V&auml;stra G&ouml;talandsregionen" />
				</a>

				<div class="top-bar-tools">

					<div class="top-bar-navigation">

						<#--
						<#if topnav_article_id?has_content>
							<@includeWCD group_id=group_id article_id=topnav_article_id />
						</#if>
						-->

						<#if !is_signed_in>
							<a href="${sign_in_url}" data-redirect="${is_login_redirect_required?string}" id="signIn" class="signin" rel="nofollow">${sign_in_text}</a>
						<#else>
							<a href="${sign_out_url}" id="signOut" class="signout" rel="nofollow">${sign_out_text}</a>
						</#if>

					</div>

					<#--
					<#if show_search>
						<span class="top-search searchbox">
							<#include "${full_templates_path}/search.ftl" />
						</span>
					</#if>
					-->

				</div>

			</div>
		</div>

		<div id="navBar">
			<div class="container-normal">

					<#--
					<div class="tools-wrap">
						<#include "${full_templates_path}/nav_bar_tools.ftl" />
					</div>
					-->

					<div class="navigation-wrap">
						<#if has_navigation || is_signed_in>
							<#--
								<#include "${full_templates_path}/navigation.ftl" />
							-->
							<#include "${full_templates_path}/navigation-with-drop.ftl" />
						</#if>
					</div>
			</div>
		</div>



	</header>

	<section id="content">
		<div class="container-normal">


		<h1 class="hide-accessible">${the_title}</h1>

			<#--
			<nav id="breadcrumbs">
				<@liferay.breadcrumbs />
			</nav>
			-->

			<#if selectable>
				<@liferay_util["include"] page=content_include />
			<#else>
				${portletDisplay.recycle()}

				${portletDisplay.setTitle(the_title)}

				<@liferay_theme["wrap-portlet"] page="portlet.ftl">
					<@liferay_util["include"] page=content_include />
				</@>
			</#if>

		</div>
	</section>

	<div class="footer-push"></div>

</div>

<#include "${full_templates_path}/footer.ftl" />

<div class="js-toggle-admin-mode toggle-admin-mode">
	<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32">
		<path d="M30.276 1.722C29.168.612 27.69 0 26.12 0s-3.044.61-4.153 1.72L4.294 19.29c-.105.105-.185.23-.235.368l-4 11c-.13.355-.05.756.21 1.03.19.204.46.312.73.312.09 0 .19-.014.29-.044l9.95-3.052c.15-.047.29-.133.41-.248l18.62-18.62c1.12-1.11 1.73-2.59 1.73-4.16 0-1.57-.61-3.045-1.73-4.155zM10.092 27.165L6.368 28.31c-.217-.638-.555-1.202-1.016-1.663-.4-.4-.866-.71-1.356-.96L5.7 21H8v2c0 .553.447 1 1 1h1.765l-.673 3.165zm14.72-14.494L12.628 24.86l.35-1.647c.062-.296-.012-.603-.202-.837-.19-.234-.475-.37-.776-.37h-2v-2c0-.552-.448-1-1-1H7.422l11.893-11.83.012.01c.732-.733 1.707-1.136 2.742-1.136s2.01.403 2.74 1.136 1.14 1.707 1.14 2.743c0 1.03-.41 2-1.14 2.74zm4.05-4.05l-.932.94c-.09-1.43-.683-2.76-1.703-3.78s-2.354-1.61-3.787-1.7l.938-.93h.002C24.11 2.406 25.085 2 26.12 2s2.01.403 2.742 1.136C29.596 3.87 30 4.843 30 5.878c0 1.037-.402 2.01-1.138 2.743zm-6.57-.32l-10 10c-.39.39-.39 1.03 0 1.42.195.196.452.294.708.294s.51-.097.707-.292l10-10c.39-.39.39-1.02 0-1.412-.392-.39-1.023-.39-1.414 0z"/>
	</svg>
</div>


<@liferay_util["include"] page=body_bottom_include />

<script type="text/javascript" src="${javascript_folder}/jquery/jquery.min.js"></script>

<script type="text/javascript" src="${javascript_folder}/jq.js"></script>


<@liferay_util["include"] page=bottom_include />

<!-- inject:js -->
<!-- endinject -->

</body>

</html>
