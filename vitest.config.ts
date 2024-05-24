import { defineConfig } from 'vitest/config';

/**
 * https://vitest.dev/config/file
 */
// eslint-disable-next-line @typescript-eslint/typedef
const Configuration = defineConfig({
    test: {
        // Use the APIs globally like Jest
        globals: true
    },
});

export default Configuration;