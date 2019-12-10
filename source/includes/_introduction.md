# Introduction

This is the alpha version of the Pavo B2B API documentation.

## Libraries and Tools

The following official libraries are available for you to aid in developing your site.

<aside class="notice">
    `urlPrefix` is the base URL that should link to the back-end server to call the endpoints.
</aside>

JavaScript (React.js)

```javascript
// Install:
// npm install --save pavob2b

// Setup:
let PavoB2BAPI = require('pavob2b');

let PavoB2B = new PavoB2BAPI({
    urlPrefix: "https://api.example.com", // Your website prefix
});
```
