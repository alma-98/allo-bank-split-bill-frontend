import { Routes, Route } from "react-router-dom";

import Layout from "../components/layout/Layout";

import RocketList from "../pages/RocketList";
import RocketDetail from "../pages/RocketDetail";
import NotFound from "../pages/NotFound";

export default function AppRouter() {
  return (
    <Routes>
      <Route element={<Layout />}>
        <Route
          path="/"
          element={<RocketList />}
        />

        <Route
          path="/rockets/:id"
          element={<RocketDetail />}
        />
      </Route>

      <Route
        path="*"
        element={<NotFound />}
      />
    </Routes>
  );
}
