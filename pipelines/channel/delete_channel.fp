pipeline "delete_channel" {
  title       = "Delete Channel"
  description = "Delete a channel, or close a private message."

  param "token" {
    description = local.token_param_description
    type        = string
    default     = var.token
  }

  param "channel_id" {
    description = "The ID of the channel to delete."
    type        = string
  }

  step "http" "delete_channel" {
    url    = "https://discord.com/api/v10/channels/${param.channel_id}"
    method = "delete"
    request_headers = {
      Authorization = "Bot ${param.token}"
    }
  }

  output "channel" {
    description = "The deleted channel."
    value       = step.http.delete_channel.response_body
  }
}