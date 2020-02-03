local salesDashboard = import './sales_dashboard.jsonnet';
local vitalRevenueDashboard = import './vital_revenue_dashboard.jsonnet';
local vitalUserDashboard = import './vital_user_dashboard.jsonnet';
local installRevenue = std.extVar('installRevenue');

if installRevenue then [salesDashboard, vitalRevenueDashboard, vitalUserDashboard] else []
