const uswds = require("@uswds/compile");

/** USWDS version **/
uswds.settings.version = 3;

/** Paths **/
uswds.paths.dist.img = "./src/assets/uswds/img"
uswds.paths.dist.fonts = "./src/assets/uswds/fonts"
uswds.paths.dist.js = "./src/assets/uswds/js"
uswds.paths.dist.css = "./src/assets/uswds/css"

/** Exports **/
// exports.init = uswds.init; // Use init only once
exports.compile = uswds.compile;
exports.watch = uswds.watch;
exports.updateUswds = uswds.updateUswds;
exports.copyAssets = uswds.copyAssets;
