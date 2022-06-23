require("esbuild").build({
  entryPoints: ["./src/index.ts"],
  bundle: true,
  minify: true,
  sourcemap: true,
  platform: 'node',
  outfile: "dist/bundle.js"
}).catch(() => process.exit(1))

