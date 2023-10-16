pipeline "delete_channel" {
  title       = "Delete Channel"
  description = "This pipeline deletes a channel in Discord by its ID using the Discord BOT ID."

  param "token" {
    description = "Discord BOT token for authentication."
    type        = string
    default     = var.token
  }

  param "channel_id" {
    description = "The ID of the channel you want to delete."
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