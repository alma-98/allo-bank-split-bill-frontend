import { BrowserRouter, Routes, Route } from "react-router-dom";
import RocketList from "../pages/RocketList";
import RocketDetail from "../pages/RocketDetail";
import NotFound from "../pages/NotFound";

export default function AppRouter() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<RocketList />} />
        <Route path="/rocket/:id" element={<RocketDetail />} />
        <Route path="*" element={<NotFound />} />
      </Routes>
    </BrowserRouter>
  );
}
