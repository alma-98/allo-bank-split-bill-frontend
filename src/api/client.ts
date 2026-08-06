import axios from "axios";

const api = axios.create({
  baseURL: "https://api.spacexdata.com/v4",
  timeout: 10000,
  headers: {
    "Content-Type": "application/json",
    Accept: "application/json",
  },
});

api.interceptors.request.use(
  (config) => {
    console.info(
      `[API] ${config.method?.toUpperCase()} ${config.url}`
    );
    return config;
  },
  (error) => Promise.reject(error)
);

api.interceptors.response.use(
  (response) => response,
  (error) => {
    console.error("[API ERROR]", error);

    if (error.code === "ECONNABORTED") {
      return Promise.reject(
        new Error("Request timeout. Please try again.")
      );
    }

    if (!error.response) {
      return Promise.reject(
        new Error("Network error. Please check your connection.")
      );
    }

    return Promise.reject(error);
  }
);

export default api;
