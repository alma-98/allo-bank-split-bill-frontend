import { useEffect, useMemo, useState } from "react";
import DataTable from "../components/table/DataTable";
import Modal from "../components/ui/Modal";
import { getGroups } from "../services/GroupService";

export default function Groups() {

  const [groups, setGroups] = useState<any[]>([]);
  const [search, setSearch] = useState("");
  const [open, setOpen] = useState(false);

  useEffect(() => {
    getGroups()
      .then((data) => setGroups(data))
      .catch(console.error);
  }, []);

  const filtered = useMemo(() => {
    return groups.filter((g) =>
      (g.name || "")
        .toLowerCase()
        .includes(search.toLowerCase())
    );
  }, [groups, search]);

  const totalMembers = groups.reduce(
    (sum, g) => sum + (g.memberCount ?? g.members ?? 0),
    0
  );

  const totalExpense = groups.reduce(
    (sum, g) => sum + (g.totalExpense ?? 0),
    0
  );

  const tableData = filtered.map((g) => ({
    Name: g.name,
    Members: g.memberCount ?? g.members ?? 0,
    Expense: `Rp ${(g.totalExpense ?? 0).toLocaleString("id-ID")}`,
    Status: g.status ?? "Active",
  }));

  return (
    <div className="container">

      <div
        style={{
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
          marginBottom: 20,
        }}
      >
        <div>
          <h1>Groups</h1>
          <p>Manage your split bill groups</p>
        </div>

        <button
          onClick={() => setOpen(true)}
          style={{
            background: "#FFC100",
            border: 0,
            padding: "12px 18px",
            borderRadius: 10,
            cursor: "pointer",
            fontWeight: 700,
          }}
        >
          + Create Group
        </button>
      </div>

      <div
        style={{
          display: "grid",
          gridTemplateColumns: "repeat(4,1fr)",
          gap: 20,
          marginBottom: 25,
        }}
      >
        <div className="card">
          <h3>Total Groups</h3>
          <h2>{groups.length}</h2>
        </div>

        <div className="card">
          <h3>Total Members</h3>
          <h2>{totalMembers}</h2>
        </div>

        <div className="card">
          <h3>Total Expense</h3>
          <h2>Rp {totalExpense.toLocaleString("id-ID")}</h2>
        </div>

        <div className="card">
          <h3>Active Groups</h3>
          <h2>{groups.length}</h2>
        </div>
      </div>

      <div
        style={{
          display: "flex",
          justifyContent: "space-between",
          marginBottom: 20,
        }}
      >
        <input
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          placeholder="Search group..."
          style={{
            width: 320,
            padding: 12,
            borderRadius: 10,
          }}
        />

        <button
          onClick={() => window.location.reload()}
          style={{
            padding: "12px 18px",
            borderRadius: 10,
          }}
        >
          Refresh
        </button>
      </div>

      <DataTable
        columns={[
          "Name",
          "Members",
          "Expense",
          "Status",
        ]}
        data={tableData}
      />

      <Modal
        open={open}
        onClose={() => setOpen(false)}
      >
        <h2>Create Group</h2>

        <input
          placeholder="Group Name"
          style={{
            width: "100%",
            padding: 12,
            marginTop: 20,
          }}
        />

        <br />
        <br />

        <button
          style={{
            background: "#FFC100",
            border: 0,
            padding: "12px 18px",
            borderRadius: 10,
            cursor: "pointer",
          }}
        >
          Save
        </button>
      </Modal>

    </div>
  );
}
