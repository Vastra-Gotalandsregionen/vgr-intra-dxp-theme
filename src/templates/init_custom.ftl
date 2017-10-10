<#--
This file allows you to override and define new FreeMarker variables.
-->


<#------ Admin controls -------------------------------------------------->
<#assign custom_show_admin_controls = sessionClicks.get(request, "custom_admin_controls", "custom-admin-controls-closed") />

<#assign css_class = css_class + " " + custom_show_admin_controls />




<#------ Links ----------------------------------------------------------------------------------------------------------------->

<#assign vgr_logo_link = "http://intra.vgregion.se/sv/Insidan/" />
