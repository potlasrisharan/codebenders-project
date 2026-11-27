/// <reference types="vitest/config" />
import { defineConfig, Plugin } from "vite";
import react from "@vitejs/plugin-react";
import tailwindcss from "@tailwindcss/vite";
import type { IncomingMessage, ServerResponse } from "node:http";
import { app } from "./worker/index";

function honoDevPlugin(): Plugin {
  return {
    name: "hono-dev-middleware",
    configureServer(server) {
      server.middlewares.use(async (req: IncomingMessage, res: ServerResponse, next: () => void) => {
        if (req.url && req.url.startsWith("/api/")) {
          try {
            const protocol = req.headers["x-forwarded-proto"] || "http";
            const host = req.headers.host || "localhost:5173";
            const url = new URL(req.url, `${protocol}://${host}`);

            let body: string | undefined;
            if (["POST", "PUT", "PATCH"].includes(req.method || "")) {
              body = await new Promise<string>((resolve) => {
                let data = "";
                req.on("data", (chunk: Buffer | string) => {
                  data += chunk;
                });
                req.on("end", () => resolve(data));
              });
            }

            const headers = new Headers();
            for (const [key, val] of Object.entries(req.headers)) {
              if (val !== undefined) {
                if (Array.isArray(val)) {
                  val.forEach((v) => headers.append(key, v));
                } else {
                  headers.set(key, String(val));
                }
              }
            }

            const standardReq = new Request(url.toString(), {
              method: req.method,
              headers,
              body,
            });

            const standardRes = await app.fetch(standardReq);

            res.statusCode = standardRes.status;
            standardRes.headers.forEach((val, key) => {
              res.setHeader(key, val);
            });

            const buffer = await standardRes.arrayBuffer();
            res.end(Buffer.from(buffer));
          } catch (err) {
            console.error("Hono middleware error:", err);
            res.statusCode = 500;
            res.end(JSON.stringify({ error: "INTERNAL_SERVER_ERROR" }));
          }
        } else {
          next();
        }
      });
    },
  };
}

export default defineConfig({
  plugins: [tailwindcss(), react(), honoDevPlugin()],
  test: {
    environment: "jsdom",
    globals: true,
    setupFiles: ["./tests/setup.ts"],
  },
});
