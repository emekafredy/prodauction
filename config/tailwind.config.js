const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*",
  ],
  theme: {
    screens: {
      xs: "240px",
      sm: "375px",
      md: "768px",
      lg: "1200px",
      xl: "1440px",
    },
    colors: {
      white: {
        100: "#FFFFFF",
        200: "#F3F3F3",
        300: "#FBFBF9",
        400: "#F8F9F5",
      },
      black: {
        100: "#000000",
        200: "#2B2C37",
        300: "#0F0F0F",
      },
      purple: {
        100: "#6F2ED6",
        200: "#4B0082",
        300: "#603FEF",
        400: "#66023C",
        500: "#8A2BE2",
      },
      blue: {
        100: "#191970",
        200: "#2D68F0",
        300: "#070724",
      },
      green: {
        100: "#44B677",
        200: "#009E60",
        300: "#006A4E",
      },
      red: {
        100: "#D21F3C",
        200: "#ED2939",
        300: "#C21807",
      },
    },
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
        lato: ["Lato", "sans-serif"],
        manrope: ["Manrope", "sans-serif"],
        nunito: ["Nunito Sans", "sans-serif"],
        merriweather: ["Merriweather", "sans-serif"],
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
  ],
};
