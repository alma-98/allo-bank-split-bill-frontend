import { useEffect, useState } from "react";
import KpiCard from "../components/dashboard/KpiCard";
import { getDashboard } from "../services/DashboardService";
import ErrorMessage from "../components/dashboard/ErrorMessage";
import Loading from "../components/dashboard/Loading";
import ExpenseChart from "../components/dashboard/ExpenseChart";

type DashboardData = {
  totalGroups: number;
  totalExpenses: number;
  totalSettlement: number;
  totalMembers: number;
};

export default function Dashboard() {
  const [dashboard, setDashboard] = useState<DashboardData>({
    totalGroups: 0,
    totalExpenses: 0,
    totalSettlement: 0,
    totalMembers: 0,
  });

  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  useEffect(() => {
    setLoading(true);
    setError("");

    getDashboard()
      .then((data) => {
        setDashboard({
          totalGroups: data.totalGroups ?? 0,
          totalExpenses: data.totalExpenses ?? 0,
          totalSettlement: data.totalSettlement ?? 0,
          totalMembers: data.totalMembers ?? 0,
        });
      })
      .catch(() => {
        setError("Cannot load dashboard");
      })
      .finally(() => {
        setLoading(false);
      });
  }, []);

  if (loading) return <Loading />;

  if (error) return <ErrorMessage message={error} />;

  return (
    <div className="container">
      <h1>Dashboard</h1>

      <p>Financial overview and expense analytics</p>

      <div
        style={{
          display: "grid",
          gridTemplateColumns: "repeat(4,1fr)",
          gap: "20px",
          marginTop: "30px",
        }}
      >
        <KpiCard title="Total Groups" value={dashboard.totalGroups} icon="👥" />
        <KpiCard title="Expenses" value={`Rp ${dashboard.totalExpenses}`} icon="💳" />
        <KpiCard title="Settlement" value={`Rp ${dashboard.totalSettlement}`} icon="💰" />
        <KpiCard title="Members" value={dashboard.totalMembers} icon="👤" />
      </div>

      <div className="card" style={{ marginTop: "30px" }}>
        <h2>Expense Analytics</h2>

        <div
          style={{
            height: "180px",
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            background: "#f8fafc",
            borderRadius: "12px",
          }}
        >
          <ExpenseChart />
        </div>
      </div>

      <div className="card" style={{ marginTop: "30px" }}>
        <h2>Recent Transactions</h2>

        <table style={{ width: "100%" }}>
          <thead>
            <tr>
              <th>Description</th>
              <th>Amount</th>
              <th>Status</th>
            </tr>
          </thead>

          <tbody>
            <tr>
              <td>No transaction</td>
              <td>-</td>
              <td>-</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div className="card" style={{ marginTop: "30px" }}>
        <h2>Quick Actions</h2>

        <div style={{
          display:"flex",
          gap:"12px",
          flexWrap:"wrap"
        }}>
          <button>Create Group</button>
          <button>Add Expense</button>
          <button>Settlement</button>
          <button>Analytics</button>
        </div>
      </div>

    </div>
  );
}
