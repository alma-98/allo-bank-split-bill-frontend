import { useEffect, useMemo, useState } from "react";
import { useSearchParams } from "react-router-dom";
import DataTable from "../components/table/DataTable";
import { getSettlements, generateSettlement } from "../services/SettlementService";

export default function Settlement(){

  const [settlements,setSettlements]=useState<any[]>([]);
  const [search,setSearch]=useState("");

  const [params] = useSearchParams();
  const groupId = params.get("groupId") ?? "";

  const load=()=>{
    getSettlements(groupId)
      .then(setSettlements)
      .catch(console.error);
  };

  useEffect(()=>{
    load();
  },[]);

  const filtered=useMemo(()=>{
    return settlements.filter(s=>
      (s.fromUser??"")
        .toLowerCase()
        .includes(search.toLowerCase()) ||
      (s.toUser??"")
        .toLowerCase()
        .includes(search.toLowerCase())
    );
  },[settlements,search]);

  const totalAmount=settlements.reduce(
    (a,b)=>a+(b.amount??0),0
  );

  const completed=settlements.filter(
    s=>s.status==="COMPLETED"
  ).length;

  const pending=settlements.filter(
    s=>s.status!=="COMPLETED"
  ).length;

  const rows=filtered.map(s=>({
    From:s.fromUser??"-",
    To:s.toUser??"-",
    Amount:`Rp ${(s.amount??0).toLocaleString("id-ID")}`,
    Status:s.status??"Pending"
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
          <h1>Settlement</h1>
          <p>Manage payment settlements</p>
        </div>

        <button
          onClick={()=>{
            generateSettlement(groupId)
              .then(load)
              .catch(console.error);
          }}
          style={{
            background:"#FFC100",
            border:0,
            padding:"12px 18px",
            borderRadius:10,
            cursor:"pointer",
            fontWeight:700
          }}
        >
          Generate Settlement
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
          <h3>Total Settlement</h3>
          <h2>{settlements.length}</h2>
        </div>

        <div className="card">
          <h3>Total Amount</h3>
          <h2>Rp {totalAmount.toLocaleString("id-ID")}</h2>
        </div>

        <div className="card">
          <h3>Completed</h3>
          <h2>{completed}</h2>
        </div>

        <div className="card">
          <h3>Pending</h3>
          <h2>{pending}</h2>
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
          placeholder="Search settlement..."
          style={{
            width:320,
            padding:12,
            borderRadius:10
          }}
        />

        <button
          onClick={load}
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
          "From",
          "To",
          "Amount",
          "Status"
        ]}
        data={rows}
      />

    </div>
  );

}
