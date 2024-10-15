mod "discord" {
  title         = "Discord"
  description   = "Run pipelines to supercharge your Discord workflows using Flowpipe."
  color         = "#5865F2"
  documentation = file("./README.md")
  icon          = "/images/mods/turbot/discord.svg"
  categories    = ["library", "messaging"]

  opengraph {
    title       = "Discord Mod for Flowpipe"
    description = "Run pipelines to supercharge your Discord workflows using Flowpipe."
    image       = "/images/mods/turbot/discord-social-graphic.png"
  }

  require {
    flowpipe {
      min_version = "1.0.0"
    }
  }
}
