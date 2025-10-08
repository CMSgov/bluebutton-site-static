import { cva } from "cva";

export const button = cva({
  // base: "usa-button",
  variants: {
    variant: {
      primary: "usa-button",
      secondary: "usa-button usa-button--secondary",
      outline: "usa-button usa-button--outline",
      unstyled: "usa-button usa-button--unstyled",
      link: "usa-link",
    },
    size: {
      medium: "",
      large: "usa-button usa-button--big",
    },
  },
});
