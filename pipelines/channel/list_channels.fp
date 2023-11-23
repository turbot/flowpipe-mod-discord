pipeline "list_channels" {
  title       = "Get Guild Channels"
  description = "Returns a list of guild channels."

  param "token" {
    description = local.token_param_description
    type        = string
    default     = var.token
  }

  param "guild_id" {
    description = "The ID of the guild."
    type        = number
  }

  step "http" "list_channels" {
    url = "https://discord.com/api/v10/guilds/${param.guild_id}/channels"
    request_headers = {
      Authorization = "Bot ${param.token}"
    }
  }

  output "channels" {
    value       = step.http.list_channels.response_body
    description = "The list of channels in the guild."
  }

}