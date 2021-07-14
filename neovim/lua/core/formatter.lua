-- autoformat
if O.format_on_save then
    require("lv-utils").define_augroups {
      autoformat = {
        {
          "BufWritePost",
          "*",
          ":silent FormatWrite",
        },
      },
    }
  end

  local status_ok, formatter = pcall(require, "formatter")
  if not status_ok then
    return
  end
  
  if not O.format_on_save then
    vim.cmd [[if exists('#autoformat#BufWritePost')
      :autocmd! autoformat
      endif]]
  end
  