import { BrowserRouter, Routes, Route } from "react-router-dom";

import RocketList from "../pages/RocketList";
import RocketDetail from "../pages/RocketDetail";

export default function AppRouter() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<RocketList />} />
        <Route path="/rocket/:id" element={<RocketDetail />} />
      </Routes>
    </BrowserRouter>
  );
}
