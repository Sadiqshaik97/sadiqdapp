// import path from "path";
// import react from "@vitejs/plugin-react";
// import { defineConfig } from "vite";

// export default defineConfig({
//   build: {
//     outDir: "dist",
//   },
//   server: {
//     open: true,
//   },
//   plugins: [
//     react(),
//   ],
//   resolve: {
//     alias: {
//       "@": path.resolve(__dirname, "./frontend"),
//     },
//   },
// });



import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  optimizeDeps: {
    include: ["buffer"],
  },
})
