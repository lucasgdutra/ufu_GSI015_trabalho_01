import type { GatsbyConfig } from "gatsby";

import { createProxyMiddleware, Options } from 'http-proxy-middleware';



const config: GatsbyConfig = {
  siteMetadata: {
    title: `quiz`,
    siteUrl: `https://www.yourdomain.tld`
  },
  // More easily incorporate content into your pages through automatic TypeScript type generation and better GraphQL IntelliSense.
  // If you use VSCode you can also use the GraphQL plugin
  // Learn more at: https://gatsby.dev/graphql-typegen
  graphqlTypegen: true,
  plugins: ["gatsby-plugin-postcss"],
  developMiddleware: (app: any) => {
    const proxyOptions: Options = {
      target: 'http://localhost:8080',
      changeOrigin: true,
      secure: false, // set this to false to ignore SSL certificate
    };

    app.use('/api', createProxyMiddleware(proxyOptions));
  },

};

export default config;
