pipeline "create_guild_channel" {
  title       = "Create Guild Channel"
  description = "Create a new channel for the guild."

  tags = {
    type = "featured"
  }

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
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
      Authorization = "Bot ${credential.discord[param.cred].token}"
    }

    request_body = jsonencode({
      name = param.name
      type = param.type
    })
  }

  output "channel" {
    description = "The created channel."
    value       = step.http.create_guild_channel.response_body
  }
}
