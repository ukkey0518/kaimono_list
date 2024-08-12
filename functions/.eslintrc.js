module.exports = {
  root: true,
  extends: [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "prettier",
  ],
  plugins: ["@typescript-eslint"],
  parser: "@typescript-eslint/parser",
  parserOptions: {
    sourceType: "module",
    project: true,
  },
  env: {
    node: true,
    es2022: true,
  },
  ignorePatterns: [
    "/lib/**/*", // Ignore built files.
    "**/*.js",
  ],
  overrides: [
    {
      files: ["**/*.ts"],
      rules: {
        "@typescript-eslint/no-namespace": "off",
        "no-inner-declarations": "off",
      },
    },
  ],
};
