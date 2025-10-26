return {
  "yetone/avante.nvim",
  build = "make",
  dependencies = {
    "adelarsq/mcphub.nvim",
  },
  opts = {
    provider = "ollama",
    providers = {
      ollama = {
        endpoint = "http://127.0.0.1:11434",
        model = "codellama",
      },
    },
  },
}
