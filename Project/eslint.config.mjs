import globals from "globals";
import pluginJs from "@eslint/js";

const config = [
  {
    languageOptions: {
      globals: {
        ...globals.browser,
        // Add any additional global variables here if needed
        module: "readonly", // Define 'module' as readonly
        require: "readonly", // Define 'require' as readonly
        exports: "readonly", // Define 'exports' as readonly
		totalDriversFound: "readonly", // Define 'totalDriversFound' as readonly
        admin: "readonly", // Define 'admin' as readonly
        geofire: "readonly", // Define 'geofire' as readonly
        axios: "readonly", // Define 'axios' as readonly
      }
    }
  },
  pluginJs.configs.recommended,
];

export default config;
