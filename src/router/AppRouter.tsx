import { Routes, Route } from "react-router-dom";
import Layout from "../components/layout/Layout";
import Home from "../pages/Home";
import NotFound from "../pages/NotFound";

export default function AppRouter() {
  return (
    <Routes>
      <Route element={<Layout />}>
        <Route
          path="/"
          element={<Home />}
        />
      </Route>

      <Route
        path="*"
        element={<NotFound />}
      />
    </Routes>
  );
}
