pipeline "delete_channel" {
  title       = "Delete Channel"
  description = "Delete a channel, or close a private message."

  param "token" {
    type        = string
    description = local.token_param_description
    default     = var.token
  }

  param "channel_id" {
    type        = string
    description = "The ID of the channel to delete."
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
