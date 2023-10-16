pipeline "create_channel" {
  title       = "Create Channel"
  description = "This pipeline creates a channel in Discord using the Discord BOT token."

  param "token" {
    description = "Discord BOT token for authentication."
    type        = string
    default     = var.token
  }

  param "guild_id" {
    description = "The ID of the Discord guild."
    type        = string
  }

  param "name" {
    description = "The name of the Discord channel."
    type        = string
  }

  param "type" {
    description = "The type of the Discord channel."
    type        = string
  }

  step "http" "create_channel" {
    method = "post"
    url    = "https://discord.com/api/v10/guilds/${param.guild_id}/channels"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bot ${param.token}"
    }

    // Additional fields can be added here as needed
    request_body = jsonencode({
      name       = param.name
      type       = param.type
    })
  }

  output "channel" {
    description = "The discord channel that was created."
    value       = step.http.create_channel.response_body
  }
}