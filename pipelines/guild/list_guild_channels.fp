pipeline "list_guild_channels" {
  title       = "Get Guild Channels"
  description = "Returns a list of guild channels."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  param "guild_id" {
    type        = string
    description = "The ID of the guild."
  }

  step "http" "list_guild_channels" {
    url = "https://discord.com/api/v10/guilds/${param.guild_id}/channels"
    request_headers = {
      Authorization = "Bot ${credential.discord[param.cred].token}"
    }
  }

  output "channels" {
    description = "The list of channels in the guild."
    value       = step.http.list_guild_channels.response_body
  }

}
