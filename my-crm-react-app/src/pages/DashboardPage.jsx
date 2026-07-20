import React, { useState, useEffect } from 'react';
import api from '../lib/api';
import { Users, TrendingUp, Clock, CheckSquare } from 'lucide-react';
import { card, h1cls, sub } from '../components/ui/styles';


export const DashboardPage = ({ user }) => {
    const [leads, setLeads] = useState(21);
    const [newToday, setNewToday] = useState(3);
    const [followUps, setFollowUps] = useState(19);
    const [activeTasks, setActiveTasks] = useState(9);
    const [leadSources, setLeadSources] = useState([
        { source: 'Website', leads: 12, percentage: 57 },
        { source: 'Referral', leads: 5, percentage: 24 },
        { source: 'Social Media', leads: 4, percentage: 19 }
    ]);

    const [leadsByStatus, setLeadsByStatus] = useState([
        { status: 'New', count: 5, percentage: 24, color: 'bg-blue-500' },
        { status: 'Contacted', count: 8, percentage: 38, color: 'bg-green-500' },
        { status: 'Qualified', count: 6, percentage: 29, color: 'bg-orange-500' },
        { status: 'Converted', count: 2, percentage: 9, color: 'bg-fuchsia-500' },
    ]);

    const [performance, setPerformance] = useState([
        { label: 'Conversion Rate', value: '—', trend: '' },
        { label: 'Avg. Response Time', value: '—', trend: '' },
        { label: 'Customer Satisfaction', value: '—', trend: '' },
    ]);


    useEffect(() => {
        const fetchDashboardData = async () => {
            try {
                const res = await api.get('/dashboard');
                if (res.data) {
                    if (res.data.leads !== undefined) setLeads(res.data.leads);
                    if (res.data.newToday !== undefined) setNewToday(res.data.newToday);
                    if (res.data.followUps !== undefined) setFollowUps(res.data.followUps);
                    if (res.data.activeTasks !== undefined) setActiveTasks(res.data.activeTasks);
                    if (res.data.leadsByStatus) setLeadsByStatus(res.data.leadsByStatus.map(s => ({...s, color: s.color || 'bg-blue-500'})));
                    if (res.data.performance) setPerformance(res.data.performance);
                }
            } catch (err) {
                console.error("Failed to fetch dashboard data", err);
            }
        };
        const fetchReportsData = async () => {
            try {
                const res = await api.get('/reports');
                if (res.data && res.data.leadSources) setLeadSources(res.data.leadSources);
            } catch (err) {
                console.error("Failed to fetch reports", err);
            }
        };
        fetchDashboardData();
        fetchReportsData();
    }, []);

    if (!user) {
        return <div className="p-8 text-center text-slate-500">Loading user data...</div>;
    }

    return (
        <div className="max-w-7xl mx-auto space-y-8 animate-slide-in">
            <div className="flex flex-col md:flex-row md:items-end justify-between gap-4">
                <div>
                    <h1 className="text-4xl font-extrabold text-slate-900 dark:text-white tracking-tight mb-2">Dashboard</h1>
                    <p className="text-slate-500 dark:text-slate-400 text-lg">Welcome back! Here's what's happening with your CRM.</p>
                </div>
            </div>

            {/* Metrics Grid */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                {[
                    { label: 'Total Leads', value: leads, icon: Users, bg: 'bg-blue-50 dark:bg-blue-900/20', iconColor: 'text-blue-600 dark:text-blue-400' },
                    { label: 'New Leads Today', value: newToday, icon: TrendingUp, bg: 'bg-green-50 dark:bg-green-900/20', iconColor: 'text-green-600 dark:text-green-400' },
                    { label: 'Follow-ups Today', value: followUps, icon: Clock, bg: 'bg-orange-50 dark:bg-orange-900/20', iconColor: 'text-orange-600 dark:text-orange-400' },
                    { label: 'Active Tasks', value: activeTasks, icon: CheckSquare, bg: 'bg-fuchsia-50 dark:bg-fuchsia-900/20', iconColor: 'text-fuchsia-600 dark:text-fuchsia-400' },
                ].map((metric, idx) => {
                    const Icon = metric.icon;
                    return (
                        <div key={idx} className="bg-white dark:bg-[#1E293B] rounded-2xl p-6 shadow-sm border border-slate-100 dark:border-slate-800/60 hover:shadow-md transition-shadow">
                            <div className="flex items-center justify-between mb-4">
                                <div className={`w-12 h-12 rounded-xl flex items-center justify-center ${metric.bg}`}>
                                    <Icon size={24} className={metric.iconColor} strokeWidth={2.5} />
                                </div>
                            </div>
                            <p className="text-slate-500 dark:text-slate-400 text-sm font-medium mb-1">{metric.label}</p>
                            <p className="text-3xl font-bold text-slate-900 dark:text-white tracking-tight">{metric.value}</p>
                        </div>
                    );
                })}
            </div>

            {/* Charts Section */}
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                {/* Leads by Status */}
                <div className="bg-white dark:bg-[#1E293B] rounded-2xl p-8 shadow-sm border border-slate-100 dark:border-slate-800/60">
                    <h2 className="text-xl font-bold text-slate-900 dark:text-white mb-6 tracking-tight">Leads by Status</h2>
                    <div className="space-y-6">
                        {leadsByStatus.map((item, idx) => (
                            <div key={idx}>
                                <div className="flex items-center justify-between mb-2">
                                    <span className="text-sm font-semibold text-slate-700 dark:text-slate-300">{item.status}</span>
                                    <span className="text-sm font-bold text-slate-900 dark:text-white">{item.count}</span>
                                </div>
                                <div className="w-full bg-slate-100 dark:bg-slate-700 rounded-full h-2.5 overflow-hidden">
                                    <div
                                        className={`h-full ${item.color || 'bg-blue-500'} rounded-full transition-all duration-1000 ease-out`}
                                        style={{ width: `${item.percentage}%` }}
                                    ></div>
                                </div>
                            </div>
                        ))}
                    </div>
                </div>

                {/* Lead Sources */}
                <div className="bg-white dark:bg-[#1E293B] rounded-2xl p-8 shadow-sm border border-slate-100 dark:border-slate-800/60">
                    <div className="flex justify-between items-center mb-6">
                        <h2 className="text-xl font-bold text-slate-900 dark:text-white tracking-tight">Lead Sources</h2>
                        <a href="/reports" className="text-sm text-blue-600 dark:text-blue-400 hover:text-blue-700 font-medium">View Report &rarr;</a>
                    </div>
                    <div className="space-y-6">
                        {leadSources.slice(0, 4).map((item, idx) => (
                            <div key={idx}>
                                <div className="flex items-center justify-between mb-2">
                                    <span className="text-sm font-semibold text-slate-700 dark:text-slate-300">{item.source}</span>
                                    <span className="text-sm font-bold text-slate-900 dark:text-white">{item.leads}</span>
                                </div>
                                <div className="w-full bg-slate-100 dark:bg-slate-700 rounded-full h-2.5 overflow-hidden">
                                    <div
                                        className="h-full bg-indigo-500 rounded-full transition-all duration-1000 ease-out"
                                        style={{ width: `${item.percentage}%` }}
                                    ></div>
                                </div>
                            </div>
                        ))}
                        {leadSources.length === 0 && <p className="text-sm text-slate-500 dark:text-slate-400">No source data available.</p>}
                    </div>
                </div>
            </div>
        </div>
    );
};
