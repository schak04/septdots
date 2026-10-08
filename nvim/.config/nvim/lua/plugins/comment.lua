return {
    {
        "numToStr/comment.nvim",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        event = "VeryLazy",
        config = function()
            local ok_ts, ts_context = pcall(require, "ts_context_commentstring")
            if ok_ts then
                ts_context.setup({
                    enable_autocmd = false,
                })
            end

            local pre_hook
            local ok_integration, integration = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
            if ok_integration then
                pre_hook = integration.create_pre_hook()
            end

            require("Comment").setup({
                padding = true,
                sticky = true,
                ignore = nil,
                toggler = {
                    line = "gcc",
                    block = "gbc",
                },
                opleader = {
                    line = "gc",
                    block = "gb",
                },
                extra = {
                    above = "gcO",
                    below = "gco",
                    eol = "gcA",
                },
                pre_hook = pre_hook,
            })

            local ft = require("Comment.ft")
            local orig_calculate = ft.calculate
            ft.calculate = function(ctx)
                local ok, parser = pcall(vim.treesitter.get_parser, vim.api.nvim_get_current_buf())
                if not ok or not parser then
                    return ft.get(vim.bo.filetype, ctx.ctype)
                end
                return orig_calculate(ctx)
            end

            ft.set("asm", { ";%s", "/*%s*/" })
            ft.set("nasm", ";%s")
        end,
    },
}
