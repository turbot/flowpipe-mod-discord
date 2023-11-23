pipeline "create_message" {
  title       = "Create Message"
  description = "Post a message to a guild text or DM channel."

  param "token" {
    description = local.token_param_description
    type        = string
    default     = var.token
  }

  param "channel_id" {
    description = "The ID of the channel to send the message to"
    type        = number
  }

  param "message" {
    description = "The message to send."
    type        = string
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