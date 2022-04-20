#!/bin/bash
#
# USAGE: bash nextjs-init.sh {project_name}

project_name=$1
pnpm dlx create-next-app --ts ./${project_name}
cd ./${project_name}

# Install devDependencies.
pnpm add -D eslint-plugin-import @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint-plugin-react eslint-plugin-react-hooks eslint-plugin-jsx-a11y@6.5.1 eslint-config-airbnb eslint-plugin-security prettier eslint-config-prettier eslint-plugin-prettier eslint-plugin-sonarjs husky

# Initial Husky.
pnpm dlx husky install && pnpm dlx husky add .husky/pre-commit "npx tsc --noEmit && pnpm dlx eslint . --ext .js,jsx,.ts,.tsx --fix . && pnpm dlx prettier --write --ignore-path .gitignore './**/*.{js,jsx,ts,tsx,json,css}'"

# Manage with javascript.
rm .eslintrc.json

# Add lint:fix and format to package.json
cat <<< $(jq '.scripts."lint:fix" = "eslint . --ext .js,jsx,.ts,.tsx --fix"' package.json) > package.json \
&& cat <<< $(jq '.scripts."format" = "prettier --write --ignore-path .gitignore"' package.json) > package.json

# Download config files
curl -L https://raw.githubusercontent.com/sam159247/nextjs-init/main/.eslintignore -o .eslintignore \
&& curl -L https://raw.githubusercontent.com/sam159247/nextjs-init/main/.eslintrc.js -o .eslintrc.js \
&& curl -L https://raw.githubusercontent.com/sam159247/nextjs-init/main/.prettierignore -o .prettierignore \
&& curl -L https://raw.githubusercontent.com/sam159247/nextjs-init/main/.prettierrc.js -o .prettierrc.js \
&& mkdir .vscode && cd $_ \
&& curl -L https://raw.githubusercontent.com/sam159247/nextjs-init/main/.vscode/extensions.json -o extensions.json \
&& curl -L https://raw.githubusercontent.com/sam159247/nextjs-init/main/.vscode/settings.json -o settings.json

# Open with VSCode.
code ..
