pipeline "list_channels" {
  title       = "List Channels"
  description = "This pipeline lists all channels in Discord using the Discord BOT token."

  param "token" {
    description = "Discord BOT token for authentication."
    type        = string
    default     = var.token
  }

  param "guild_id" {
    description = "The ID of the server for which you want to list channels."
    type        = string
  }

  step "http" "list_channels" {
    url = "https://discord.com/api/v10/guilds/${param.guild_id}/channels"
    request_headers = {
      Authorization = "Bot ${param.token}"
    }
  }

  output "channels" {
    value       = step.http.list_channels.response_body
    description = "The list of channels in the server."
  }

}