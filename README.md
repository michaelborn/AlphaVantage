# ColdBox API Module Template

Use this template to start a new API wrapper in the format of a ColdBox module.

## Getting Started

1. Clone this repo
2. Replace `alphavantage` with your module slug, i.e. `cfynab`
3. Replace `AlphaVantage` with your module name, i.e. `cfYNAB`
4. Replace `michaelborn` with your github user name, i.e. `michaelborn`
5. Create a new github repository
6. Configure the following secrets in the github repository:
   1. `FORGEBOX_TOKEN` - grab this from your [Forgebox profile](https://www.forgebox.io/profile#apitoken)
   2. `GH_TOKEN` - grab this from your [Github Developer settings](https://github.com/settings/tokens)
   3. `ALPHAVANTAGE_API_KEY` - Used for github actions tests. `FINNHUB_API_KEY=mySecretKey`
   4. `ALPHAVANTAGE_API_URL` - Used for github actions tests. `FINNHUB_API_URL=https://sandbox.finnhub.io/api/v1`
7. Code, test, and push to a github repository to use the github actions build.
8. Profit. 💰

# AlphaVantage CFML API wrapper

Wraps the [AlphaVantage](https://alphavantage.io) API for easy CFML usage using the [Hyper](https://github.com/elpete/hyper) ColdBox module.

## Getting Started

1. Install this module - `box install AlphaVantage`
2. Configure AlphaVantage API secrets using `.env`
3. OR configure AlphaVantage API via ColdBox `moduleSettings`

## Environment Variable Configuration

AlphaVantage can mainly be configured using environment variables:

* `ALPHAVANTAGE_API_KEY` - Required API key for authenticating with the AlphaVantage API
* `FINNUHB_API_URL` - base URL of the AlphaVantage API.

You'll need to either use `commandbox-dotenv` to automatically populate environment variables from the `.env` file on server start, or manually read this file to populate environment variables inside your application.

```bash
# .env file
# AlphaVantage API Credentials
ALPHAVANTAGE_API_KEY=
ALPHAVANTAGE_API_URL=https://alphavantage.io/api/v1
```

## ColdBox Module Configuration via ModuleSettings

Set this in `config/ColdBox.cfc` in the `configure()` method:

```js
moduleSettings.alphavantage = {
    apiKey : "blablasecret",
    apiURL : "my.url"
};
```