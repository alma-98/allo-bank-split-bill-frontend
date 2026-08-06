import { Search, X } from "lucide-react";
import "./SearchBar.css";

interface SearchBarProps {
  value: string;
  placeholder?: string;
  onChange: (value: string) => void;
}

export default function SearchBar({
  value,
  placeholder = "Search rockets...",
  onChange,
}: SearchBarProps) {
  return (
    <div className="searchbar">
      <Search size={18} className="searchbar-icon" />

      <input
        className="searchbar-input"
        type="text"
        value={value}
        placeholder={placeholder}
        onChange={(e) => onChange(e.target.value)}
      />

      {value && (
        <button
          type="button"
          className="searchbar-clear"
          onClick={() => onChange("")}
          aria-label="Clear search"
        >
          <X size={18} />
        </button>
      )}
    </div>
  );
}
