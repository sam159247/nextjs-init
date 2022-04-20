# nextjs-init

Taking a note to remember how initial a [next.js](https://nextjs.org/) project.

## Specification

- Next.js typescript
- pnpm package manager tool
- husky
- prettier
- Airbnb JavaScript Style Guide

## Pre-install

```shell
brew install pnpm
```

## Snippet

```shell
pnpm dlx create-next-app --ts ./my-ts-next
cd ./my-ts-next

# Install devDependencies.
pnpm add -D eslint-plugin-import @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint-plugin-react eslint-plugin-react-hooks eslint-plugin-jsx-a11y@6.5.1 eslint-config-airbnb eslint-plugin-security prettier eslint-config-prettier eslint-plugin-prettier eslint-plugin-sonarjs husky

# Initial Husky.
pnpm dlx husky install && pnpm dlx husky add .husky/pre-commit "npx tsc --noEmit && pnpm dlx eslint . --ext .js,jsx,.ts,.tsx --fix . && pnpm dlx prettier --write --ignore-path .gitignore './**/*.{js,jsx,ts,tsx,json,css}'"

# Manage with javascript.
rm .eslintrc.json

# Open with VSCode.
code .
```

## Manual part

- Edit `package.json`, add below to `script`.

```json
"lint:fix": "eslint . --ext .js,jsx,.ts,.tsx --fix",
"format": "prettier --write --ignore-path .gitignore './**/*.{js,jsx,ts,tsx,json,css}'"
```

- Copy files to ./my-ts-next

```text
.
├── .eslintignore
├── .eslintrc.js
├── .prettierignore
├── .prettierrc.js
└── .vscode
    ├── extensions.json
    └── settings.json
```

## Reference

- [https://dev.to/joshchu/how-to-setup-prettier-eslint-husky-and-lint-staged-with-a-nextjs-and-typescript-project-i7b](https://dev.to/joshchu/how-to-setup-prettier-eslint-husky-and-lint-staged-with-a-nextjs-and-typescript-project-i7b)

## TODO

- Try [projen](https://github.com/projen/projen)
- Try [Rome](https://rome.tools/)
