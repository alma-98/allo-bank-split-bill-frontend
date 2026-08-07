import { useId } from "react";
import "./Input.css";

interface InputProps
  extends React.InputHTMLAttributes<HTMLInputElement> {
  label?: string;
  helperText?: string;
  error?: string;
}

export default function Input({
  label,
  helperText,
  error,
  id,
  className = "",
  ...props
}: InputProps) {
  const generatedId = useId();
  const inputId = id ?? generatedId;

  return (
    <div className="input-group">
      {label && (
        <label
          htmlFor={inputId}
          className="input-label"
        >
          {label}
        </label>
      )}

      <input
        id={inputId}
        className={[
          "input",
          error ? "input-error" : "",
          className,
        ]
          .filter(Boolean)
          .join(" ")}
        {...props}
      />

      {error ? (
        <span className="input-message error">
          {error}
        </span>
      ) : (
        helperText && (
          <span className="input-message">
            {helperText}
          </span>
        )
      )}
    </div>
  );
}
