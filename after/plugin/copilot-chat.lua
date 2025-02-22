local chat = require("CopilotChat")
local actions = require("CopilotChat.actions")

local prompts = {
  -- Code related prompts
  Explain = "Please explain how the following code works.",
  Review = "Please review the following code and provide suggestions for improvement.",
  Tests = "Please explain how the selected code works, then generate unit tests for it.",
  Refactor = "Please refactor the following code to improve its clarity and readability.",
  FixCode = "Please fix the following code to make it work as intended.",
  FixError = "Please explain the error in the following text and provide a solution.",
  BetterNamings = "Please provide better names for the following variables and functions.",
  Documentation = "Please provide documentation for the following code.",
  SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
  SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
  -- Text related prompts
  Summarize = "Please summarize the following text.",
  Spelling = "Please correct any grammar and spelling errors in the following text.",
  Wording = "Please improve the grammar and wording of the following text.",
  Concise = "Please rewrite the following text to make it more concise.",
}

local opts = {
	question_header = "## User ",
	answer_header = "## Copilot ",
	error_header = "## Error ",
	model = "claude-3.5-sonnet",
	prompts = prompts,
	auto_follow_cursor = false, -- Don't follow the cursor after getting response
	mappings = {
		-- Use tab for completion
		complete = {
			detail = "Use @<Tab> or /<Tab> for options.",
			insert = "<Tab>",
		},
		-- Close the chat
		close = {
			normal = "q",
			insert = "<C-c>",
		},
		-- Reset the chat buffer
		reset = {
			normal = "<C-x>",
			insert = "<C-x>",
		},
		-- Submit the prompt to Copilot
		submit_prompt = {
			normal = "<CR>",
			insert = "<C-CR>",
		},
		-- Accept the diff
		accept_diff = {
			normal = "<C-y>",
			insert = "<C-y>",
		},
		-- Show help
		show_help = {
			normal = "g?",
		},
	},
}

chat.setup(opts)

vim.keymap.set('n', '<leader>ccp', function()
  require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end, { desc = "CopilotChat - Prompt actions" })

-- vim.keymap.set('x', '<leader>ccp', ":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions({selection = require('CopilotChat.select').visual}))<CR>", { desc = "CopilotChat - Prompt actions" })

vim.keymap.set('n', '<leader>cce', function() vim.cmd("CopilotChatExplain<cr>") end, { desc = "CopilotChat - Explain code" })
vim.keymap.set('n', '<leader>cct', function() vim.cmd("CopilotChatTests<cr>") end, { desc = "CopilotChat - Generate tests" })
vim.keymap.set('n', '<leader>ccr', function() vim.cmd("CopilotChatReview<cr>") end, { desc = "CopilotChat - Review code" })
vim.keymap.set('n', '<leader>ccR', function() vim.cmd("CopilotChatRefactor<cr>") end, { desc = "CopilotChat - Refactor code" })
vim.keymap.set('n', '<leader>ccn', function() vim.cmd("CopilotChatBetterNamings<cr>") end, { desc = "CopilotChat - Better Naming" })

-- will not work without setting up new custom functions for this
-- vim.keymap.set('x', '<leader>ccv', function() vim.cmd("CopilotChatVisual<cr>") end, { desc = "CopilotChat - Open in vertical split" })
-- vim.keymap.set('x', '<leader>ccx', function() vim.cmd("CopilotChatInline<cr>") end, { desc = "CopilotChat - Inline chat" })

-- Debug
-- vim.keymap.set('n', '<leader>ccd', function() vim.cmd("CopilotChatDebugInfo") end, { desc = "CopilotChat - Debug Info" })
-- Fix the issue with diagnostic
-- vim.keymap.set('n', '<leader>ccf', function() vim.cmd("CopilotChatFixDiagnostic") end, { desc = "CopilotChat - Fix Diagnostic" })

vim.keymap.set('n', '<leader>cci', function()
	local input = vim.fn.input("Ask Copilot: ")
	if input ~= "" then
		vim.cmd("CopilotChat " .. input)
	end
end, { desc = "CopilotChat - Ask input" })

-- Generate commit message based on the git diff
vim.keymap.set('n', '<leader>ccm', function() vim.cmd("CopilotChatCommit") end, { desc = "CopilotChat - Generate commit message" })

-- Quick chat with Copilot
vim.keymap.set('n', '<leader>ccq', function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    vim.cmd("CopilotChatBuffer " .. input)
  end
end, { desc = "CopilotChat - Quick chat" })


-- Clear buffer and chat history
vim.keymap.set('n', '<leader>ccl', function() vim.cmd("CopilotChatReset") end, { desc = "CopilotChat - Clear buffer and chat history" })

-- Toggle Copilot Chat Vsplit
vim.keymap.set('n', '<leader>ccc', function() vim.cmd("CopilotChatToggle") end, { desc = "CopilotChat - Toggle" })

-- Copilot Chat Models
vim.keymap.set('n', '<leader>cc?', function() vim.cmd("CopilotChatModels") end, { desc = "CopilotChat - Select Models" })

-- Copilot Chat Agents
vim.keymap.set('n', '<leader>cca', function() vim.cmd("CopilotChatAgents") end, { desc = "CopilotChat - Select Agents" })
