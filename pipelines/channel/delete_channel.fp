pipeline "delete_channel" {
  title       = "Delete Channel"
  description = "Delete a channel, or close a private message."

  param "conn" {
    type        = connection.discord
    description = local.conn_param_description
    default     = connection.discord.default
  }

  param "channel_id" {
    type        = string
    description = "The ID of the channel to delete."
  }

  step "http" "delete_channel" {
    url    = "https://discord.com/api/v10/channels/${param.channel_id}"
    method = "delete"
    request_headers = {
      Authorization = "Bot ${param.conn.token}"
    }
  }

  output "channel" {
    description = "The deleted channel."
    value       = step.http.delete_channel.response_body
  }
}
