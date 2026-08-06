import { useEffect, useMemo, useState } from "react";
import DataTable from "../components/table/DataTable";
import Modal from "../components/ui/Modal";
import { getExpenses } from "../services/ExpenseService";

export default function Expenses() {

  const [expenses,setExpenses]=useState<any[]>([]);
  const [search,setSearch]=useState("");
  const [open,setOpen]=useState(false);

  useEffect(()=>{
    getExpenses()
      .then(setExpenses)
      .catch(console.error);
  },[]);

  const filtered=useMemo(()=>{
    return expenses.filter(e=>
      (e.description??"")
      .toLowerCase()
      .includes(search.toLowerCase())
    );
  },[expenses,search]);

  const totalExpense=expenses.reduce(
    (a,b)=>a+(b.amount??0),0
  );

  const paidExpense=expenses
    .filter(e=>e.status==="PAID")
    .reduce((a,b)=>a+(b.amount??0),0);

  const pendingExpense=totalExpense-paidExpense;

  const rows=filtered.map(e=>({
    Description:e.description??"-",
    Group:e.groupName??"-",
    Amount:`Rp ${(e.amount??0).toLocaleString("id-ID")}`,
    PaidBy:e.paidBy??"-",
    Status:e.status??"Pending"
  }));

  return(
    <div className="container">

      <div
        style={{
          display:"flex",
          justifyContent:"space-between",
          alignItems:"center",
          marginBottom:24
        }}
      >

        <div>
          <h1>Expenses</h1>
          <p>Manage all group expenses</p>
        </div>

        <button
          onClick={()=>setOpen(true)}
          style={{
            background:"#FFC100",
            border:0,
            padding:"12px 18px",
            borderRadius:10,
            fontWeight:700,
            cursor:"pointer"
          }}
        >
          + Add Expense
        </button>

      </div>

      <div
        style={{
          display:"grid",
          gridTemplateColumns:"repeat(4,1fr)",
          gap:20,
          marginBottom:24
        }}
      >

        <div className="card">
          <h3>Total Expenses</h3>
          <h2>{expenses.length}</h2>
        </div>

        <div className="card">
          <h3>Total Amount</h3>
          <h2>Rp {totalExpense.toLocaleString("id-ID")}</h2>
        </div>

        <div className="card">
          <h3>Paid</h3>
          <h2>Rp {paidExpense.toLocaleString("id-ID")}</h2>
        </div>

        <div className="card">
          <h3>Pending</h3>
          <h2>Rp {pendingExpense.toLocaleString("id-ID")}</h2>
        </div>

      </div>

      <div
        style={{
          display:"flex",
          justifyContent:"space-between",
          marginBottom:20
        }}
      >

        <input
          value={search}
          onChange={e=>setSearch(e.target.value)}
          placeholder="Search expense..."
          style={{
            width:320,
            padding:12,
            borderRadius:10
          }}
        />

        <button
          onClick={()=>window.location.reload()}
          style={{
            padding:"12px 18px",
            borderRadius:10
          }}
        >
          Refresh
        </button>

      </div>

      <DataTable
        columns={[
          "Description",
          "Group",
          "Amount",
          "PaidBy",
          "Status"
        ]}
        data={rows}
      />

      <Modal
        open={open}
        onClose={()=>setOpen(false)}
      >

        <h2>Add Expense</h2>

        <input
          placeholder="Description"
          style={{
            width:"100%",
            padding:12,
            marginTop:20
          }}
        />

        <br/><br/>

        <input
          placeholder="Amount"
          style={{
            width:"100%",
            padding:12
          }}
        />

        <br/><br/>

        <button
          style={{
            background:"#FFC100",
            border:0,
            padding:"12px 18px",
            borderRadius:10,
            cursor:"pointer"
          }}
        >
          Save
        </button>

      </Modal>

    </div>
  );

}
