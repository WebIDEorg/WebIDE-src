/*!-----------------------------------------------------------------------------
 * Copyright (c) Microsoft Corporation. All rights reserved.
 * monaco-languages version: 0.9.0(e162b4ba29044167bc7181c42b3270fa8a467424)
 * Released under the MIT license
 * https://github.com/Microsoft/monaco-languages/blob/master/LICENSE.md
 *-----------------------------------------------------------------------------*/
define("vs/basic-languages/src/ini", ["require", "exports"], function(e, n) {
  "use strict";
  Object.defineProperty(n, "__esModule", {
    value: !0
  }), n.conf = {
    comments: {
      lineComment: "#"
    },
    brackets: [
      ["{", "}"],
      ["[", "]"],
      ["(", ")"]
    ],
    autoClosingPairs: [{
      open: "{",
      close: "}"
    }, {
      open: "[",
      close: "]"
    }, {
      open: "(",
      close: ")"
    }, {
      open: '"',
      close: '"'
    }, {
      open: "'",
      close: "'"
    }],
    surroundingPairs: [{
      open: "{",
      close: "}"
    }, {
      open: "[",
      close: "]"
    }, {
      open: "(",
      close: ")"
    }, {
      open: '"',
      close: '"'
    }, {
      open: "'",
      close: "'"
    }]
  }, n.language = {
    defaultToken: "",
    tokenPostfix: ".ini",
    escapes: /\\(?:[abfnrtv\\"']|x[0-9A-Fa-f]{1,4}|u[0-9A-Fa-f]{4}|U[0-9A-Fa-f]{8})/,
    tokenizer: {
      root: [
        [/^\[[^\]]*\]/, "metatag"],
        [/(^\w+)(\s*)(\=)/, ["key", "", "delimiter"]], {
          include: "@whitespace"
        },
        [/\d+/, "number"],
        [/"([^"\\]|\\.)*$/, "string.invalid"],
        [/'([^'\\]|\\.)*$/, "string.invalid"],
        [/"/, "string", '@string."'],
        [/'/, "string", "@string.'"]
      ],
      whitespace: [
        [/[ \t\r\n]+/, ""],
        [/^\s*[#;].*$/, "comment"]
      ],
      string: [
        [/[^\\"']+/, "string"],
        [/@escapes/, "string.escape"],
        [/\\./, "string.escape.invalid"],
        [/["']/, {
          cases: {
            "$#==$S2": {
              token: "string",
              next: "@pop"
            },
            "@default": "string"
          }
        }]
      ]
    }
  }
});
