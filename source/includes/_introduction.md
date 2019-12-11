# Introduction

This is the alpha version of the Pavo B2B API documentation.

## Libraries and Tools

The following official libraries are available for you to aid in developing your site.

JavaScript (React.js)

```javascript
// Install:
// npm install --save pavob2b

// Setup:
let PavoB2BAPI = require('pavob2b');

let PavoB2B = new PavoB2BAPI({
    /**
     * Your website prefix. If this is not filled in, your existing front-end server URL will be used with "/api/" appended.
     *
     * Example: If your website name is "https://www.example.com" and you do not specify a urlPrefix, all calls will be routed to "https://www.example.com/api/".
    **/
    urlPrefix: "https://api.example.com",
});
```
