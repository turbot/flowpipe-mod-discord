pipeline "create_channel" {
  title       = "Create Guild Channel"
  description = "Create a new channel for the guild."

  param "token" {
    type        = string
    description = local.token_param_description
    default     = var.token
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

  step "http" "create_channel" {
    method = "post"
    url    = "https://discord.com/api/v10/guilds/${param.guild_id}/channels"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "${param.token}"
    }

    // Additional fields can be added here as needed
    request_body = jsonencode({
      name = param.name
      type = param.type
    })
  }

  output "channel" {
    description = "The created channel."
    value       = step.http.create_channel.response_body
  }
}
