# Discord Mod for Flowpipe

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

### Connections

By default, the following environment variables will be used for authentication:

- `DISCORD_TOKEN`

You can also create `connection` resources in configuration files:

```sh
vi ~/.flowpipe/config/discord.fpc
```

```hcl
connection "discord" "my_discord" {
  token = "00B630jSCGU4jV4o5Yh4KQMAdqizwE2OgVcS7N9UHb"
}
```

For more information on connection in Flowpipe, please see [Managing Connections](https://flowpipe.io/docs/run/connections).

### Usage

[Initialize a mod](https://flowpipe.io/docs/build/index#initializing-a-mod):

```sh
mkdir my_mod
cd my_mod
flowpipe mod init
```

[Install the Discord mod](https://flowpipe.io/docs/build/mod-dependencies#mod-dependencies) as a dependency:

```sh
flowpipe mod install github.com/turbot/flowpipe-mod-discord
```

[Use the dependency](https://flowpipe.io/docs/build/write-pipelines/index) in a pipeline step:

```sh
vi my_pipeline.fp
```

```hcl
pipeline "my_pipeline" {

  step "pipeline" "create_message" {
    pipeline = discord.pipeline.create_message
    args = {
      channel_id = "705216630279993882"
      message = "Hello World!"
    }
  }
}
```

[Run the pipeline](https://flowpipe.io/docs/run/pipelines):

```sh
flowpipe pipeline run my_pipeline
```

### Developing

Clone:

```sh
git clone https://github.com/turbot/flowpipe-mod-discord.git
cd flowpipe-mod-discord
```

List pipelines:

```sh
flowpipe pipeline list
```

Run a pipeline:

```sh
flowpipe pipeline run create_message --arg channel_id=705216630279993882 --arg message="Hello World"
```

To use a specific `connection`, specify the `conn` pipeline argument:

```sh
flowpipe pipeline run create_message --arg channel_id=705216630279993882 --arg conn=connection.discord.discord_profile --arg message="Hello World"
```

## Open Source & Contributing

This repository is published under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0). Please see our [code of conduct](https://github.com/turbot/.github/blob/main/CODE_OF_CONDUCT.md). We look forward to collaborating with you!

[Flowpipe](https://flowpipe.io) is a product produced from this open source software, exclusively by [Turbot HQ, Inc](https://turbot.com). It is distributed under our commercial terms. Others are allowed to make their own distribution of the software, but cannot use any of the Turbot trademarks, cloud services, etc. You can learn more in our [Open Source FAQ](https://turbot.com/open-source).

## Get Involved

**[Join #flowpipe on Slack →](https://flowpipe.io/community/join)**

Want to help but not sure where to start? Pick up one of the `help wanted` issues:

- [Flowpipe](https://github.com/turbot/flowpipe/labels/help%20wanted)
- [Discord Mod](https://github.com/turbot/flowpipe-mod-discord/labels/help%20wanted)
