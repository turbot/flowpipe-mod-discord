pipeline "create_message" {
  title       = "Create Message"
  description = "This pipeline sent a message in Discord using the Discord BOT token."

  param "token" {
    description = "Discord BOT token for authentication."
    type        = string
    default     = var.token
  }

  param "channel_id" {
    description = "The ID of the Discord channel where you want to create the discord."
    type        = string
  }

  param "message" {
    description = "The message you want to send to the Discord."
    type        = string
  }

  step "http" "create_message" {
    title  = "title"
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
    description = "The message that was send."
    value       = step.http.create_message.response_body
  }
}