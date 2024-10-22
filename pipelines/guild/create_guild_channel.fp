pipeline "create_guild_channel" {
  title       = "Create Guild Channel"
  description = "Create a new channel for the guild."

  tags = {
    recommended = "true"
  }

  param "conn" {
    type        = connection.discord
    description = local.conn_param_description
    default     = connection.discord.default
  }

  param "guild_id" {
    type        = string
    description = "The ID of the guild."
  }

  param "name" {
    type        = string
    description = "The name for the channel."
  }

  param "type" {
    type        = string
    description = "The type of the channel."
  }

  step "http" "create_guild_channel" {
    method = "post"
    url    = "https://discord.com/api/v10/guilds/${param.guild_id}/channels"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bot ${param.conn.token}"
    }

    request_body = jsonencode({
      name = param.name
      type = param.type
    })
  }

  output "channel" {
    description = "The created channel details."
    value       = step.http.create_guild_channel.response_body
  }
}
