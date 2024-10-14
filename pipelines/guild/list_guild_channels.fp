pipeline "list_guild_channels" {
  title       = "Get Guild Channels"
  description = "Returns a list of guild channels."

  param "conn" {
    type        = connection.discord
    description = local.conn_param_description
    default     = connection.discord.default
  }

  param "guild_id" {
    type        = string
    description = "The ID of the guild."
  }

  step "http" "list_guild_channels" {
    url = "https://discord.com/api/v10/guilds/${param.guild_id}/channels"
    request_headers = {
      Authorization = "Bot ${param.conn.token}"
    }
  }

  output "channels" {
    description = "The list of channels in the guild."
    value       = step.http.list_guild_channels.response_body
  }

}
