pipeline "create_message" {
  title       = "Create Message"
  description = "Post a message to a guild text or DM channel."

  param "token" {
    type        = string
    description = local.token_param_description
    default     = var.token
  }

  param "channel_id" {
    type        = number
    description = "The ID of the channel to send the message to"
  }

  param "message" {
    type        = string
    description = "The message to send."
  }

  step "http" "create_message" {
    method = "post"
    url    = "https://discord.com/api/v10/channels/${param.channel_id}/messages"

    request_headers = {
      Content-Type  = "application/json"
      Authorization = "Bot ${param.token}"
    }

    // Additional fields can be added here as needed
    request_body = jsonencode({
      content = param.message
    })
  }

  output "message" {
    description = "The sent message."
    value       = step.http.create_message.response_body
  }
}