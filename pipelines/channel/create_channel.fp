pipeline "create_channel" {
  title       = "Create Guild Channel"
  description = "Create a new channel for the guild."

  param "token" {
    description = local.token_param_description
    type        = string
    default     = var.token
  }

  param "guild_id" {
    description = "The ID of the guild."
    type        = number
  }

  param "name" {
    description = "The name for the channel."
    type        = string
  }

  param "type" {
    description = "The type of the channel."
    type        = string
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