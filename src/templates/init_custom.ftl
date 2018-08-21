<#--
This file allows you to override and define new FreeMarker variables.
-->

<#------ Define services ----------------------------------------------------------------------------------------------------------------->

<#assign expandoValueLocalService = serviceLocator.findService("com.liferay.expando.kernel.service.ExpandoValueLocalService") />
<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.kernel.service.LayoutLocalService") />
<#--
<#assign journalArticleLocalService = serviceLocator.findService("com.liferay.portlet.journal.service.JournalArticleLocalService") />
-->

<#--
<#assign portletItemLocalService = serviceLocator.findService("com.liferay.portal.service.PortletItemLocalService") />
<#assign portletPreferencesLocalService = serviceLocator.findService("com.liferay.portal.service.PortletPreferencesLocalService") />
<#assign roleLocalService = serviceLocator.findService("com.liferay.portal.service.RoleLocalService") />
<#assign userGroupLocalService = serviceLocator.findService("com.liferay.portal.service.UserGroupLocalService") />
-->

<#------ Expando values ----------------------------------------------------------------------------------------------------------------->

<#assign topnav_article_id = expandoValueLocalService.getData(company_id, "com.liferay.portal.kernel.model.Group", "CUSTOM_FIELDS", "vgr-intra-topnav-article-id", group_id, "")  />

<#assign top_alert_article_id = expandoValueLocalService.getData(company_id, "com.liferay.portal.kernel.model.Group", "CUSTOM_FIELDS", "vgr-intra-top-alert-article-id", group_id, "")  />

<#assign footer_col_1_article_id = expandoValueLocalService.getData(company_id, "com.liferay.portal.kernel.model.Group", "CUSTOM_FIELDS", "vgr-intra-footer-col-1-article-id", group_id, "")  />
<#assign footer_col_2_article_id = expandoValueLocalService.getData(company_id, "com.liferay.portal.kernel.model.Group", "CUSTOM_FIELDS", "vgr-intra-footer-col-2-article-id", group_id, "")  />




<#------ Admin controls -------------------------------------------------->
<#assign custom_show_admin_controls = sessionClicks.get(request, "custom_admin_controls", "custom-admin-controls-closed") />

<#assign css_class = css_class + " " + custom_show_admin_controls />




<#------ Links ----------------------------------------------------------------------------------------------------------------->

<#assign vgr_logo_link = "http://intra.vgregion.se/sv/Insidan/" />


<#------ Macros -------------------------------------------------->

<#-- Include Web Content Display portlet in theme. attribute: group_id is long, article_id is String-->

<#macro includeWCD group_id article_id>
	<#if article_id != "">

		<#local portlet_instance_suffix = "vgrintra" />
		<#local instance_id = "wcd" + article_id + portlet_instance_suffix />
		<#local instance_id = instance_id?substring(0, 12) />

    <#assign VOID = freeMarkerPortletPreferences.reset() />
    <#assign VOID = freeMarkerPortletPreferences.setValue("portletSetupPortletDecoratorId", "barebone") />
    <#assign VOID = freeMarkerPortletPreferences.setValue("groupId", group_id?c) />
    <#assign VOID = freeMarkerPortletPreferences.setValue("articleId", article_id) />

    <@liferay_portlet["runtime"]
        defaultPreferences = "${freeMarkerPortletPreferences}"
        instanceId = "${instance_id}"
        portletName = "com_liferay_journal_content_web_portlet_JournalContentPortlet"
    />

    <#assign VOID = freeMarkerPortletPreferences.reset() />

	<#else>
		&nbsp;
	</#if>
</#macro>

<#--
<#macro includePortlet portlet_id>

		${freeMarkerPortletPreferences.reset()}

		${freeMarkerPortletPreferences.setValue("portletSetupShowBorders","false")}

		${theme.runtime(portlet_id, "", freeMarkerPortletPreferences)}
		${freeMarkerPortletPreferences.reset()}
</#macro>
-->
