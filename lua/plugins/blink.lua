return {
    "saghen/blink.cmp",
    version = "1.*",

    dependencies = {
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim",
    },

    opts = {
        keymap = {
            preset = "default",
        },

        appearance = {
            nerd_font_variant = "mono",
        },

        completion = {
            documentation = {
                auto_show = false,
            },

            menu = {
                draw = {
                    components = {
                        kind_icon = {
                            text = function(ctx)
                                return require("lspkind").symbol_map[ctx.kind] or ""
                            end,
                        },
                    },
                },
            },
        },

        sources = {
            default = {
                "lsp",
                "path",
                "snippets",
                "buffer",
            },
        },

        fuzzy = {
            implementation = "prefer_rust_with_warning",
        },
    },

    opts_extend = {
        "sources.default",
    },
}
