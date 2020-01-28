local salesDashboard = import './sales_dashboard.jsonnet';
local installRevenue = std.extVar('installRevenue');

if installRevenue then [salesDashboard] else []
