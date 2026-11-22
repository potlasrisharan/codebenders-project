import type { ButtonHTMLAttributes } from "react";
import { Link, type LinkProps } from "react-router-dom";

export type ButtonVariant = "primary" | "secondary";

function classes(variant: ButtonVariant, extra?: string): string {
  return ["btn", variant === "primary" ? "btn--primary" : "btn--secondary", extra].filter(Boolean).join(" ");
}

export interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: ButtonVariant;
}

export function Button({ variant = "primary", className, type = "button", ...rest }: ButtonProps) {
  return <button type={type} className={classes(variant, className)} {...rest} />;
}

export interface ButtonLinkProps extends LinkProps {
  variant?: ButtonVariant;
}

export function ButtonLink({ variant = "primary", className, ...rest }: ButtonLinkProps) {
  return <Link className={classes(variant, className)} {...rest} />;
}
