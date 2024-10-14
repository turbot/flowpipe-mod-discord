pipeline "create_message" {
  title       = "Create Message"
  description = "Post a message to a guild text or DM channel."

  tags = {
    recommended = "true"
  }

  param "conn" {
    type        = connection.discord
    description = local.conn_param_description
    default     = connection.discord.default
  }

  param "channel_id" {
    type        = string
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
      Authorization = "Bot ${param.conn.token}"
    }

    request_body = jsonencode({
      content = param.message
    })
  }

  output "message" {
    description = "The sent message details."
    value       = step.http.create_message.response_body
  }
}
