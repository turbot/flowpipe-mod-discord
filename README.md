# Discord Mod for Flowpipe

<!-- ![image](https://github.com/turbot/flowpipe-mod-discord/blob/main/docs/images/flowpipe_test_run.png?raw=true) -->
Discord pipeline library for [Flowpipe](https://flowpipe.io) enabling seamless integration of Discord services into your workflows.

## Documentation

- **[Pipelines →](https://hub.flowpipe.io/mods/turbot/discord/pipelines)**

## Getting Started

### Installation

Download and install Flowpipe (https://flowpipe.io/downloads). Or use Brew:

```sh
brew tap turbot/tap
brew install flowpipe
```

Clone:

```sh
git clone https://github.com/turbot/flowpipe-mod-discord.git
cd flowpipe-mod-discord
```

### Credentials

By default, the following environment variables will be used for authentication:

- `DISCORD_TOKEN`

You can also create `credential` resources in configuration files:

```sh
vi ~/.flowpipe/config/discord.fpc
```

```hcl
credential "discord" "my_discord" {
  token = "00B630jSCGU4jV4o5Yh4KQMAdqizwE2OgVcS7N9UHb"
}
```

For more information on credentials in Flowpipe, please see [Managing Credentials](https://flowpipe.io/docs/run/credentials).

### Usage

List pipelines:

```sh
flowpipe pipeline list
```

Run a pipeline:

```sh
flowpipe pipeline run list_guild_channels
```

You can pass in pipeline arguments as well:

```sh
flowpipe pipeline run create_message --arg channel_id=705216630279993882 --arg message="Hello World!"
```

To use a specific `credential`, specify the `cred` pipeline argument:

```sh
flowpipe pipeline run create_message --arg channel_id=705216630279993882 --arg cred=discord_profile --arg message="Hello World!"
```

For more examples on how you can run pipelines, please see [Run Pipelines](https://flowpipe.io/docs/run/pipelines).

## Open Source & Contributing

This repository is published under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0). Please see our [code of conduct](https://github.com/turbot/.github/blob/main/CODE_OF_CONDUCT.md). We look forward to collaborating with you!

[Flowpipe](https://flowpipe.io) is a product produced from this open source software, exclusively by [Turbot HQ, Inc](https://turbot.com). It is distributed under our commercial terms. Others are allowed to make their own distribution of the software, but cannot use any of the Turbot trademarks, cloud services, etc. You can learn more in our [Open Source FAQ](https://turbot.com/open-source).

## Get Involved

**[Join #flowpipe on Slack →](https://flowpipe.io/community/join)**

Want to help but not sure where to start? Pick up one of the `help wanted` issues:

- [Flowpipe](https://github.com/turbot/flowpipe/labels/help%20wanted)
- [Discord Mod](https://github.com/turbot/flowpipe-mod-discord/labels/help%20wanted)
